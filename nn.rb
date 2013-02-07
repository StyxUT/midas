# Create Training data with 2 each of inputs(array of 3) & desired outputs(array of 1).
# training_data = RubyFann::TrainData.new(
#   :inputs=>[[1, 1], [0, 0], [0, 1], [1,0]], 
#   :desired_outputs=>[[0], [0], [1], [1]])
# 
# # Create FANN Neural Network to match appropriate training data:
# fann = RubyFann::Standard.new(
#   :num_inputs=>2, 
#   :hidden_neurons=>[2], 
#   :num_outputs=>1)
# 
# # Training using data created above:
# fann.train_on_data(training_data, 2000, 1, 0.02)
# 
# # Run with different input data:
# outputs = fann.run([0, 1])
# puts "Output: #{outputs[0].round}"
# 
# outputs = fann.run([1, 1])
# puts "Output: #{outputs[0].round}"

class NN
    @@training_loans = ActiveRecord::Relation
    @@testing_loans = ActiveRecord::Relation
 
    def self.test()
       do_testing() 
    end
    
    def self.train(max_epochs, desired_error, hidden_neurons)
       do_training(max_epochs, desired_error, hidden_neurons) 
    end

private

    def self.do_testing()
        @testing_loans = load_testing_data
        inputs = load_inputs(@testing_loans)
        outputs = load_outputs(@testing_loans)
 
        puts "Training records:  #{@testing_loans.count}"
         
        fann = RubyFann::Standard.new(:filename => $save_file_name)

        testing_data = RubyFann::TrainData.new(
           :inputs => inputs,
           :desired_outputs => outputs)

        fann.test_data(testing_data.shuffle)
        puts "Bit Fail of #{fann.get_bit_fail}"
    end
    
    def self.do_training(max_epochs, desired_error, hidden_neurons)
        @training_loans = load_training_data
        inputs = load_inputs(@training_loans)
        outputs = load_outputs(@training_loans)
 
        puts "Training records:  #{@training_loans.count}"
        
        # Create FANN Neural Network to match appropriate training data:
        fann = RubyFann::Standard.new(
           :num_inputs=>69, 
           :hidden_neurons=> hidden_neurons, 
           :num_outputs=>1)
               
        training_data = RubyFann::TrainData.new(
           :inputs => inputs,
           :desired_outputs => outputs)
               
        fann.train_on_data(training_data.shuffle, max_epochs, 5, desired_error)
          
        if fann.get_bit_fail < $bit_fail then
            $bit_fail = fann.get_bit_fail
            puts "Training file saved:  #{$save_file_name} with Bit Fail of #{fann.get_bit_fail}"
            fann.save($save_file_name)
        end
    end
    
    def self.load_training_data
        training_loans = Loan.select([
            :n_status,
            :n_amount_requested,
            :n_interest_rate,
            :n_application_date,
            :n_total_amount_funded,
            :n_debt_to_income_ratio,
            :n_monthly_income,
            :n_fico_range,
            :n_earliest_credit_line,
            :n_open_credit_lines,
            :n_total_credit_lines,
            :n_revolving_credit_balance,
            :n_revolving_line_utilization,
            :n_inquiries_in_the_last_6_months,
            :n_accounts_now_delinquent,
            :n_delinquent_amount,
            :n_delinquencies_last_2_yrs,
            :n_months_since_last_delinquency,
            :n_public_records_on_file,
            :n_months_since_last_record,
            :n_employment_length,
            :n_loan_length_36,
            :n_loan_length_60,
            :n_home_ownership_own,
            :n_home_ownership_mortgage,
            :n_home_ownership_rent,
            :n_credit_grade_a1,
            :n_credit_grade_a2,
            :n_credit_grade_a3,
            :n_credit_grade_a4,
            :n_credit_grade_a5,
            :n_credit_grade_b1,
            :n_credit_grade_b2,
            :n_credit_grade_b3,
            :n_credit_grade_b4,
            :n_credit_grade_b5,
            :n_credit_grade_c1,
            :n_credit_grade_c2,
            :n_credit_grade_c3,
            :n_credit_grade_c4,
            :n_credit_grade_c5,
            :n_credit_grade_d1,
            :n_credit_grade_d2,
            :n_credit_grade_d3,
            :n_credit_grade_d4,
            :n_credit_grade_d5,
            :n_credit_grade_e1,
            :n_credit_grade_e2,
            :n_credit_grade_e3,
            :n_credit_grade_e4,
            :n_credit_grade_e5,
            :n_credit_grade_f1,
            :n_credit_grade_f2,
            :n_credit_grade_f3,
            :n_credit_grade_f4,
            :n_credit_grade_f5,
            :n_credit_grade_g1,
            :n_credit_grade_g2,
            :n_credit_grade_g3,
            :n_credit_grade_g4,
            :n_credit_grade_g5,
            :n_loan_purpose_debt_consolidation,
            :n_loan_purpose_other,
            :n_loan_purpose_credit_card,
            :n_loan_purpose_home_improvement,
            :n_loan_purpose_small_business,
            :n_loan_purpose_educational,
            :n_loan_purpose_vacation,
            :n_loan_purpose_car,
            :n_loan_purpose_house,
            :n_loan_purpose_moving
        ]).where(:n_status => [1, -1]).order('loan_id ASC').limit(14000)
        
        return training_loans
    end

    def self.load_testing_data
        testing_loans = Loan.select([
            :n_status,
            :n_amount_requested,
            :n_interest_rate,
            :n_application_date,
            :n_total_amount_funded,
            :n_debt_to_income_ratio,
            :n_monthly_income,
            :n_fico_range,
            :n_earliest_credit_line,
            :n_open_credit_lines,
            :n_total_credit_lines,
            :n_revolving_credit_balance,
            :n_revolving_line_utilization,
            :n_inquiries_in_the_last_6_months,
            :n_accounts_now_delinquent,
            :n_delinquent_amount,
            :n_delinquencies_last_2_yrs,
            :n_months_since_last_delinquency,
            :n_public_records_on_file,
            :n_months_since_last_record,
            :n_employment_length,
            :n_loan_length_36,
            :n_loan_length_60,
            :n_home_ownership_own,
            :n_home_ownership_mortgage,
            :n_home_ownership_rent,
            :n_credit_grade_a1,
            :n_credit_grade_a2,
            :n_credit_grade_a3,
            :n_credit_grade_a4,
            :n_credit_grade_a5,
            :n_credit_grade_b1,
            :n_credit_grade_b2,
            :n_credit_grade_b3,
            :n_credit_grade_b4,
            :n_credit_grade_b5,
            :n_credit_grade_c1,
            :n_credit_grade_c2,
            :n_credit_grade_c3,
            :n_credit_grade_c4,
            :n_credit_grade_c5,
            :n_credit_grade_d1,
            :n_credit_grade_d2,
            :n_credit_grade_d3,
            :n_credit_grade_d4,
            :n_credit_grade_d5,
            :n_credit_grade_e1,
            :n_credit_grade_e2,
            :n_credit_grade_e3,
            :n_credit_grade_e4,
            :n_credit_grade_e5,
            :n_credit_grade_f1,
            :n_credit_grade_f2,
            :n_credit_grade_f3,
            :n_credit_grade_f4,
            :n_credit_grade_f5,
            :n_credit_grade_g1,
            :n_credit_grade_g2,
            :n_credit_grade_g3,
            :n_credit_grade_g4,
            :n_credit_grade_g5,
            :n_loan_purpose_debt_consolidation,
            :n_loan_purpose_other,
            :n_loan_purpose_credit_card,
            :n_loan_purpose_home_improvement,
            :n_loan_purpose_small_business,
            :n_loan_purpose_educational,
            :n_loan_purpose_vacation,
            :n_loan_purpose_car,
            :n_loan_purpose_house,
            :n_loan_purpose_moving
        ]).where(:n_status => [1, -1]).order('loan_id DESC').limit(3000)
        
        return testing_loans
    end
    
    # load outputs 
    def self.load_outputs(data)
        outputs = []
        data.each do |l|
            a = Array.new()
            a << l.attributes.to_a[0][1].to_f
            outputs << a
        end
        
        return outputs
        # puts outputs.to_s
    end

    # load inputs
    def self.load_inputs(data)
        inputs = []
        data.each do |l| 
            a = Array.new()
            l.attributes.to_a[1..21].each do |v|
                a << v[1].to_f
            end
            inputs << a
        end
        
        return inputs
        # puts inputs.to_s
    end
end