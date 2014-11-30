require 'rails_helper'

describe "Class Manager" do
  before { login_admin }

  context "On Add Class Page" do
    before { visit new_admin_class_path }

    it "has correct header" do
      expect(page).to have_selector("h1", text: "ADD NEW CLASS")
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

      specify "with correct days" do
        expect(klass.days).to eq(["Monday", "Wednesday", "Friday"])
      end

      specify "with correct start time" do
        expect(klass.start_time.hour).to eq(8)
      end

      specify "with correct end time" do
        expect(klass.end_time.hour).to eq(11)
      end

      it "displays confirmation message" do
        expect(page).to have_selector("div", text: "Class successfully created")
      end

      it "redirects to class index" do
        expect(current_path).to eq(admin_classes_path)
      end

    end
  end

end