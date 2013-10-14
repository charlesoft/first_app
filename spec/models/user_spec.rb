# -*- coding: utf-8 -*-

require 'spec_helper'
require 'simplecov'
SimpleCov.start

describe User do

	it {should allow_mass_assignment_of :name}
	it {should allow_mass_assignment_of :email}
	it {should allow_mass_assignment_of :age}

	it "creates an user" do
		user = User.new(:name => "João Lucas", :email => "ljucasp@gmail.com", :age => 17)
		user.save.should be_true
	end

	it "fail to create a user when name is blank" do
		user = User.new(:email => "jlucasps@gmail.com", :age => 17)
		user.save.should be_false
	end

	it "fail to create a user when email is blank" do
		user = User.new(:name => "João Lucas", :age => 17)
		user.save.should be_false
	end

	it "creates a user with gender value MALE" do
		user = User.new(:name => "Bob Dylan", :email => "bob@dylan.com", :age => 72, :gender => User::MALE)
		user.save.should be_true
	end

	it "creates a user with gender value FEMALE" do
		user = User.new(:name => "Candice Swanepoel", :email => "bob@dylan.com", :age => 72, :gender => User::FAMALE)
		user.save.should be_true 
	end

	context "when age >= 18" do 
		it "creates a user with gender value MALE" do
			user = User.new(:name => "João Lucas", :email => "charlees1509@hotmail.com", :age => 18, :gender => User::MALE)
			user.save.should be_true 
		end

		it "does not create an user without gender value" do
			user = User.new(:name => "João Lucas", :email => "jlucasps@gmail.com", :age =>18)
			user.save.should be_false
		end
	end

	context "when age < 18" do 
		it "creates a user with gender value MALE" do
			user = User.new(:name => "João Lucas", :email => "charlees1509@hotmail.com", :age => 17, :gender => User::MALE)
			user.save.should be_true 
		end

		it "does not create an user without gender value" do
			user = User.new(:name => "João Lucas", :email => "jlucasps@gmail.com", :age =>17)
			user.save.should be_true
		end
	end

	it"create two users with different emails" do
		user_1 = User.create(:name => "Primeiro Usuario", :email => "email_1@gmail.com")
		user_2 = User.new(:name => "Segundo usuário", :email => "email_2@gmail.com")
		user_2.save.should be_true
	end


	it"does not create two users with same emails" do
		user_1 = User.create(:name => "Primeiro Usuario", :email => "email_1@gmail.com")
		user_2 = User.new(:name => "Segundo usuário", :email => "email_1@gmail.com")
		user_2.save.should be_false
	end

end