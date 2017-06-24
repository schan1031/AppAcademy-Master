require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  User.destroy_all
  user2=User.create(username: "Another username", password: "passwoes")

  describe "GET #index" do
    it "render the index page" do
      get :index

      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "shows the user page" do
      get :show, id: user2.id
      expect(response).to render_template("show")
      expect(response).to have_http_status(200)

    end
  end

  describe "GET #new" do
    it "renders the sign up page" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "with valid parameters, adds a new user" do
      post :create, user: {
        username: 'dragonslayer', password: 'bigsword'
      }
      tmp_user = User.find_by_credentials('dragonslayer', 'bigsword')
      expect(tmp_user).to be_a(User)
      expect(response).to redirect_to(user_url(tmp_user))
    end

    it "with invalid parameters, redirects to sign up and flashes error" do
      post :create, user: {
        password: 'ab'
      }
      expect(User.find_by_credentials('', 'ab')).to be(nil)
      expect(response).to render_template('new')
    end
  end
end
