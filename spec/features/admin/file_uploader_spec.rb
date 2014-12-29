require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'File Uploader' do
  before do
    admin = FactoryGirl.create(:user, role: 'admin')
    login_as(admin, scope: :user)
  end

  scenario 'visit file uploader page' do
    visit admin_dashboard_path
    click_on "File Uploader"
    # Default path - Calendar 'tab'
    expect(current_path).to eq('/admin/calendars')
  end

  feature 'Manage Calendars' do
    before do 
      2.times { FactoryGirl.create(:calendar) }
      visit admin_calendars_path
    end

    scenario 'view list of existing calendars' do
      expect(page).to have_selector("tbody tr", count: 2)
    end

    scenario 'delete existing calendar'


    scenario 'upload new calendar'
  end

  feature 'Upload Handbook' do
  end

  feature 'Upload Registration Form' do
  end
end