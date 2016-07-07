every 1.hour, :at => '8:00 am' do
  rake "delete:old_guests"
end