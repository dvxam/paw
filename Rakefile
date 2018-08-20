
desc ' List existing tasks with description'
task(:default) do
  system 'rake --tasks --all'
end


desc 'Runs "test:run"'
task test: ['test:run']

desc 'All tasks related to tests'
namespace :test do

  desc 'Run tests once'
  task(:run) do
    system 'bundle exec rspec'
  end

  desc 'Watch for change and run tests on change'
  task :watch do
    system 'bundle exec guard'
  end

end
