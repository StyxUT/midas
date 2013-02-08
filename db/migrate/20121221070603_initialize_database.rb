# rake db:new_migration name=foo_bar_migration
# edit db/migrate/20081220234130_foo_bar_migration.rb

class InitializeDatabase < ActiveRecord::Migration
  def up
      create_table :loans do |t|
          t.integer :loan_id # not used
          t.float :amount_requested  #standard_normalization
          t.float :amount_funded_by_investors #standard_normalization
          t.float :interest_rate #standard_normalization
          t.string :loan_length #normalize_loan_length_<36 | 60>
          t.date :application_date #normalize_date_field
          t.date :application_expiration_date # not used
          t.date :issued_date # not used
          t.string :credit_grade #normalize_credit_grad_<a1..g5>
          t.string :loan_title # not used
          t.string :loan_purpose 
          t.text :loan_description # not used
          t.float :monthly_payment #standard_normalization
          t.string :status #normalize_status
          t.float :total_amount_funded #standard_normalization
          t.float :debt_to_income_ratio #standard_normalization
          t.float :remaining_principal_funded_by_investors #standard_normalization
          t.float :payments_to_date_funded_by_investors #standard_normalization
          t.float :remaining_principal #standard_normalization
          t.float :payments_to_date #standard_normalization
          t.string :screen_name # not used
          t.string :city # not used
          t.string :state # not used
          t.string :home_ownership #normaiize_home_ownership_<own | mortgage | rent>
          t.float :monthly_income #standard_normalization
          t.string :fico_range #normalize_FICO
          t.date :earliest_credit_line #normalize_date_field
          t.float :open_credit_lines #standard_normalization
          t.float :total_credit_lines #standard_normalization
          t.float :revolving_credit_balance #standard_normalization
          t.float :revolving_line_utilization #standard_normalization
          t.float :inquiries_in_the_last_6_months #standard_normalization
          t.float :accounts_now_delinquent #standard_normalization
          t.float :delinquent_amount #standard_normalization
          t.float :delinquencies_last_2_yrs #standard_normalization
          t.float :months_since_last_delinquency #standard_normalization
          t.float :public_records_on_file #standard_normalization
          t.float :months_since_last_record #standard_normalization
          t.string :education
          t.string :employment_length #normalize_employment_length
          t.integer :code #not used
          t.string :initial_listing_status #not used
      
          # normalized fields
          t.float :n_amount_requested  #standard_normalization
          t.float :n_amount_funded_by_investors #standard_normalization
          t.float :n_interest_rate #standard_normalization
          t.float :n_application_date #normalize_date_field
          t.float :n_monthly_payment #standard_normalization
          t.float :n_total_amount_funded #standard_normalization
          t.float :n_debt_to_income_ratio #standard_normalization
          t.float :n_remaining_principal_funded_by_investors #standard_normalization
          t.float :n_payments_to_date_funded_by_investors #standard_normalization
          t.float :n_remaining_principal #standard_normalization
          t.float :n_payments_to_date #standard_normalization
          t.float :n_monthly_income #standard_normalization
          t.float :n_fico_range #normalize_FICO
          t.float :n_earliest_credit_line #normalize_date_field
          t.float :n_open_credit_lines #standard_normalization
          t.float :n_total_credit_lines #standard_normalization
          t.float :n_revolving_credit_balance #standard_normalization
          t.float :n_revolving_line_utilization #standard_normalization
          t.float :n_inquiries_in_the_last_6_months #standard_normalization
          t.float :n_accounts_now_delinquent #standard_normalization
          t.float :n_delinquent_amount #standard_normalization
          t.float :n_delinquencies_last_2_yrs #standard_normalization
          t.float :n_months_since_last_delinquency #standard_normalization
          t.float :n_public_records_on_file #standard_normalization
          t.float :n_months_since_last_record #standard_normalization
          t.string :n_education
          t.float :n_employment_length #normalize_employment_length

          t.integer :n_status #normalize_status
          
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
