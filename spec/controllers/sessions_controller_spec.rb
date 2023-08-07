require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #create" do
    context "with valid email and password" do

      it "logs in the user and redirects to root_path" do
        post :create, params: { email: "test@dummymail.com", password: "password" }
        expect(session[:user_id]).to eq(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Logged in successfully")
      end
    end

    context "with invalid password" do
      it "redirects to new_sessions_path with an alert" do
        post :create, params: { email: "test@dummymail.com", password: 'wrongpassword' }
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(new_sessions_path)
        expect(flash[:alert]).to eq("Invalid Password")
      end
    end

    context "with invalid email" do
      it "redirects to new_sessions_path with an alert" do
        post :create, params: { email: 'nonexistent@dummymail.com', password: 'password123' }
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(new_sessions_path)
        expect(flash[:alert]).to eq("Invalid Email")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      session[:user_id] = 1
    end

    it "logs out the user and redirects to root_path" do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Logged out successfully!")
    end
  end
end