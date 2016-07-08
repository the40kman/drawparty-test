namespace :guests do
  desc "Remove guest accounts more than a dayold."
  task :old_guests => :environment do
    User.where(guest: true).where("created_at < ?", 1.hour.ago).each do |guest|
      guest.destroy
    end
  end
end