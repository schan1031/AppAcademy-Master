
require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  User.destroy_all
  user2=User.create(username: "Another username", password: "passwoes")
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end
  feature "signing up a user" do
    scenario "shows username on the homepages after signup" do
      visit users_url
      expect(page).to have_content user2.username
    end

    scenario "When signing up" do
      User.destroy_all
      visit new_user_url
      fill_in 'username', :with => "Jimmy New"
      fill_in 'password', :with => "Jimmy's password"
      click_on 'submit'
      expect(User.first.nil?).to be(false)
    end
  end

  feature "logging in" do
    scenario "shows username on the homepage after login" do
      visit new_session_url
      User.destroy_all
      user2=User.create(username: "Another username", password: "passwoes")
      fill_in 'username', :with => "Another username"
      fill_in 'password', :with => "passwoes"
      click_on 'submit'
      expect(page).to have_content "Welcome, Another username"
    end
  end



end
