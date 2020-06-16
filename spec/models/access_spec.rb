require 'rails_helper'

RSpec.describe Access, type: :model do
  before(:each) do 
    @access = build(:access)
  end
  
  describe '#new' do
    it 'should initialize a access with valid attributes' do
      expect(@access.share_type).to eq('Public')
    end
  end

  describe '#create' do
    it 'should create a access with valid attributes' do
      expect(@access.share_type).to eq('Public')
    end
  end

  context '#validation' do
    describe '#type' do
      it 'should invalidate null value' do
        access = build(:access, :missing_access_type)
        access.valid?

        expect(access.errors[:share_type]).to include("can't be blank")
      end

      it 'should invalidate empty string input' do
        access = build(:access, :empty_string_as_access_type)
        access.valid?

        expect(access.errors[:share_type]).to include("can't be blank")
      end
      it 'should invalidate special characters string' do
        access = build(:access, :invalidate_access_type_with_special_characters)
        access.valid?

        expect(access.errors[:share_type]).to include("is invalid")
      end
    end
  end
end
