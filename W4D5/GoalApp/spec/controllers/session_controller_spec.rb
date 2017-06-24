require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  User.destroy_all
  user2=User.create(username: "Another username", password: "passwoes")

  describe 'GET #new' do
    it 'renders a login page' do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    it 'logs a user in with valid credentials' do
      post :create, user: {
        username: user2.username, password: 'passwoes'
      }
      expect(session[:session_token]).to eq(User.first.session_token)
      expect(response).to redirect_to(user_url(User.first))
    end

    it 'fails to log in with invalid credentials' do
      post :create, user: {
        username: 'fake', password: '123457'
      }
      # expect(current_user).to be(nil)
      expect(response).to render_template("new")
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out a user' do
      post :create, user: {
        username: user2.username, password: 'passwoes'
      }
      delete :destroy, session: {}
      expect(session[:session_token]).to be(nil)
    end
  end
end
