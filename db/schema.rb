# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130208032714) do

  create_table "evaluation_loans", :force => true do |t|
    t.integer "member_id"
    t.float   "loan_amnt"
    t.float   "funded_amnt"
    t.integer "term"
    t.float   "apr"
    t.float   "int_rate"
    t.float   "exp_default_rate"
    t.integer "service_fee_rate"
    t.float   "installment"
    t.string  "grade"
    t.string  "sub_grade"
    t.string  "emp_name"
    t.string  "emp_length"
    t.string  "emp_status"
    t.string  "home_ownership"
    t.string  "other_home_ownership"
    t.float   "annual_inc"
    t.integer "is_inc_v"
    t.date    "accept_d"
    t.date    "exp_d"
    t.date    "list_d"
    t.date    "credit_pull_d"
    t.date    "review_status_d"
    t.string  "review_status"
    t.text    "url"
    t.text    "desc"
    t.string  "purpose"
    t.string  "title"
    t.string  "addr_city"
    t.string  "addr_state"
    t.string  "msa"
    t.float   "investor_count"
    t.integer "acc_now_delinq"
    t.integer "acc_open_past_24mths"
    t.integer "bc_open_to_buy"
    t.float   "percent_bc_gt_75"
    t.float   "bc_util"
    t.float   "dti"
    t.integer "delinq_2yrs"
    t.float   "delinq_amnt"
    t.date    "earliest_cr_line"
    t.integer "fico_range_low"
    t.integer "fico_range_high"
    t.integer "inq_last_6mths"
    t.integer "mths_since_last_delinq"
    t.integer "mths_since_last_record"
    t.integer "mths_since_recent_inq"
    t.integer "mths_since_recent_loan_delinq"
    t.integer "mths_since_recent_revol_delinq"
    t.integer "mths_since_recent_bc"
    t.integer "mort_acc"
    t.integer "open_acc"
    t.integer "pub_rec_gt_100"
    t.integer "pub_rec"
    t.integer "total_bal_ex_mort"
    t.integer "revol_bal"
    t.integer "revol_util"
    t.integer "total_bc_limit"
    t.integer "total_acc"
    t.integer "in28"
    t.integer "bi20"
    t.integer "re01"
    t.integer "bc36"
    t.string  "initial_list_status"
    t.date    "ils_exp_d"
    t.integer "pub_rec_bankruptcies"
    t.integer "g044"
    t.integer "chargeoff_within_12_mths"
    t.integer "collections_12_mths_ex_med"
    t.integer "tax_liens"
    t.integer "s062"
  end

  create_table "loans", :force => true do |t|
    t.integer "loan_id"
    t.float   "amount_requested"
    t.float   "amount_funded_by_investors"
    t.float   "interest_rate"
    t.string  "loan_length"
    t.date    "application_date"
    t.date    "application_expiration_date"
    t.date    "issued_date"
    t.string  "credit_grade"
    t.string  "loan_title"
    t.string  "loan_purpose"
    t.text    "loan_description"
    t.float   "monthly_payment"
    t.string  "status"
    t.float   "total_amount_funded"
    t.float   "debt_to_income_ratio"
    t.float   "remaining_principal_funded_by_investors"
    t.float   "payments_to_date_funded_by_investors"
    t.float   "remaining_principal"
    t.float   "payments_to_date"
    t.string  "screen_name"
    t.string  "city"
    t.string  "state"
    t.string  "home_ownership"
    t.float   "monthly_income"
    t.string  "fico_range"
    t.date    "earliest_credit_line"
    t.float   "open_credit_lines"
    t.float   "total_credit_lines"
    t.float   "revolving_credit_balance"
    t.float   "revolving_line_utilization"
    t.float   "inquiries_in_the_last_6_months"
    t.float   "accounts_now_delinquent"
    t.float   "delinquent_amount"
    t.float   "delinquencies_last_2_yrs"
    t.float   "months_since_last_delinquency"
    t.float   "public_records_on_file"
    t.float   "months_since_last_record"
    t.string  "education"
    t.string  "employment_length"
    t.integer "code"
    t.string  "initial_listing_status"
    t.float   "n_amount_requested"
    t.float   "n_amount_funded_by_investors"
    t.float   "n_interest_rate"
    t.float   "n_application_date"
    t.float   "n_monthly_payment"
    t.float   "n_total_amount_funded"
    t.float   "n_debt_to_income_ratio"
    t.float   "n_remaining_principal_funded_by_investors"
    t.float   "n_payments_to_date_funded_by_investors"
    t.float   "n_remaining_principal"
    t.float   "n_payments_to_date"
    t.float   "n_monthly_income"
    t.float   "n_fico_range"
    t.float   "n_earliest_credit_line"
    t.float   "n_open_credit_lines"
    t.float   "n_total_credit_lines"
    t.float   "n_revolving_credit_balance"
    t.float   "n_revolving_line_utilization"
    t.float   "n_inquiries_in_the_last_6_months"
    t.float   "n_accounts_now_delinquent"
    t.float   "n_delinquent_amount"
    t.float   "n_delinquencies_last_2_yrs"
    t.float   "n_months_since_last_delinquency"
    t.float   "n_public_records_on_file"
    t.float   "n_months_since_last_record"
    t.string  "n_education"
    t.float   "n_employment_length"
    t.integer "n_status"
    t.float   "n_loan_length_36"
    t.float   "n_loan_length_60"
    t.float   "n_home_ownership_own"
    t.float   "n_home_ownership_mortgage"
    t.float   "n_home_ownership_rent"
    t.float   "n_credit_grade_a1"
    t.float   "n_credit_grade_a2"
    t.float   "n_credit_grade_a3"
    t.float   "n_credit_grade_a4"
    t.float   "n_credit_grade_a5"
    t.float   "n_credit_grade_b1"
    t.float   "n_credit_grade_b2"
    t.float   "n_credit_grade_b3"
    t.float   "n_credit_grade_b4"
    t.float   "n_credit_grade_b5"
    t.float   "n_credit_grade_c1"
    t.float   "n_credit_grade_c2"
    t.float   "n_credit_grade_c3"
    t.float   "n_credit_grade_c4"
    t.float   "n_credit_grade_c5"
    t.float   "n_credit_grade_d1"
    t.float   "n_credit_grade_d2"
    t.float   "n_credit_grade_d3"
    t.float   "n_credit_grade_d4"
    t.float   "n_credit_grade_d5"
    t.float   "n_credit_grade_e1"
    t.float   "n_credit_grade_e2"
    t.float   "n_credit_grade_e3"
    t.float   "n_credit_grade_e4"
    t.float   "n_credit_grade_e5"
    t.float   "n_credit_grade_f1"
    t.float   "n_credit_grade_f2"
    t.float   "n_credit_grade_f3"
    t.float   "n_credit_grade_f4"
    t.float   "n_credit_grade_f5"
    t.float   "n_credit_grade_g1"
    t.float   "n_credit_grade_g2"
    t.float   "n_credit_grade_g3"
    t.float   "n_credit_grade_g4"
    t.float   "n_credit_grade_g5"
    t.float   "n_loan_purpose_debt_consolidation"
    t.float   "n_loan_purpose_other"
    t.float   "n_loan_purpose_credit_card"
    t.float   "n_loan_purpose_home_improvement"
    t.float   "n_loan_purpose_small_business"
    t.float   "n_loan_purpose_educational"
    t.float   "n_loan_purpose_vacation"
    t.float   "n_loan_purpose_car"
    t.float   "n_loan_purpose_house"
    t.float   "n_loan_purpose_moving"
    t.float   "n_loan_purpose_wedding"
  end

  create_table "normalization_values", :force => true do |t|
    t.float "amount_requested_avg"
    t.float "amount_funded_by_investors_avg"
    t.float "interest_rate_avg"
    t.float "application_date_avg"
    t.float "monthly_payment_avg"
    t.float "total_amount_funded_avg"
    t.float "debt_to_income_ratio_avg"
    t.float "remaining_principal_funded_by_investors_avg"
    t.float "payments_to_date_funded_by_investors_avg"
    t.float "remaining_principal_avg"
    t.float "payments_to_date_avg"
    t.float "monthly_income_avg"
    t.float "open_credit_lines_avg"
    t.float "total_credit_lines_avg"
    t.float "revolving_credit_balance_avg"
    t.float "revolving_line_utilization_avg"
    t.float "inquiries_in_the_last_6_months_avg"
    t.float "accounts_now_delinquent_avg"
    t.float "delinquent_amount_avg"
    t.float "delinquencies_last_2_yrs_avg"
    t.float "months_since_last_delinquency_avg"
    t.float "public_records_on_file_avg"
    t.float "months_since_last_record_avg"
    t.float "amount_requested_stddev"
    t.float "amount_funded_by_investors_stddev"
    t.float "interest_rate_stddev"
    t.float "application_date_stddev"
    t.float "monthly_payment"
    t.float "total_amount_funded_stddev"
    t.float "debt_to_income_ratio_stddev"
    t.float "remaining_principal_funded_by_investors_stddev"
    t.float "payments_to_date_funded_by_investors_stddev"
    t.float "remaining_principal_stddev"
    t.float "payments_to_date_stddev"
    t.float "monthly_income_stddev"
    t.float "open_credit_lines_stddev"
    t.float "total_credit_lines_stddev"
    t.float "revolving_credit_balance_stddev"
    t.float "revolving_line_utilization_stddev"
    t.float "inquiries_in_the_last_6_months_stddev"
    t.float "accounts_now_delinquent_stddev"
    t.float "delinquent_amount_stddev"
    t.float "delinquencies_last_2_yrs_stddev"
    t.float "months_since_last_delinquency_stddev"
    t.float "public_records_on_file_stddev"
    t.float "months_since_last_record_stddev"
  end

end
