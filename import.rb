class Import
    @i = 0 # record count
    @t = Time.now
    @last_processed_id = 0
    
    def self.load_data(file_name, import_type)
        load_loan_data(file_name, import_type)
    end

def self.is_numeric?(s)
    begin
        Float(s)
    rescue
        false # not numeric
    else
        true # numeric
    end
end
    
private

    def self.load_loan_data (file_name, import_type)
        begin
  
            if File.exists?(file_name)
                if import_type == 'training'
                    import_training_loans(file_name)
                # elsif import_type == 'evaluation'
                    # import_evaluation_loans(file_name)
                else
                   raise "Unrecognized import type (must be traning or evaluation)."
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
    
    # def self.import_evaluation_loans(file_name)
    #     CSV.foreach(file_name, encoding: "ISO8859-1") do |loan_id, amount_requested, amount_funded_by_investors, interest_rate, loan_length, application_date, application_expiration_date, issued_date, credit_grade, loan_title, loan_purpose, loan_description, monthly_payment, status, total_amount_funded, debt_to_income_ratio, remaining_principal_funded_by_investors, payments_to_date_funded_by_investors, remaining_principal, payments_to_date, screen_name, city, state, home_ownership, monthly_income, fico_range, earliest_credit_line, open_credit_lines, total_credit_lines, revolving_credit_balance, revolving_line_utilization, inquiries_in_the_last_6_months, accounts_now_delinquent, delinquent_amount, delinquencies_last_2_yrs, months_since_last_delinquency, public_records_on_file, months_since_last_record, education, employment_length, code, initial_listing_status|
    # 
    #         @last_processed_id = loan_id
    #         @i += 1
    #  
    #         progress_report
    # 
    #         # Skip header row || skip empty rows
    #         next if loan_id == "Loan ID" || loan_id == nil
    #         # don't import loans that don't meet the current credit policy
    #         if loan_id == "Loans that do not meet the current credit policy"
    #             break
    #         end
    #     
    #         Loan.create!(:loan_id => loan_id, :amount_requested => amount_requested, :amount_funded_by_investors => amount_funded_by_investors,:interest_rate => interest_rate,:loan_length => loan_length,:application_date => Date.strptime(application_date, '%Y-%m-%d').to_s,:application_expiration_date => Date.strptime(application_expiration_date, '%Y-%m-%d').to_s,:issued_date =>  (issued_date.empty? ? nil : Date.strptime(issued_date, '%Y-%m-%d').to_s) ,:credit_grade => credit_grade.downcase,:loan_title => loan_title.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:loan_purpose => loan_purpose.downcase,:loan_description => loan_description.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:monthly_payment => monthly_payment,:status => status,:total_amount_funded => total_amount_funded,:debt_to_income_ratio => debt_to_income_ratio,:remaining_principal_funded_by_investors => remaining_principal_funded_by_investors,:payments_to_date_funded_by_investors => payments_to_date_funded_by_investors,:remaining_principal => remaining_principal,:payments_to_date => payments_to_date,:screen_name => screen_name.to_s.encode,:city => city,:state => state,:home_ownership => home_ownership.downcase,:monthly_income => monthly_income,:fico_range => fico_range,:earliest_credit_line => Date.strptime(earliest_credit_line, '%Y-%m-%d').to_s,:open_credit_lines => open_credit_lines,:total_credit_lines => total_credit_lines,:revolving_credit_balance => revolving_credit_balance,:revolving_line_utilization => revolving_line_utilization,:inquiries_in_the_last_6_months => inquiries_in_the_last_6_months,:accounts_now_delinquent => accounts_now_delinquent,:delinquent_amount => delinquent_amount,:delinquencies_last_2_yrs => delinquencies_last_2_yrs,:months_since_last_delinquency => months_since_last_delinquency,:public_records_on_file => public_records_on_file,:months_since_last_record => months_since_last_record,:education => education.to_s.encode!('utf-8', :invalid => :replace, :undef => :replace),:employment_length => employment_length,:code => code,:initial_listing_status => initial_listing_status)
    #     end
    # end 
    
    def self.import_training_loans(file_name)
        CSV.foreach(file_name, encoding: "ISO8859-1") do |id, member_id, loan_amnt, funded_amnt, term, int_rate, installment, grade, sub_grade, emp_title, emp_length, home_ownership, annual_inc, is_inc_v, accept_d, exp_d, list_d, issue_d, loan_status, pymnt_plan, url, desc, purpose, title, addr_city, addr_state, acc_now_deliq, acc_open_past_24mths, bc_open_to_buy, percent_bc_gt_75, bc_util, dti, deliq_2yrs, delinq_amnt, earliest_cr_line, fico_range_low, fico_range_high, inq_last_6mths, mths_since_last_delinq, mths_since_last_record, mths_since_recent_inq, mths_since_recent_loan_delinq, mths_since_recent_revol_delinq, mths_since_recent_bc, mort_acc, open_acc, pub_rec_gt_100, pub_rec, total_bal_ex_mort, revol_bal, revol_util, total_bc_limit, total_acc, initial_list_status, out_prncp, out_prncp_inv, total_pymnt, total_pymnt_inv, total_rec_prncp, total_rec_int, total_rec_late_fee, last_pymnt_d, last_pymnt_amnt, next_pymnt_d, last_credit_pull_d, last_fico_range_high, last_fico_range_low, total_il_high_credit_limit, mths_since_oldest_il_open, num_rev_accts, mths_since_recent_bc_dlq, pub_rec_bankruptcies, num_accts_ever_120_pd, chargeoff_within_12_mths, collections_12_mths_ex_med, tax_liens, mths_since_last_major_derog, num_sats, num_tl_op_past_12m, mo_sin_rcnt_tl, tot_hi_cred_lim, tot_cur_bal, avg_cur_bal, num_bc_tl, num_actv_bc_tl, num_bc_sats, pct_tl_nvr_dlq, num_tl_90g_dpd_24m, num_tl_30dpd, num_tl_120dpd_2m, num_il_tl, mo_sin_old_il_acct, num_actv_rev_tl, mo_sin_old_rev_tl_op, mo_sin_rcnt_rev_tl_op, total_rev_hi_lim, num_rev_tl_bal_gt_0, num_op_rev_tl, tot_coll_amt, policy_code|
            @last_processed_id = id
            @i += 2
            
            progress_report
            
            # Skip header row || skip empty rows
            next if id == "id" || id == nil || !is_numeric?(id.to_s)

            Loan.create!(:id => id, :member_id => member_id, :loan_amnt => loan_amnt, :funded_amnt => funded_amnt, :term => term, :int_rate => int_rate, 
            :installment => installment, :grade => grade, :sub_grade => sub_grade, :emp_title => emp_title, :emp_length => emp_length, :home_ownership => home_ownership, 
            :annual_inc => annual_inc, :is_inc_v => is_inc_v, :accept_d => accept_d, :exp_d => exp_d, :list_d => list_d, :issue_d => issue_d, :loan_status => loan_status, 
            :pymnt_plan => pymnt_plan, :url => url, :desc => desc, 
            # :purpose => purpose, 
            :title => title, :addr_city => addr_city, :addr_state => addr_state, 
            :acc_now_deliq => acc_now_deliq, :acc_open_past_24mths => acc_open_past_24mths, :bc_open_to_buy => bc_open_to_buy, :percent_bc_gt_75 => percent_bc_gt_75, 
            :bc_util => bc_util, :dti => dti, :deliq_2yrs => deliq_2yrs, :delinq_amnt => delinq_amnt, :earliest_cr_line => earliest_cr_line, :fico_range_low => fico_range_low, 
            :mths_since_oldest_il_open => mths_since_oldest_il_open, :num_rev_accts => num_rev_accts, :mths_since_recent_bc_dlq => mths_since_recent_bc_dlq, :pub_rec_bankruptcies => pub_rec_bankruptcies,
            :num_accts_ever_120_pd => num_accts_ever_120_pd, :chargeoff_within_12_mths => chargeoff_within_12_mths, :collections_12_mths_ex_med => collections_12_mths_ex_med, 
            :tax_liens => tax_liens, :mths_since_last_major_derog => mths_since_last_major_derog, :num_sats => num_sats, :num_tl_op_past_12m => num_tl_op_past_12m, 
            :mo_sin_rcnt_tl => mo_sin_rcnt_tl, :tot_hi_cred_lim => tot_hi_cred_lim, :tot_cur_bal => tot_cur_bal, :avg_cur_bal => avg_cur_bal, :num_bc_tl => num_bc_tl,
            :num_actv_bc_tl => num_actv_bc_tl, :num_bc_sats => num_bc_sats, :pct_tl_nvr_dlq => pct_tl_nvr_dlq, :num_tl_90g_dpd_24m => num_tl_90g_dpd_24m, :num_tl_30dpd => num_tl_30dpd,
            :num_tl_120dpd_2m => num_tl_120dpd_2m, :num_il_tl => num_il_tl, :mo_sin_old_il_acct => mo_sin_old_il_acct, :num_actv_rev_tl => num_actv_rev_tl,
            :mo_sin_old_rev_tl_op => mo_sin_old_rev_tl_op, :mo_sin_rcnt_rev_tl_op => mo_sin_rcnt_rev_tl_op, :total_rev_hi_lim => total_rev_hi_lim, :num_rev_tl_bal_gt_0 => num_rev_tl_bal_gt_0,
            :num_op_rev_tl => num_op_rev_tl, :tot_coll_amt => tot_coll_amt, :policy_code => policy_code)
           
        end
    end
    
    def self.progress_report
        if @i.remainder(100) == 0 then
            duration = ((Time.now - @t)/1.seconds).round
            puts "#{@i} rows imported in #{duration} seconds or #{@i/duration} records per second"
        end
    end
end