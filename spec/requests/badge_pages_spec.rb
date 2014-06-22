require 'spec_helper'

describe "Badges" do
	subject { page }

	describe "before login" do
		describe "badge index page" do
			before { visit badges_path }
			let(:page_title) { 'Badges List' }
			it_should_behave_like "pages before login"
		end
		describe "new badge page" do
			before { visit new_badge_path }
			let(:page_title) { 'New Badge' }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		describe "badge index page" do
			before { visit badges_path }
			let(:page_title) { 'Badges List' }
			it_should_behave_like "pages after login"
		end
		describe "new badge page" do
			before { visit new_badge_path }
			let(:page_title) { 'New Badge' }
			it_should_behave_like "pages after login"
		end
	end

end