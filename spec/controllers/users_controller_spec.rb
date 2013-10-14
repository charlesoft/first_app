require 'spec_helper'

describe UsersController do
	let(:user_bart){FactoryGirl.find_or_create(:user_bart)}
	before(:each) do
		sign_in user_bart
	end

	describe "GET index" do
		it "assigns @users" do
			saved_users =[FactoryGirl.find_or_create(:user_bart),
				FactoryGirl.find_or_create(:user_lisa)]

				get :index
				assigns(:users).should eq(saved_users)
			end
		end

		describe "GET new" do
			it "access new action" do
				get :new
				assigns(:user).should be_a_new(User)
			end
		end

		describe "DELETE" do
			it "deletes an user" do
				user_lisa = FactoryGirl.create(:user_lisa)
				expect {
					delete :destroy, :id => user_lisa.id
					}.to change(User, :count).by(-1)
				end
			end
		end