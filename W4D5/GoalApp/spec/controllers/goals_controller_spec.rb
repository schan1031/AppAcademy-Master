require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  feature 'GET #new' do
    scenario "Renders a create new goal page" do
      User.destroy_all
      visit new_user_url
      fill_in 'username', :with => "Jimmy New"
      fill_in 'password', :with => "Jimmy's password"
      click_on 'submit'

      session[:session_token] = User.last.session_token
      get :new
      expect(response).to render_template("new")
    end
  end
  feature 'POST #create' do
    scenario 'Generates a new goal when user logged in' do
      User.destroy_all
      visit new_user_url
      fill_in 'username', :with => "Jimmy New"
      fill_in 'password', :with => "Jimmy's password"
      click_on 'submit'
      session[:session_token] = User.last.session_token
      post :create, goal: {
        user_id: User.last.id, body: 'ace assessment 4 in under 30 minutes'
      }
      expect(Goal.last.body).to eq('ace assessment 4 in under 30 minutes')
    end
    scenario 'Redirects to login page when no user logged in' do
      User.destroy_all
      post :create, goal: {
        user_id: 4, body: 'ace assessment 4 in under 30 minutes'
      }
      expect(response).to redirect_to('/session/new')
    end
  end
end
