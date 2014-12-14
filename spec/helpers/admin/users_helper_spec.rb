require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Admin::UsersHelper. For example:
#
# describe Admin::UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Admin::UsersHelper, :type => :helper do

  describe 'full_name(person)' do
    it "concats first and last name" do
      john_smith = FactoryGirl.build(:user, fname: "John", lname: "Smith")
      expect(full_name(john_smith)).to eq("John Smith")
    end

    specify "student with no last name" do
      johnny = FactoryGirl.build(:student, fname: "Johnny", lname: "")
      expect(full_name(johnny)).to eq("Johnny")
    end
  end

  describe 'klass_names(person)' do
    let(:klass1) {FactoryGirl.create(:group, name: "Class 1") }
    let(:klass2) {FactoryGirl.create(:group, name: "Class 2") }
    let(:parent) { FactoryGirl.build(:user, role: 'parent') }

    specify "with no class association" do
      expect(klass_names(parent)).to eq("Not assigned to a class")
    end

    specify "with one class association" do
      parent.groups = [klass1]
      expect(klass_names(parent)).to eq("#{klass1.name}")
    end

    specify "with two class associations" do
      parent.groups = [klass1, klass2]
      expect(klass_names(parent)).to eq("#{klass1.name}, #{klass2.name}")
    end
  end

end
