# Categorical Data: http://jamesmccaffrey.wordpress.com/2011/12/17/neural-network-classification-categorical-data-softmax-activation-and-cross-entropy-error/
$debug = true
$raw_data_file = '/Users/styxut/Desktop/LoanStats_orig.csv'
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

# Import.load_data($raw_data_file)
# Normalize.normalize_values

Train.train(1200, 0.340, [20]) # max_epochs, desired_error, array of hidden node counts




