# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'yaml'
AUTH = HashWithIndifferentAccess.new(YAML.load_file(Rails.root.join('config', 'auth.yml')))[Rails.env]
ENV['AWS_BUCKET'] = AUTH[:amazon][:bucket]
ENV['AWS_ACCESS_KEY_ID'] = AUTH[:amazon][:key]
ENV['AWS_SECRET_ACCESS_KEY'] = AUTH[:amazon][:secret]

PAPERCLIP_OPTIONS = {
		:default_url => 'http://bit-miner.herokuapp.com/avatars/medium/missing.png',
		:path => '/:class/:id/:style/:filename',
		:use_timestamp => false,
		:hash_secret => 'xOfeVEdluR6BbpGRwWruGU5T+mP68NXSvi4JHl0sjjDflndGEnQYvFKWy78m3MMjrRPCEiaNCOfbG1W3lq3ud/1/5sXvGJOA3h4XFyNmq6JfQg958aus77zJxPmXbKeI/xn9BWQvBTjFhyoeKmdzYNERKk88X3KbcSS7JEHxNPY=',
		storage: :s3,
		s3_credentials: AUTH[:amazon],
		:s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate },
		:s3_permissions => :public_read
}

# Initialize the Rails application.
BitMiner::Application.initialize!
