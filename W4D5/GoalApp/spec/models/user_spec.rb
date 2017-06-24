require 'rails_helper'

RSpec.describe User, type: :model do

  # user=User.create!(username: "a valid username", password_digest: "anything", session_token: "anything")
  user2=User.create(username: "Another username", password: "passwoes")

  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "Finds by credentials" do
    expect(User.find_by_credentials("Another username", "passwoes")).to eq(User.find_by(username: "Another username"))
  end

  it "Doesn't return false positives with invalid credentials" do
    expect(User.find_by_credentials("False user", "ddd")).to be(nil)
  end

  it "Resets a session token" do
    old_token = User.second.session_token
    User.second.reset_session_token!
    expect(User.second.session_token).not_to eq(old_token)
  end

  it "Verifies a correct password" do
    expect(User.second.is_password?("passwoes")).to eq(true)
  end

  it "Rejects an incorrect password" do
    expect(User.second.is_password?("fdfdfe")).to eq(false)
  end

  it "Sets a session token" do
    expect(user2.session_token.nil?).to eq(false)
  end



end
