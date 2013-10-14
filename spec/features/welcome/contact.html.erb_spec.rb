require 'spec_helper'

describe ".contact", :type => :feature do 

	it "access contact page" do

		visit contact_path
		page.should have_content("How to find us")

	end

end