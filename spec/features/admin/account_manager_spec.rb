require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Account Manager" do
  before { login_admin }

  context "On User Index Page" do
    before do
      3.times { FactoryGirl.create(:user) }
      # Build class association for one user
      User.last.groups = [ FactoryGirl.create(:group) ]
      visit admin_parents_path
    end

    describe "Form to Add Parent" do
      context "With Complete/Valid Inputs" do
        let(:confirmation_email) { ActionMailer::Base.deliveries.last }
        before do 
          fill_in_basic_user_fields
          click_on("Submit")
          @new_parent = User.last
        end

        it "creates parent" do
          expect(@new_parent.email).to eq("hwinslow@example.com")
        end

        it "creates random password" do
          expect(@new_parent.encrypted_password).not_to be_nil
        end

        it "builds association with class" do
          expect(@new_parent.groups).to eq([Group.last])
        end

        it "shows success message" do
          expect(page).to have_selector('div', text: "Parent account successfully added")
        end

        it "sends email with confirmation instructions" do
          expect(confirmation_email.body.to_s).to include("confirmation")
        end
      end

      context "With Form Errors" do
        before do
          ActionMailer::Base.deliveries.clear
          fill_in("First Name", with: "Madison")
          click_on("Submit")
        end

        it "does not save parent record" do
          # 3 parents created at top of spec + 0 more
          expect(User.where(role: "parent").count).to eq(3)
        end

        it "does not send confirmation email" do
          expect(ActionMailer::Base.deliveries.count).to eq(0)
        end

        it "displays error message" do
          expect(page).to have_selector('div', text: /errors? prevented/)
        end
      end
    end 

    describe "Edit Parent Account" do
      # Need better test coverage here or in controller spec
      before do
        click_on "Edit", match: :first
      end

      it "updates email" do
        fill_in("Email", with: "new-email@boo.yah")
        click_on("Submit")
        expect(page).to have_selector('div', text: "Account updated")
      end
    end

    describe "Delete Parent Account" do
      it "removes parent account" do
        expect{ click_on("Delete", match: :first) }.to change{User.count}.by(-1)
      end
    end

    describe "Table of Users" do
      it "displays table of users" do
        expect(page).to have_selector("table tr", count: 3)
      end

      it "gives class name for parent" do
        expect(page).to have_selector('td', text: "#{Group.first.name}")
      end

      it "has links to edit each user" do
        id = User.find_by_role("parent").id #Will get first one
        click_on("Edit", :match => :first)
        expect(current_path).to eq(edit_admin_parent_path(id))
      end

      it "has links to delete each user" do
        expect(page).to have_link("Delete")
      end
    end
  end
end