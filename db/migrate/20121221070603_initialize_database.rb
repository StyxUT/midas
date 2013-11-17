# rake db:new_migration name=foo_bar_migration
# edit db/migrate/20081220234130_foo_bar_migration.rb

class InitializeDatabase < ActiveRecord::Migration
  def up
      create_table :loans do |t|
          t.integer :id
            t.integer :member_id
            t.float :loan_amnt
            t.float :funded_amnt
            t.string :term
            t.float :int_rate
            t.float :installment
            t.string :grade
            t.string :sub_grade
            t.string :emp_title
            t.string :emp_length
            t.string :home_ownership
            t.integer :annual_inc
            t.boolean :is_inc_v
            t.date :accept_d
            t.date :exp_d
            t.date :list_d
            t.date :issue_d
            t.string :loan_status
            t.string :pymnt_plan
            t.string :url
            t.string :desc
            t.string :purpose
            t.string :title
            t.string :addr_city
            t.string :addr_state
            t.integer :acc_now_deliq
            t.integer :acc_open_past_24mths
            t.integer :bc_open_to_buy
            t.float :percent_bc_gt_75
            t.float :bc_util
            t.float :dti
            t.integer :deliq_2yrs
            t.float :delinq_amnt
            t.date :earliest_cr_line
            t.integer :fico_range_low
            t.integer :fico_range_high
            t.integer :inq_last_6mths
            t.integer :mths_since_last_delinq
            t.integer :mths_since_last_record
            t.integer :mths_since_recent_inq
            t.integer :mths_since_recent_loan_delinq
            t.integer :mths_since_recent_revol_delinq
            t.integer :mths_since_recent_bc
            t.integer :mort_acc
            t.integer :open_acc
            t.integer :pub_rec_gt_100
            t.integer :pub_rec
            t.integer :total_bal_ex_mort
            t.integer :revol_bal
            t.float :revol_util
            t.integer :total_bc_limit
            t.integer :total_acc
            t.string :initial_list_status
            t.float :out_prncp
            t.float :out_prncp_inv
            t.float :total_pymnt
            t.float :total_pymnt_inv
            t.float :total_rec_prncp
            t.float :total_rec_int
            t.float :total_rec_late_fee
            t.date :last_pymnt_d
            t.float :last_pymnt_amnt
            t.date :next_pymnt_d
            t.date :last_credit_pull_d
            t.integer :last_fico_range_high
            t.integer :last_fico_range_low
            t.integer :total_il_high_credit_limit
            t.integer :mths_since_oldest_il_open
            t.integer :num_rev_accts
            t.integer :mths_since_recent_bc_dlq
            t.integer :pub_rec_bankruptcies
            t.integer :num_accts_ever_120_pd
            t.integer :chargeoff_within_12_mths
            t.integer :collections_12_mths_ex_med
            t.integer :tax_liens
            t.integer :mths_since_last_major_derog
            t.integer :num_sats
            t.integer :num_tl_op_past_12m
            t.integer :mo_sin_rcnt_tl
            t.integer :tot_hi_cred_lim
            t.integer :tot_cur_bal
            t.integer :avg_cur_bal
            t.integer :num_bc_tl
            t.integer :num_actv_bc_tl
            t.integer :num_bc_sats
            t.integer :pct_tl_nvr_dlq
            t.integer :num_tl_90g_dpd_24m
            t.integer :num_tl_30dpd
            t.integer :num_tl_120dpd_2m
            t.integer :num_il_tl
            t.integer :mo_sin_old_il_acct
            t.integer :num_actv_rev_tl
            t.integer :mo_sin_old_rev_tl_op
            t.integer :mo_sin_rcnt_rev_tl_op
            t.integer :total_rev_hi_lim
            t.integer :num_rev_tl_bal_gt_0
            t.integer :num_op_rev_tl
            t.integer :tot_coll_amt
            t.integer :policy_code
          
          
              
          # # normalized fields
          t.float :loan_amnt  #standard_normalization
          # t.float :n_amount_funded_by_investors #standard_normalization
          # t.float :n_interest_rate #standard_normalization
          # t.float :n_application_date #normalize_date_field
          # t.float :n_monthly_payment #standard_normalization
          # t.float :n_total_amount_funded #standard_normalization
          # t.float :n_debt_to_income_ratio #standard_normalization
          # t.float :n_remaining_principal_funded_by_investors #standard_normalization
          # t.float :n_payments_to_date_funded_by_investors #standard_normalization
          # t.float :n_remaining_principal #standard_normalization
          # t.float :n_payments_to_date #standard_normalization
          # t.float :n_monthly_income #standard_normalization
          # t.float :n_fico_range #normalize_FICO
          # t.float :n_earliest_credit_line #normalize_date_field
          # t.float :n_open_credit_lines #standard_normalization
          # t.float :n_total_credit_lines #standard_normalization
          # t.float :n_revolving_credit_balance #standard_normalization
          # t.float :n_revolving_line_utilization #standard_normalization
          # t.float :n_inquiries_in_the_last_6_months #standard_normalization
          # t.float :n_accounts_now_delinquent #standard_normalization
          # t.float :n_delinquent_amount #standard_normalization
          # t.float :n_delinquencies_last_2_yrs #standard_normalization
          # t.float :n_months_since_last_delinquency #standard_normalization
          # t.float :n_public_records_on_file #standard_normalization
          # t.float :n_months_since_last_record #standard_normalization
          # t.string :n_education
          # t.float :n_employment_length #normalize_employment_length
          # 
          # t.integer :n_status #normalize_status  
          
          # split normalized
          t.float :n_loan_length_36 #normalize_loan_length
          t.float :n_loan_length_60 #normalize_loan_length

          t.float :n_home_ownership_own #normalize_home_ownership
          t.float :n_home_ownership_mortgage #normalize_home_ownership
          t.float :n_home_ownership_rent #normalize_home_ownership

          t.float :n_credit_grade_a1 #normalize_credit_grade
          t.float :n_credit_grade_a2 #normalize_credit_grade
          t.float :n_credit_grade_a3 #normalize_credit_grade
          t.float :n_credit_grade_a4 #normalize_credit_grade
          t.float :n_credit_grade_a5 #normalize_credit_grade
          t.float :n_credit_grade_b1 #normalize_credit_grade
          t.float :n_credit_grade_b2 #normalize_credit_grade
          t.float :n_credit_grade_b3 #normalize_credit_grade
          t.float :n_credit_grade_b4 #normalize_credit_grade
          t.float :n_credit_grade_b5 #normalize_credit_grade
          t.float :n_credit_grade_c1 #normalize_credit_grade
          t.float :n_credit_grade_c2 #normalize_credit_grade
          t.float :n_credit_grade_c3 #normalize_credit_grade
          t.float :n_credit_grade_c4 #normalize_credit_grade
          t.float :n_credit_grade_c5 #normalize_credit_grade
          t.float :n_credit_grade_d1 #normalize_credit_grade
          t.float :n_credit_grade_d2 #normalize_credit_grade
          t.float :n_credit_grade_d3 #normalize_credit_grade
          t.float :n_credit_grade_d4 #normalize_credit_grade
          t.float :n_credit_grade_d5 #normalize_credit_grade
          t.float :n_credit_grade_e1 #normalize_credit_grade
          t.float :n_credit_grade_e2 #normalize_credit_grade
          t.float :n_credit_grade_e3 #normalize_credit_grade
          t.float :n_credit_grade_e4 #normalize_credit_grade
          t.float :n_credit_grade_e5 #normalize_credit_grade
          t.float :n_credit_grade_f1 #normalize_credit_grade
          t.float :n_credit_grade_f2 #normalize_credit_grade
          t.float :n_credit_grade_f3 #normalize_credit_grade
          t.float :n_credit_grade_f4 #normalize_credit_grade
          t.float :n_credit_grade_f5 #normalize_credit_grade
          t.float :n_credit_grade_g1 #normalize_credit_grade
          t.float :n_credit_grade_g2 #normalize_credit_grade
          t.float :n_credit_grade_g3 #normalize_credit_grade
          t.float :n_credit_grade_g4 #normalize_credit_grade
          t.float :n_credit_grade_g5 #normalize_credit_grade
      
          t.float :n_loan_purpose_debt_consolidation #normalize_loan_purpose
          t.float :n_loan_purpose_other #normalize_loan_purpose
          t.float :n_loan_purpose_credit_card #normalize_loan_purpose
          t.float :n_loan_purpose_home_improvement #normalize_loan_purpose
          t.float :n_loan_purpose_small_business #normalize_loan_purpose
          t.float :n_loan_purpose_educational #normalize_loan_purpose
          t.float :n_loan_purpose_vacation #normalize_loan_purpose
          t.float :n_loan_purpose_car #normalize_loan_purpose
          t.float :n_loan_purpose_house #normalize_loan_purpose
          t.float :n_loan_purpose_moving #normalize_loan_purpose
          t.float :n_loan_purpose_wedding #normalize_loan_purpose
      end
  end
  
  def down
      drop_table :loans
  end
end
