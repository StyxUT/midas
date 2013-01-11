# Categorical Data: http://jamesmccaffrey.wordpress.com/2011/12/17/neural-network-classification-categorical-data-softmax-activation-and-cross-entropy-error/
$debug = true
$raw_data_file = '/Users/styxut/Desktop/LoanStats_12-29.csv'
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
require_relative 'train'

dbconfig = YAML::load(File.open('./db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig[ENV['APPLICATION_ENVIRONMENT']])

class Loan < ActiveRecord::Base
end

def show_current_data(ignored)
    puts Loan.first.attributes.to_json
end

Import.load_data($raw_data_file)
Normalize.normalize_values

# NN.train(500, 0.340, [40]) # max_epochs, desired_error, array of hidden node counts

# fann_create_from_file('training_save')
#fannTest = RubyFann::Standard.new(:filename => 'training_save')

# NN.train
# NN.test
# NN.run


