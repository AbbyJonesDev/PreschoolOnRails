require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'File Uploader', js: true do
  before do
    admin = FactoryGirl.create(:user, role: 'admin')
    login_as(admin, scope: :user)
  end

  scenario 'visit file uploader page' do
    visit admin_dashboard_path
    click_on "File Uploader"
    expect(current_path).to eq('/admin/file_uploader')
  end

  context 'On File Uploader Page' do
    before { visit '/admin/file_uploader' }

    feature 'Manage Calendars' do
      before do 
        2.times { FactoryGirl.create(:calendar) }
        page.find('#calendar_panel').click
      end

      scenario 'view list of existing calendars'
        # expect(page).to have_selector("tbody tr", count: 2)

      scenario 'delete existing calendar'

      scenario 'upload new calendar'

    end

    feature 'Upload Handbook' do
    end

    feature 'Upload Registration Form' do
    end
  end

end