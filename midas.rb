# Categorical Data: http://jamesmccaffrey.wordpress.com/2011/12/17/neural-network-classification-categorical-data-softmax-activation-and-cross-entropy-error/
$debug = true
$raw_data_file = '/Users/styxut/Desktop/LoanStats.csv'
$save_file_name = 'training_save'
$bit_fail = 4099

$evaluation_data_file = '/Users/styxut/Desktop/browseNotes.csv'
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
require_relative 'nn'

dbconfig = YAML::load(File.open('./db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig[ENV['APPLICATION_ENVIRONMENT']])

class Loan < ActiveRecord::Base
end

class Evaluation_Loan < ActiveRecord::Base
end
                                            
# Import.load_data($raw_data_file, 'training')
# Normalize.normalize_values('training')

Import.load_data($evaluation_data_file, 'evaluation')


# 25.times do |i|
#     NN.train(300, 0.30, [90]) # max_epochs, desired_error, array of hidden node counts
#     puts "Training #{i}; Minimum Bit Fail: #{$bit_fail}"
# end


# currently set to train on 14000 records and test on 3000
# NN.train
# NN.test
# NN.run


