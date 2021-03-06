require "sinatra"

# The code below will automatically require all the gems listed in our Gemfile,
# so we don't have to manually require gems a la
#
#   require "data_mapper"
#   require "dotenv"
#
# See: http://bundler.io/sinatra.html

require "rubygems"
require "bundler/setup"

Bundler.require(:default, Sinatra::Application.environment)

# Bundler.require(:default) will automatically require all global gems and
# Bundler.require(Sinatra::Application.environment) will automatically require
# all environment-specific gems.
#
# See: http://bundler.io/v1.6/groups.html
#
# NOTE: Sinatra::Application.environment is set to the value of ENV['RACK_ENV']
# if ENV['RACK_ENV'] is set.  Otherwise, it defaults to :development.

# Load the .env file if it exists
if File.exist?(".env")
  Dotenv.load(".env")
end

# Yell at the user (and exit) if DATABASE_URL isn't set
unless ENV.key?("DATABASE_URL")
  puts "ENV['DATABASE_URL'] is undefined.  Make sure your .env file is correct."
  puts "To use the example file env.example, run"
  puts ""
  puts "  rake setup:dotenv"
  puts ""
  exit 1
end

if ENV.values.include?("fill-me-in")
  puts "You need to configure your Amazon Web Services (AWS) account."
  puts "See the README for how to do this."
  exit 1
end

require "./setup"
