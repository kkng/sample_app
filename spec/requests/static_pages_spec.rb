require 'spec_helper'

describe "StaticPages" do # test block title - ignored by RSpec

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	subject { page } # telling RSpec that "page" is the subject of the test

  describe "Home Page" do
		before { visit root_path } # visit root_path before each test

    it { should have_selector('h1', text: 'Sample App') }
		it { should have_selector('title', text: full_title('')) } # full_title is defined in support directory
		it { should_not have_selector('title', text: '| Home') }
  end

  describe "Help Page" do
		before { visit help_path } # visit help_path before each test

		it { should have_selector('h1', text: 'Help') } 
		it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About Page" do
		before { visit about_path } # visit about_path before each test
		
		it { should have_selector('h1', text: 'About Us') } 
		it { should have_selector('title', text: full_title('About')) }
  end

	describe "Contact" do
		before { visit contact_path } # visit contact_path before each test
		
		it { should have_selector('h1', text: 'Contact') } 
		it { should have_selector('title', text: full_title('Contact')) }
	end

end
