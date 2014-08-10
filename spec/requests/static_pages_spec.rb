require 'spec_helper'

describe "Static pages" do
	subject { page }

	describe "Home page" do
		before { visit root_path }
		it { should have_content('Welcome to Storythings') }
		it { should have_title(full_title('')) }
		it { should_not have_title('| Home') }
		it "should have the right links on the layout" do
			visit root_path
			click_link "Sign up now!"
			expect(page).to have_title(full_title('Sign up'))
			click_link site_title
			expect(page).to have_title(full_title(''))
		end
		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_path
			end
			#it "should render the user's feed" do
				#user.feed.each do |item|
				#	expect(page).to have_selector("div##{item.id}", text: item.content)
				#end
			#end
			describe "follower/following counts" do
				let(:other_user) { FactoryGirl.create(:user) }
				before do
					other_user.follow!(user)
					visit root_path
				end
				it { should have_link("0 following", href: following_user_path(user)) }
				it { should have_link("1 followers", href: followers_user_path(user)) }
			end
		end
	end

	describe "Help page" do
		before { visit help_path }
		let(:page_title) { 'Help' }
		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }
		let(:page_title) { 'About' }
		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
		before { visit contact_path }
		let(:page_title) { 'Contact' }
		it_should_behave_like "all static pages"
	end
end