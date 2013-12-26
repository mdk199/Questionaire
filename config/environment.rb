# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rorproject::Application.initialize!

my_datetime_formats = { :default => '%d-%b-%Y' } #or any other you like
my_date_formats = { :default => '%d-%b-%Y' } #or any other you like

Time::DATE_FORMATS.merge!(my_datetime_formats)
Date::DATE_FORMATS.merge!(my_date_formats)
