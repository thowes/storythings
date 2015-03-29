require 'spec_helper'

describe "Licenses" do
	subject { page }

	describe "before login" do
		describe "license index page" do
			before { visit licenses_path }
			let(:page_title) { 'Licenses List' }
			it_should_behave_like "pages before login"
		end
		describe "new license page" do
			before { visit new_license_path }
			let(:page_title) { 'New License' }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		let(:user) { FactoryGirl.create(:user, admin: true) }
		before { sign_in user }
		describe "license index page" do
			before { visit licenses_path }
			let(:page_title) { 'Licenses List' }
			it_should_behave_like "pages after login"
		end
		describe "new license page" do
			before { visit new_license_path }
			let(:page_title) { 'New License' }
			it_should_behave_like "pages after login"
		end
	end

end