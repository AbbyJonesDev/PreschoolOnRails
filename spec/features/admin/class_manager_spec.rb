require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Class Manager" do
  before { login_admin }

  context "On Class Index Page" do
    before do
      3.times { FactoryGirl.create(:group) }
      visit admin_classes_path
    end

    it "has link to add class" do
      expect(page).to have_link("Add new class")
    end

    specify "link goes to add class page" do
      click_on("Add new class")
      expect(current_path).to eq(new_admin_class_path)
    end

    it "displays table of classes" do
      expect(page).to have_selector("table tr", count: 3)
    end

    it "has links to edit each class" do
      click_on("Edit", :match => :first)
      expect(current_path).to eq(edit_admin_class_path(Group.first))
    end

    describe "delete class" do

      xit "removes class", js: true do
        # Need to research how to test this
        # Capybara thinks no one is logged in
        # Logging in again here doesn't help

        # First problem  resolved by using Warden Test Helper
        admin = FactoryGirl.create(:user, role: "admin")
        login_as(admin, :scope => :user, :run_callbacks => false)
        # But now classes aren't being displayed in the index
        # Even though they appear in debugger session
        3.times { FactoryGirl.create(:group) }
        # debugger
        visit admin_classes_path
        save_and_open_page

        expect { 
          click_on("Delete", match: :first)
          page.accept_alert 'Are you sure?' do
            click_button('OK')
          end
          }.to change(Group, :count).by(-1)
      end

      it "removes association with students"
      it "unenrolls students"
      it "removes association with parents"
      it "deactivates parents"
    end
  end


  context "On Add Class Page" do
    before { visit new_admin_class_path }

    it "has correct header" do
      expect(page).to have_selector("h2", text: "ADD NEW CLASS")
    end

    describe "with valid inputs" do
      let(:klass) { Group.last }
      before do
        fill_in('Class Name:', with: "Class 1")
        check("Monday")
        check("Wednesday")
        check("Friday")
        fill_in("Begins:", with: "8:30")
        fill_in("Ends:", with: "11:30")
        click_on("Submit")
      end


      it "creates new class" do
        expect(Group.count).to eq 1
      end

      specify "has correct days" do
        expect(klass.days).to eq(["Monday", "Wednesday", "Friday"])
      end

      specify "has correct start time" do
        expect(klass.start_time.hour).to eq(8)
      end

      specify "has correct end time" do
        expect(klass.end_time.hour).to eq(11)
      end

      it "displays confirmation message" do
        expect(page).to have_selector("div", text: "Class successfully created")
      end

      it "redirects to class index" do
        expect(current_path).to eq(admin_classes_path)
      end
    end

    describe "with invalid inputs" do
      it "shows error message"
    end
  end

  context "On Edit Page" do
    let(:klass) { FactoryGirl.create(:group, days: ["Monday, Wednesday, Friday"]) }
    before do
     visit edit_admin_class_path(klass) 
     check("Tuesday")
     check("Thursday")
     click_on("Submit")
   end

    it "updates days" do
      klass.reload
      expect(klass.days).to eq(["Tuesday", "Thursday"])
    end
    
    it "shows confirmation message" do
      expect(page).to have_selector("div", text: "Class successfully updated")
    end

    it "redirect to class index" do
      expect(current_path).to eq(admin_classes_path)
    end
  end

end