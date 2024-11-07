# config/schedule.rb
every 1.day, at: '12:00 am' do
  rake 'events:delete_past'
end
