require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:each) do 
    @profile = build(:profile)
  end
  
  describe '#new' do
    it 'should initialize a customer with valid attributes' do
      expect(@profile.first_name).to eq('Indrajit')
      expect(@profile.last_name).to eq('Naiya')
    end
  end

  describe '#create' do
    it 'should create a collection with valid attributes' do
      expect(@profile.first_name).to eq('Indrajit')
      expect(@profile.last_name).to eq('Naiya')
    end
  end

  context '#validation' do
    describe '#first_name' do
      it 'should invalidate null value' do
        profile = build(:profile, :missing_profile_first_name)
        profile.valid?

        expect(profile.errors[:first_name]).to include("can't be blank")
      end

      it 'should invalidate empty string input' do
        profile = build(:profile, :empty_string_as_profile_first_name)
        profile.valid?

        expect(profile.errors[:first_name]).to include("can't be blank")
      end
      it 'should invalidate special characters string' do
        profile = build(:profile, :invalidate_profile_first_name_with_special_characters)
        profile.valid?

        expect(profile.errors[:first_name]).to include("is invalid")
      end
    end
    describe '#last_name' do
      it 'should invalidate null value' do
        profile = build(:profile, :missing_profile_last_name)
        profile.valid?

        expect(profile.errors[:last_name]).to include("can't be blank")
      end

      it 'should invalidate empty string input' do
        profile = build(:profile, :empty_string_as_profile_last_name)
        profile.valid?

        expect(profile.errors[:last_name]).to include("can't be blank")
      end
      it 'should invalidate special characters string' do
        profile = build(:profile, :invalidate_profile_last_name_with_special_characters)
        profile.valid?

        expect(profile.errors[:last_name]).to include("is invalid")
      end
    end
  end
  context 'Associations' do
    describe 'user_id' do
      it 'should have belongs_to association with user' do
        t = Profile.reflect_on_association(:user)
        expect(t.macro).to eq(:belongs_to)
      end
    end
  end
end
