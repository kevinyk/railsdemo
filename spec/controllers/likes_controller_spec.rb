require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
    visit '/secrets'
    click_button 'Like'
  end
  describe "when not logged in" do
  	it "redirects to the login page" do
    	expect(current_path).to eq("/sessions/new")
    end
  end
  # ...
  describe "when signed in as the wrong user" do
    // your code here
  end 
end
end