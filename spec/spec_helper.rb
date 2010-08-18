require 'rubygems'
gem 'mogli'
#gem 'rails', '3.0.0.rc'
#gem "rspec-rails", ">= 2.0.0.beta.19"

require "facebooker2"

require "active_support"
require "action_pack"
require "action_view"
require "action_controller"
require "rspec/rails"

###
# HACK: not sure how to stop the annoying warnings about already initialized constant Rails
# found this idea @ http://stackoverflow.com/questions/2878975/selectively-silence-jruby-warnings
#
def suppress_all_warnings
  old_verbose = $VERBOSE
  begin
    $VERBOSE = nil
    yield if block_given?
  ensure
    # always re-set to old value, even if block raises an exception
    $VERBOSE = old_verbose
  end
end
