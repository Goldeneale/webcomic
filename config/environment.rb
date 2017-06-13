# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Ensure Paperclip has access to ImageMagick
Paperclip.options[:command_path] = "/usr/bin/"