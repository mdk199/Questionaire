namespace :user do
  namespace :point do
    desc "Update user points every hour"
    task :update => :environment do
      puts Question.all.inspect
    end
  end
end