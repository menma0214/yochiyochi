require 'rails_helper'
require 'rake'

RSpec.describe 'events:delete_past' do
  before(:all) do
    Rails.application.load_tasks
  end

  before(:each) do
    Rake::Task['events:delete_past'].reenable
  end

  it '過去のイベントが削除されること' do
    # ※モデル名(Event.create!(start_date: 1.month.ago, end_date: 1.week.ago))の記述だと手動で他の項目の記載が必要となる為にfactorybotを利用するように記述
    past_event = create(:event, start_date: 1.month.ago, end_date: 1.week.ago)
    future_event = create(:event, start_date: 1.week.from_now, end_date: 1.month.from_now)

    expect { Rake::Task['events:delete_past'].invoke }.to change { Event.count }.by(-1)
    expect(Event.exists?(past_event.id)).to be_falsey
    expect(Event.exists?(future_event.id)).to be_truthy
  end
end
