require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    # validation tests/examples here
    before do
      @subject = User.new(first_name: "la", last_name: "la", email: "TEST@TEST.com", password: "abc123", password_confirmation: "abc123")
    end
    it "is valid with valid attributes" do
      expect(@subject).to be_valid
      @subject.save
      expect(@subject.save).to eq(true)
    end
    it "is not valid without password" do
      @subject.password = nil
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Password can't be blank"
    end
    it "is not valid without password_confirmation" do
      @subject.password_confirmation = nil
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it "is not valid with unmatched password" do
      @subject.password_confirmation = "123"
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "is not valid without a first name" do
      @subject.first_name = nil
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "First name can't be blank"
    end

    it "is not valid without a last name" do
      @subject.last_name = nil
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Last name can't be blank"
    end
    it "is not valid without email" do
      @subject.email = nil
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Email can't be blank"
    end
    it "Password length must be minimum 3 chars" do
      @subject.password = "1"
      @subject.password_confirmation = "1"
      expect(@subject).to_not be_valid
      expect(@subject.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end

    it "is not valid without unique email" do
      @subject.save
      subject2 = User.new(first_name: "lala", last_name: "lala", email: "TEST@TEST.com", password: "abc123", password_confirmation: "abc123")
      expect(subject2).to_not be_valid
      expect(subject2.errors.full_messages).to include "Email has already been taken"
    end
    it "is not valid without unique email with case sensitive" do
      @subject.save
      subject3 = User.new(first_name: "lalala", last_name: "lalala", email: "test@test.COM", password: "abc123", password_confirmation: "abc123")
      expect(subject3).to_not be_valid
      expect(subject3.errors.full_messages).to include "Email has already been taken"
    end
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { should have_secure_password }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_length_of(:password_confirmation) }
    # it { should validate_uniqueness_of(:email).case_insensitive }

  end
  describe '.authenticate_with_credentials' do
    before do
      @subject = User.create!(first_name: "la", last_name: "la", email: "ANOTHERTEST@TEST.com", password: "abc123", password_confirmation: "abc123")
    end
    it "Can log in with correct credentials" do
      @user = User.authenticate_with_credentials('ANOTHERTEST@TEST.com', "abc123")
      expect(@user).to eq(@subject)
    end
    it "Can not log in with wrong email" do
      @user = User.authenticate_with_credentials('ATEST@TEST.com', "abc123")
      expect(@user).to eq(nil)
    end
    it "Can not log on with the wrong password" do
      @incorrect_user = User.authenticate_with_credentials('ANOTHERTEST@TEST.com', "nah")
      expect(@incorrect_user).to eq(nil)
    end

    it "Can log on with white spaces before email" do
      @correct_user = User.authenticate_with_credentials('     ANOTHERTEST@TEST.com', "abc123")
      expect(@correct_user).to eq(@user)
    end

    it "Can log on with wrong cases for email" do
      @correct_user = User.authenticate_with_credentials('test@test.COM', "abc123")
      expect(@correct_user).to eq(@user)
    end
  end
end