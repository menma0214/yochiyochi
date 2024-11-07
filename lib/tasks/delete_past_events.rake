# lib/tasks/delete_past_events.rake
namespace :events do
  desc 'Delete events with end_date before today'
  task delete_past: :environment do
    Event.where('end_date < ?', Date.today).destroy_all
  end
end
