# connect to database: psql -h localhost
# use midas database \c midas
# quit \q

# sample validation query 
# select fico_range, employment_length, earliest_credit_line, home_ownership, n_fico_range, n_employment_length, n_earliest_credit_line, n_home_ownership_own, n_home_ownership_mortgage, n_home_ownership_rent, n_loan_length_36, n_loan_length_60 from loans;

class Normalize

    @standard_fields = [
            :amount_requested,
            :amount_funded_by_investors,
            :total_amount_funded,
            :total_amount_funded,
            :debt_to_income_ratio,
            :remaining_principal_funded_by_investors,
            :payments_to_date_funded_by_investors,
            :remaining_principal,
            :payments_to_date,
            :monthly_income,
            :open_credit_lines,
            :total_credit_lines,
            :revolving_credit_balance,
            :revolving_line_utilization,
            :inquiries_in_the_last_6_months,
            :accounts_now_delinquent,
            :delinquent_amount,
            :delinquencies_last_2_yrs,
            :months_since_last_delinquency,
            :public_records_on_file,
            :months_since_last_record,
            :interest_rate,
         ]
        
    @date_fields = [
            :application_date, # may not be applicable
            :earliest_credit_line
            # :application_expiration_date, # probably not applicable
            # :issued_date, # probably not applicable
        ]

    def self.normalize_values
        @standard_fields.each {|field| normalize_field(field)}
        @date_fields.each {|field| normalize_date_field(field)}

        normalize_FICO('fico_range')
        normalize_employment_length('employment_length')
        normalize_home_ownership('home_ownership')
        normalize_loan_length('loan_length')
        normalize_credit_grade('credit_grade')
        normalize_loan_purpose('loan_purpose')
        normalize_status('status')
    end
   
 #private
    
    def self.normalize_field(field, use_n_value_field = false)
        update_field = "n_#{field}"

        if use_n_value_field == true # use normalized fields for calculation values
            value_field = "n_#{field}"
        else
            value_field = field
        end
        
        puts "field_name --------------------------------------> #{field}" if $debug
        field_average = Loan.average(value_field)
        puts "field_average -> \t #{field_average}" if $debug
        field_stddev = Loan.pluck("stddev(#{value_field})")[0] # pluck returns an array; grab the first (and only) item
        puts "field_stddev -> \t #{field_stddev}" if $debug
        
        # don't devide by 0
        if field_stddev.to_f != 0
            Loan.connection.execute("UPDATE loans SET #{update_field} = (CAST(#{value_field} as float) - #{field_average}) / #{field_stddev};") 
        end
    end


    # http://www.heatonresearch.com/node/2740
    # what is the date thought to be saying? crops, month is more important than year; Antiques, year or possibly decade is most important
    # is it just for sequencing?
    # is it even needed?
    def self.normalize_date_field(field)
         Loan.connection.execute("UPDATE loans SET n_#{field} = DATE_PART('day', #{field} - NOW())/7")
         normalize_field(field, true)
    end

    def self.normalize_FICO(field)
        Loan.connection.execute("UPDATE loans SET n_#{field} = CAST(LEFT(#{field}, 3) as float);") 
        normalize_field(field, true)
    end
    
    def self.normalize_employment_length(field_name)
        Loan.connection.execute("
             UPDATE
                loans SET n_#{field_name} = 
                        CAST(
                            CASE #{field_name}
                                WHEN '< 1 year' THEN 0
                                WHEN '1 year' THEN 1
                                WHEN '2 years' THEN 2
                                WHEN '3 years' THEN 3
                                WHEN '4 years' THEN 4
                                WHEN '5 years' THEN 5
                                WHEN '6 years' THEN 6
                                WHEN '7 years' THEN 7
                                WHEN '8 years' THEN 8
                                WHEN '9 years' THEN 9
                                WHEN '10+ years' THEN 10
                            END 
                        as float);") 
        normalize_field(field_name, true)                                    
    end
    
    def self.normalize_home_ownership(field_name)
        field_options = ["own", "mortgage", "rent"]
        Loan.connection.execute(create_field_cased_sql(field_name, field_options))
    end
    
    def self.normalize_loan_length(field_name)
        field_options = ["36", "60"]
        Loan.connection.execute(create_field_cased_sql(field_name, field_options))
    end
    
    def self.normalize_credit_grade(field_name)
        #create field options and load into array
        field_options = []
            
        ('a'..'g').each do |letter|
             (1..5).each do |number|
                 field_options << "#{letter}#{number}"
             end
        end

        Loan.connection.execute(create_field_cased_sql(field_name, field_options))
    end
    
    def self.normalize_loan_purpose(field_name)
        field_options = ["debt_consolidation", "other", "credit_card", "home_improvement", "small_business", "educational", "vacation", "car", "house", "moving", "wedding"]
        
        Loan.connection.execute(create_field_cased_sql(field_name, field_options))
    end
    
    def self.normalize_status(field_name)
        #field_options = ["Charged Off", "Current", "Default", "Fully Paid", "In Grace Period", "In Review", "Issued", "Late (16-30 days)", "Late (31-120 days)", "Performing Playment Plan" ]
        sql = String.new("UPDATE loans SET n_#{field_name} = CAST ( CASE #{field_name} WHEN 'Fully Paid' THEN 1 WHEN 'Charged Off' THEN -1 ELSE NULL END as integer)")
        
        Loan.connection.execute(sql)
    end
    
    def self.create_field_cased_sql(field_name, field_options)
        # (0..(field_options.length.-1)).each do |i|
        # puts "            t.float :n_#{field_name}_#{field_options[i]} #normalize_#{field_name}"
        # end
        puts "\n----------------> #{field_name}" if $debug
        
        sql = String.new("UPDATE loans SET\n")
        (0..(field_options.length.-1)).each do |i|
            sql << "\tn_#{field_name}_#{field_options[i]} = CAST( CASE #{field_name} WHEN '#{field_options[i]}' THEN 1 ELSE -1 END as float),\n"
        end
        sql.chomp!(",\n")

        # puts sql if $debug
        
        # return sql
    end
    

    
end
