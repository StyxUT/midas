class Import

    def self.load_data(file_name)
        load_raw_loan_data(file_name)
    end

private
    def self.load_raw_loan_data (file_name)
        begin
            i = 0 # record count
            t = Time.now
            last_processed_id = 0

            if File.exists?(file_name)
                CSV.foreach(file_name, encoding: "ISO8859-1") do |loan_id, amount_requested, amount_funded_by_investors, interest_rate, loan_length, application_date, application_expiration_date, issued_date, credit_grade, loan_title, loan_purpose, loan_description, monthly_payment, status, total_amount_funded, debt_to_income_ratio, remaining_principal_funded_by_investors, payments_to_date_funded_by_investors, remaining_principal, payments_to_date, screen_name, city, state, home_ownership, monthly_income, fico_range, earliest_credit_line, open_credit_lines, total_credit_lines, revolving_credit_balance, revolving_line_utilization, inquiries_in_the_last_6_months, accounts_now_delinquent, delinquent_amount, delinquencies_last_2_yrs, months_since_last_delinquency, public_records_on_file, months_since_last_record, education, employment_length, code, initial_listing_status|

                    last_processed_id = loan_id
                    i += 1
                    # Skip header row || skip empty rows
                    next if loan_id == "Loan ID" || loan_id == nil
                    # don't import loans that don't meet the current credit policy
                    if loan_id == "Loans that do not meet the current credit policy"
                        break
                    end
                
                    if i.remainder(10000) == 0 then
                        duration = ((Time.now - t)/1.seconds).round
                        puts "#{i} rows imported in #{duration} seconds or #{i/duration} records per second"
                    end
                    Loan.create!(:loan_id => loan_id, :amount_requested => amount_requested, :amount_funded_by_investors => amount_funded_by_investors,:interest_rate => interest_rate,:loan_length => loan_length,:application_date => Date.strptime(application_date, '%Y-%m-%d').to_s,:application_expiration_date => Date.strptime(application_expiration_date, '%Y-%m-%d').to_s,:issued_date =>  (issued_date.empty? ? nil : Date.strptime(issued_date, '%Y-%m-%d').to_s) ,:credit_grade => credit_grade.downcase,:loan_title => loan_title.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:loan_purpose => loan_purpose.downcase,:loan_description => loan_description.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:monthly_payment => monthly_payment,:status => status,:total_amount_funded => total_amount_funded,:debt_to_income_ratio => debt_to_income_ratio,:remaining_principal_funded_by_investors => remaining_principal_funded_by_investors,:payments_to_date_funded_by_investors => payments_to_date_funded_by_investors,:remaining_principal => remaining_principal,:payments_to_date => payments_to_date,:screen_name => screen_name.to_s.encode,:city => city,:state => state,:home_ownership => home_ownership.downcase,:monthly_income => monthly_income,:fico_range => fico_range,:earliest_credit_line => Date.strptime(earliest_credit_line, '%Y-%m-%d').to_s,:open_credit_lines => open_credit_lines,:total_credit_lines => total_credit_lines,:revolving_credit_balance => revolving_credit_balance,:revolving_line_utilization => revolving_line_utilization,:inquiries_in_the_last_6_months => inquiries_in_the_last_6_months,:accounts_now_delinquent => accounts_now_delinquent,:delinquent_amount => delinquent_amount,:delinquencies_last_2_yrs => delinquencies_last_2_yrs,:months_since_last_delinquency => months_since_last_delinquency,:public_records_on_file => public_records_on_file,:months_since_last_record => months_since_last_record,:education => education.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:employment_length => employment_length,:code => code,:initial_listing_status => initial_listing_status)
             
                 # Loan.create!(:loan_id => loan_id, :amount_requested => amount_requested, :amount_funded_by_investors => amount_funded_by_investors,:interest_rate => interest_rate,:loan_length => loan_length,:application_date => Date.strptime(application_date, '%m-%d-%y').to_s,:application_expiration_date => Date.strptime(application_expiration_date, '%m-%d-%y').to_s,:issued_date => Date.strptime(issued_date, '%m-%d-%y').to_s,:credit_grade => credit_grade.downcase,:loan_title => loan_title.to_s.encode!('utf-8', 'binary', :invalid => :replace, :undef => :replace),:loan_purpose => loan_purpose.downcase,:loan_description => loan_description.to_s.encode!('utf-8', 'binary', :invalid => :replace, :undef => :replace),:monthly_payment => monthly_payment,:status => status,:total_amount_funded => total_amount_funded,:debt_to_income_ratio => debt_to_income_ratio,:remaining_principal_funded_by_investors => remaining_principal_funded_by_investors,:payments_to_date_funded_by_investors => payments_to_date_funded_by_investors,:remaining_principal => remaining_principal,:payments_to_date => payments_to_date,:screen_name => screen_name.to_s.encode,:city => city,:state => state,:home_ownership => home_ownership.downcase,:monthly_income => monthly_income,:fico_range => fico_range,:earliest_credit_line => Date.strptime(earliest_credit_line, '%m-%d-%y').to_s,:open_credit_lines => open_credit_lines,:total_credit_lines => total_credit_lines,:revolving_credit_balance => revolving_credit_balance,:revolving_line_utilization => revolving_line_utilization,:inquiries_in_the_last_6_months => inquiries_in_the_last_6_months,:accounts_now_delinquent => accounts_now_delinquent,:delinquent_amount => delinquent_amount,:delinquencies_last_2_yrs => delinquencies_last_2_yrs,:months_since_last_delinquency => months_since_last_delinquency,:public_records_on_file => public_records_on_file,:months_since_last_record => months_since_last_record,:education => education.to_s.encode!('utf-8', 'binary', :invalid => :replace, :undef => :replace),:employment_length => employment_length,:code => code,:initial_listing_status => initial_listing_status)
         
                end
                duration = ((Time.now - t)/1.seconds).round
                puts "#{i} rows imported in #{duration} seconds or #{i/duration} records per second"
            else
                puts "File #{file_name} was not found!"
            end
        rescue Exception => e
            puts "finished record #{i}"
            puts "last read loan_id #{last_processed_id}"
            puts "Exception:  #{e}"
        end
    end
end