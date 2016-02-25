require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'File Uploader' do
  before do
    admin = FactoryGirl.create(:user, role: 'admin')
    login_as(admin, scope: :user)
  end

  scenario 'visit file uploader page' do
    visit admin_root_path
    click_on "File Uploader"
    # Default path - Calendar 'tab'
    expect(current_path).to eq('/admin/class_contact_lists')
  end

  feature 'Manage Calendars' do
  end

  feature 'Upload Handbook' do
  end

  feature 'Upload Registration Form' do
  end
end