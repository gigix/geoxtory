namespace :deploy do
  task :deployToServer do
    puts "deploy to heroku"
  end
  
  task :deployToServer => ["spec"]
end