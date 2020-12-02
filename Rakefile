require "rspec/core/rake_task"

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/lib/*') { |file| require file }

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Run Github Repo Search'
task :run, [:username] do |task, args|

  response = ApiCaller.new(args[:username]).api_call
  puts LanguageCalculator.new(response).call

end