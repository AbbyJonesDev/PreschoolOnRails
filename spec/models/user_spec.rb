# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  fname                  :string           default(""), not null
#  lname                  :string           default(""), not null
#  role                   :string           default("parent"), not null
#  active                 :boolean          default(TRUE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:admin)  { FactoryGirl.create(:user, role: "admin")  }
    let(:parent) { FactoryGirl.create(:user, role: 'parent') }
    let(:klass1) { FactoryGirl.create(:group) }
    let(:klass2) { FactoryGirl.create(:group) }
    let(:klass3) { FactoryGirl.create(:group) }

  describe 'validations' do
    it { should have_and_belong_to_many(:groups) }
    it { should have_and_belong_to_many(:students) }
    it { should validate_uniqueness_of(:email) }
  end

  describe '#parents' do    
    xit "only returns users who are parents" do
      expect(User.parents).to eq([parent])
    end
  end

  describe '#update_klasses' do

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

  describe '#klass_ids' do
    it "returns array of group ids" do
      parent.groups = [klass1, klass2]
      expect(parent.klass_ids).to eq([klass1.id, klass2.id])
    end

    it "returns empty array if user has no groups" do
      parent.groups = []
      expect(parent.klass_ids).to eq([])
    end
  end
end
