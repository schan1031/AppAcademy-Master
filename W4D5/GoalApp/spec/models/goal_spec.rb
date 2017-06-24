require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:body) }
end
