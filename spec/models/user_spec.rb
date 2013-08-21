require 'spec_helper'

describe User do
	it "is valid with a full name, email, password and role" do
		user = User.create(:first_name => 'Heather', :last_name => 'Poinsetta', :email => 'heather@flatironschool.com', :password => 'heather', :roles => 0 )
		expect(user).to be_valid
	end
end