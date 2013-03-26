class Import
    @i = 0 # record count
    @t = Time.now
    @last_processed_id = 0
    
    def self.load_data(file_name, import_type)
        load_loan_data(file_name, import_type)
    end
    
private

    def self.load_loan_data (file_name, import_type)
        begin
  
            if File.exists?(file_name)
                if import_type == 'training'
                    import_training_loans(file_name)
                elsif import_type == 'evaluation'
                    import_evaluation_loans(file_name)
                else
                   raise "Unrecognized import type (not traning nor evaluation)."
                end
            else
                puts "File #{file_name} was not found!"
            end
        rescue Exception => e
            puts "finished record:  #{@i}"
            puts "last read loan_id:  #{@last_processed_id}"
            puts "Exception:  #{e}"
        end
    end
    
    def self.import_training_loans(file_name)
        CSV.foreach(file_name, encoding: "ISO8859-1") do |loan_id, amount_requested, amount_funded_by_investors, interest_rate, loan_length, application_date, application_expiration_date, issued_date, credit_grade, loan_title, loan_purpose, loan_description, monthly_payment, status, total_amount_funded, debt_to_income_ratio, remaining_principal_funded_by_investors, payments_to_date_funded_by_investors, remaining_principal, payments_to_date, screen_name, city, state, home_ownership, monthly_income, fico_range, earliest_credit_line, open_credit_lines, total_credit_lines, revolving_credit_balance, revolving_line_utilization, inquiries_in_the_last_6_months, accounts_now_delinquent, delinquent_amount, delinquencies_last_2_yrs, months_since_last_delinquency, public_records_on_file, months_since_last_record, education, employment_length, code, initial_listing_status|
    
            @last_processed_id = loan_id
            @i += 1
            progress_report

            # Skip header row || skip empty rows
            next if loan_id == "Loan ID" || loan_id == nil
            # don't import loans that don't meet the current credit policy
            if loan_id == "Loans that do not meet the current credit policy"
                break
            end
        
            Loan.create!(:loan_id => loan_id, :amount_requested => amount_requested, :amount_funded_by_investors => amount_funded_by_investors,:interest_rate => interest_rate,:loan_length => loan_length,:application_date => Date.strptime(application_date, '%Y-%m-%d').to_s,:application_expiration_date => Date.strptime(application_expiration_date, '%Y-%m-%d').to_s,:issued_date =>  (issued_date.empty? ? nil : Date.strptime(issued_date, '%Y-%m-%d').to_s) ,:credit_grade => credit_grade.downcase,:loan_title => loan_title.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:loan_purpose => loan_purpose.downcase,:loan_description => loan_description.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:monthly_payment => monthly_payment,:status => status,:total_amount_funded => total_amount_funded,:debt_to_income_ratio => debt_to_income_ratio,:remaining_principal_funded_by_investors => remaining_principal_funded_by_investors,:payments_to_date_funded_by_investors => payments_to_date_funded_by_investors,:remaining_principal => remaining_principal,:payments_to_date => payments_to_date,:screen_name => screen_name.to_s.encode,:city => city,:state => state,:home_ownership => home_ownership.downcase,:monthly_income => monthly_income,:fico_range => fico_range,:earliest_credit_line => Date.strptime(earliest_credit_line, '%Y-%m-%d').to_s,:open_credit_lines => open_credit_lines,:total_credit_lines => total_credit_lines,:revolving_credit_balance => revolving_credit_balance,:revolving_line_utilization => revolving_line_utilization,:inquiries_in_the_last_6_months => inquiries_in_the_last_6_months,:accounts_now_delinquent => accounts_now_delinquent,:delinquent_amount => delinquent_amount,:delinquencies_last_2_yrs => delinquencies_last_2_yrs,:months_since_last_delinquency => months_since_last_delinquency,:public_records_on_file => public_records_on_file,:months_since_last_record => months_since_last_record,:education => education.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:employment_length => employment_length,:code => code,:initial_listing_status => initial_listing_status)
        end
    end
    
    def self.import_evaluation_loans(file_name)
        CSV.foreach(file_name, encoding: "ISO8859-1") do |id, member_id, loan_amnt, funded_amnt, term, apr, int_rate, exp_default_rate, service_fee_rate, installment, grade, sub_grade, emp_name, emp_length, emp_status, home_ownership, other_home_ownership, annual_inc, is_inc_v, accept_d, exp_d, list_d, credit_pull_d, review_status_d, review_status, url, desc, purpose, title, addr_city, addr_state, msa, investor_count, acc_now_delinq, acc_open_past_24mths, bc_open_to_buy, percent_bc_gt_75, bc_util, dti, delinq_2yrs, delinq_amnt, earliest_cr_line, fico_range_low, fico_range_high, inq_last_6mths, mths_since_last_delinq, mths_since_last_record, mths_since_recent_inq, mths_since_recent_loan_delinq, mths_since_recent_revol_delinq, mths_since_recent_bc, mort_acc, open_acc, pub_rec_gt_100, pub_rec, total_bal_ex_mort, revol_bal, revol_util, total_bc_limit, total_acc, in28, bi20, re01, bc36, initial_list_status, ils_exp_d, pub_rec_bankruptcies, g044, chargeoff_within_12_mths, collections_12_mths_ex_med, tax_liens, s062|
            @last_processed_id = id
            @i += 2
            
            progress_report
            
            # Skip header row || skip empty rows
            next if id == "id" || id == nil
            
            Evaluation_Loan.create!(:id => id, :member_id => member_id, :loan_amnt => loan_amnt, :funded_amnt => funded_amnt, :term => term, :apr => apr, :int_rate => int_rate, :exp_default_rate => exp_default_rate, :service_fee_rate => service_fee_rate, :installment => installment, :grade => grade, :sub_grade => sub_grade, :emp_name => emp_name, :emp_length => emp_length, :emp_status => emp_status, :home_ownership => home_ownership, :other_home_ownership => other_home_ownership, :annual_inc => annual_inc, :is_inc_v => is_inc_v, 
            :accept_d => Date.strptime(accept_d, '%m-%d-%Y').to_s, :exp_d => (exp_d.empty? ? nil : Date.strptime(exp_d, '%m-%d-%Y').to_s), :list_d => (list_d.empty? ? nil : Date.strptime(list_d, '%m-%d-%Y').to_s), 
            # These dates will not load even though the format appears to be correct
            # :credit_pull_d => (credit_pull_d.empty? ? nil : Date.strptime(credit_pull_d, '%m-%d-%Y').to_s),  
            # :review_status_d => (review_status_d.empty? ? nil : Date.strptime(review_status_d, '%m-%d-%Y').to_s), 
            :review_status => review_status, :url => url, :desc => desc.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace), :purpose => purpose, :title => title.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace), :addr_city => addr_city, :addr_state => addr_state, :msa => msa, :investor_count => investor_count, :acc_now_delinq => acc_now_delinq, :acc_open_past_24mths => acc_now_delinq, :bc_open_to_buy => bc_open_to_buy, :percent_bc_gt_75 => percent_bc_gt_75, :bc_util => bc_util, :dti => dti, :delinq_2yrs => delinq_2yrs, :delinq_amnt => delinq_amnt, :earliest_cr_line => earliest_cr_line, :fico_range_low => fico_range_low, :fico_range_high => fico_range_high, :inq_last_6mths => inq_last_6mths, :mths_since_last_delinq => mths_since_last_delinq, :mths_since_last_record => mths_since_last_record, :mths_since_recent_inq => mths_since_recent_inq, :mths_since_recent_loan_delinq => mths_since_recent_loan_delinq, :mths_since_recent_revol_delinq => mths_since_recent_revol_delinq, :mths_since_recent_bc => mths_since_recent_bc, :mort_acc => mort_acc, :open_acc => open_acc, :pub_rec_gt_100 => pub_rec_gt_100, :pub_rec => pub_rec, :total_bal_ex_mort => total_bal_ex_mort, :revol_bal => revol_bal, :revol_util => revol_util, :total_bc_limit => total_bc_limit, :total_acc => total_acc, :in28 => in28, :bi20 => bi20, :re01 => re01, :bc36 => bc36, :initial_list_status => initial_list_status, :ils_exp_d => ils_exp_d, :pub_rec_bankruptcies => pub_rec_bankruptcies, :g044 => g044, :chargeoff_within_12_mths => chargeoff_within_12_mths, :collections_12_mths_ex_med => collections_12_mths_ex_med, :tax_liens => tax_liens, :s062 => s062)
        end
    end
    
    def self.progress_report
        if @i.remainder(100) == 0 then
            duration = ((Time.now - @t)/1.seconds).round
            puts "#{@i} rows imported in #{duration} seconds or #{@i/duration} records per second"
        end
    end
end