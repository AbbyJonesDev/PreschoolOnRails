require 'rails_helper'

describe "Class Manager" do
  before { login_admin }

  context "On Add Class Page" do
    before { visit new_admin_class_path }

    it "has correct header" do
      expect(page).to have_selector("h1", text: "ADD NEW CLASS")
    end

    describe "with valid inputs" do
      let!(:student1) { FactoryGirl.create(:student) }
      let!(:student2) { FactoryGirl.create(:student) }
      let!(:student3) { FactoryGirl.create(:student) }

      let!(:parent1) { FactoryGirl.create(:user, role: "parent") }
      let!(:parent2) { FactoryGirl.create(:user, role: "parent") }
      let!(:parent3) { FactoryGirl.create(:user, role: "parent") }

      before do
        fill_in('Class Name:', with: "Class 1")
        save_and_open_page
        select(student1.name, from: "Students")
        select(parent1, from: "Parents")
        check("Monday")
        check("Wednesday")
        check("Friday")
        fill_in("Begins:", with: "8:30")
        fill_in("Ends:", with: "11:30")
        click("Create")
      end


      it "creates new class" do
        expect(Group.count).to eq 1
      end

      it "adds selected students to class"

      it "does not add other students to class"

      it "adds selected parents to class"

      it "does not add other parents to class"

      it "displays confirmation message"

      it "redirects to class index"

    end
  end

end