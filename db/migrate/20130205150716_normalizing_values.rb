class TrainingNormalizingValues < ActiveRecord::Migration
  def up
      create_table :training_normalization_values do |t|
            t.float :amount_requested_avg  #standard_normalization
            t.float :amount_funded_by_investors_avg #standard_normalization
            t.float :interest_rate_avg #standard_normalization
            t.float :application_date_avg #normalize_date_field
            t.float :monthly_payment_avg #standard_normalization
            t.float :total_amount_funded_avg #standard_normalization
            t.float :debt_to_income_ratio_avg #standard_normalization
            t.float :remaining_principal_funded_by_investors_avg #standard_normalization
            t.float :payments_to_date_funded_by_investors_avg #standard_normalization
            t.float :remaining_principal_avg #standard_normalization
            t.float :payments_to_date_avg #standard_normalization
            t.float :monthly_income_avg #standard_normalization
            t.float :open_credit_lines_avg #standard_normalization
            t.float :total_credit_lines_avg #standard_normalization
            t.float :revolving_credit_balance_avg #standard_normalization
            t.float :revolving_line_utilization_avg #standard_normalization
            t.float :inquiries_in_the_last_6_months_avg #standard_normalization
            t.float :accounts_now_delinquent_avg #standard_normalization
            t.float :delinquent_amount_avg #standard_normalization
            t.float :delinquencies_last_2_yrs_avg #standard_normalization
            t.float :months_since_last_delinquency_avg #standard_normalization
            t.float :public_records_on_file_avg #standard_normalization
            t.float :months_since_last_record_avg #standard_normalization

            t.float :amount_requested_stddev #standard_normalization
            t.float :amount_funded_by_investors_stddev #standard_normalization
            t.float :interest_rate_stddev #standard_normalization
            t.float :application_date_stddev #normalize_date_field
            t.float :monthly_payment #standard_normalization
            t.float :total_amount_funded_stddev #standard_normalization
            t.float :debt_to_income_ratio_stddev #standard_normalization
            t.float :remaining_principal_funded_by_investors_stddev #standard_normalization
            t.float :payments_to_date_funded_by_investors_stddev #standard_normalization
            t.float :remaining_principal_stddev #standard_normalization
            t.float :payments_to_date_stddev #standard_normalization
            t.float :monthly_income_stddev #standard_normalization
            t.float :open_credit_lines_stddev #standard_normalization
            t.float :total_credit_lines_stddev #standard_normalization
            t.float :revolving_credit_balance_stddev #standard_normalization
            t.float :revolving_line_utilization_stddev #standard_normalization
            t.float :inquiries_in_the_last_6_months_stddev #standard_normalization
            t.float :accounts_now_delinquent_stddev #standard_normalization
            t.float :delinquent_amount_stddev #standard_normalization
            t.float :delinquencies_last_2_yrs_stddev #standard_normalization
            t.float :months_since_last_delinquency_stddev #standard_normalization
            t.float :public_records_on_file_stddev #standard_normalization
            t.float :months_since_last_record_stddev #standard_normalization
        end  
  
 end
  

  def down         
      drop_table :training_normalization_values  
  end
end
