require 'rails_helper'

RSpec.describe Tagged::User, type: :model do
  it { should validate_presence_of :email }
  it { should have_one :identity }

  describe 'email validations' do
    it 'does not allow a malformed email' do
      user = described_class.new(email: '1234-234234.gbfgfg')
      user.valid?
      expect(user.errors).to have_key :email
    end
    it 'allows an email with correct formatting' do
      user = described_class.new(email: 'tests-2.35@foo.test.example.com')
      user.valid?
      expect(user.errors).to_not have_key :email
    end
  end

  describe '.authenticate' do

    let!(:user) { create(:user) }

    context 'given valid credentials' do
      it 'returns the user' do
        expect(Tagged::User.authenticate(user.email, 'p4ssword')).to eq user
      end
    end

    context 'given invalid credentials' do
      it 'returns nil' do
        expect(Tagged::User.authenticate(user.email, 'wrong')).to be_nil
      end
    end
  end
end
