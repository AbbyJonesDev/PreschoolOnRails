require 'rails_helper'

RSpec.describe User, :type => :model do

  describe '#parents' do
    let(:parent) { FactoryGirl.create(:user, role: "parent") }
    let(:admin)  { FactoryGirl.create(:user, role: "admin")  }
    
    xit "only returns users who are parents" do
      expect(User.parents).to eq([parent])
    end
  end

  describe '#update_klasses' do
    let(:parent) { FactoryGirl.create(:user, role: 'parent') }
    let(:klass1) { FactoryGirl.create(:group) }
    let(:klass2) { FactoryGirl.create(:group) }
    let(:klass3) { FactoryGirl.create(:group) }

    it 'adds first group' do
      parent.update_klasses(["#{klass1.id}"])
      expect(parent.groups).to eq([klass1])
    end

    it 'adds two groups at a time' do
      parent.groups = [klass1]
      parent.update_klasses(["#{klass1.id}", "#{klass2.id}"])
      expect(parent.groups).to eq([klass1, klass2])
    end

    it 'replaces one group with another' do
      parent.groups = [klass1]
      parent.update_klasses(["#{klass2.id}"])
      expect(parent.groups).to eq([klass2])
    end

    it 'does not create duplicate entries' do
      parent.groups = [klass1]
      parent.update_klasses(["#{klass1.id}"])
      expect(parent.groups).to eq([klass1])
    end
  end
end
