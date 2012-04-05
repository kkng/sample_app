require 'spec_helper'

describe "StaticPages" do # test block title - ignored by RSpec

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	subject { page } # telling RSpec that "page" is the subject of the test

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: full_title(page_title)) }
	end

  describe "Home Page" do
		before { visit root_path } # visit root_path before each test
		let(:heading) { 'Sample App' }
		let(:page_title) { '' }

		it_should_behave_like "all static pages"
		it { should_not have_selector('title', text: '| Home') }
  end

  describe "Help Page" do
		before { visit help_path } # visit help_path before each test
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }

		it_should_behave_like "all static pages"
  end

  describe "About Page" do
		before { visit about_path } # visit about_path before each test
		let(:heading) { 'About' }
		let(:page_title) { 'About' }

		it_should_behave_like "all static pages"
  end

	describe "Contact" do
		before { visit contact_path } # visit contact_path before each test
		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact' }

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'title', text: full_title('About Us')
		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')
		click_link "Home"
		page.should have_selector 'title', text: full_title('')
		click_link "Sign up now!"
		page.should have_selector 'title', text: full_title('Sign up')
	end

end
