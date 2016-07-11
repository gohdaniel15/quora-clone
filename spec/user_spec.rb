# Requiring test environment file
require 'spec_helper'

# Requiring test subject file
require_relative File.join(APP_MODELS, "user")

# Test cases
describe User do
  context "Given a new user" do

    # If fields are left empty
    it "validates first_name presence" do
      user = User.create(last_name: "McStabby", email: "no_first_name@example.com", password: "pancakes", password_confirmation: "pancakes")
      user.should_not be_valid
      user.errors[:first_name].should include("can't be blank")
      user.destroy
    end

    it "validates last_name presence" do
      user = User.create(first_name: "Testy", email: "no_last_name@example.com", password: "pancakes", password_confirmation: "pancakes")
      user.should_not be_valid
      user.errors[:last_name].should include("can't be blank")
      user.destroy
    end

    it "validates email presence" do
      user = User.create(first_name: "Testy", last_name: "McStabby", password: "pancakes", password_confirmation: "pancakes")
      user.should_not be_valid
      user.errors[:email].should include("can't be blank")
      user.destroy
    end

    it "validates password presence" do
      user = User.create(first_name: "Testy", last_name: "McStabby", email: "no_last_name@example.com", password_confirmation: "pancakes")
      user.should_not be_valid
      # user.errors[:password].should include("can't be blank")
      user.destroy
    end

    # If all fields are filled
    it "accepts valid accounts" do
      user = User.create(first_name: "Testy", last_name: "McStabby", email: "valid@example.com", password: "pancakes", password_confirmation: "pancakes")
      user.should be_valid
      user.destroy
    end

    # If email address is already taken
    it "validates unique email address" do
      user1 = User.create(first_name: "Testy", last_name: "McStabby", email: "testy@example.com", password: "pancakes", password_confirmation: "pancakes")
      user = User.new(first_name: "Fail", last_name: "McFaily", email: "testy@example.com", password: "pancakes", password_confirmation: "pancakes")
      user.should_not be_valid
      user.errors[:email].should include("has already been taken")
      user1.destroy
    end

    # If email address is incorrect format
    it "validates email format" do
      user = User.create(first_name: "Testy", last_name: "McStabby", email: "testy.example.com", password: "pancakes", password_confirmation: "pancakes")
      user.should_not be_valid
      user.errors[:email].should include("Invalid email")
      user.destroy
    end

    # If password length is too short
    it "validates password length" do
      user = User.create(first_name: "Testy", last_name: "McStabby", email: "testy@example.com", password: "short", password_confirmation: "short")
      user.should_not be_valid
      user.errors[:password].should include("is too short (minimum is 8 characters)")
      user.destroy
    end

    it "validates password confirmation" do
      user = User.create(first_name: "Testy", last_name: "McStabby", email: "testy@example.com", password: "pancakes", password_confirmation: "notpancakes")
      user.should_not be_valid
      user.errors[:password_confirmation].should include("doesn't match Password")
      user.destroy
    end

  end
end
