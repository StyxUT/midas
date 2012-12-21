# Categorical Data: http://jamesmccaffrey.wordpress.com/2011/12/17/neural-network-classification-categorical-data-softmax-activation-and-cross-entropy-error/
$debug = true
$raw_data_file = '/Users/styxut/Desktop/LoanStats.csv'
ENV['APPLICATION_ENVIRONMENT'] = 'development'
 
require 'rubygems'
require 'active_record'
require 'csv'
require 'arel'
require 'date'
require 'time'
require 'ruby_fann/neural_network'
require_relative 'normalize'
require_relative 'import'

dbconfig = YAML::load(File.open('./db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig[ENV['APPLICATION_ENVIRONMENT']])

class Loan < ActiveRecord::Base
end

def show_current_data(ignored)
    puts Loan.first.attributes.to_json
end


Import.load_data($raw_data_file)
#Import.load_raw_loan_data (@@raw_date_file)
#Normalize.normalize_values

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


# Create FANN Neural Network to match appropriate training data:
fann = RubyFann::Standard.new(
    :num_inputs=>4, 
    :hidden_neurons=>[3], 
    :num_outputs=>1)

training_loans = Loan.select([:n_status,:n_debt_to_income_ratio, :n_monthly_income, :n_amount_requested, :n_employment_length]).where(:n_status => [1, -1]).order(:loan_id).limit(100)
inputs = []
outputs = []
out = ""
   
    training_loans.each do |l| 
        l.attributes.to_a[1..4].each do |v|
            out <<  v[1].to_s
        end
        outputs << out.to_a
    end
    
    puts outputs
    # l.attributes.to_a[0][1].to_s


# training_data = RubyFann::TrainData.new(
 #   :inputs => [["n_debt_to_income_ratio", -1.57178879726984], ["n_monthly_income", -0.125455382182144], ["n_amount_requested", -1.06193943153875], ["n_employment_length", -1.22662659380618],
 # ["n_debt_to_income_ratio", -1.33014145045234], ["n_monthly_income", 0.368824791969589], ["n_amount_requested", 0.78625924712016], ["n_employment_length", -1.22662659380618]]
 #     :desired_outputs => [["n_status", 1], ["n_status", -1]])
#   :desired_outputs => outputs)
# 
# # Training using data created above:
 # fann.train_on_data(training_data, 100, 1, 0.5)

#show_current_data("End of Program") if $debug

