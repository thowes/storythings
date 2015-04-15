require 'spec_helper'

describe "admin pages" do
	let(:admin) { FactoryGirl.create(:user, admin: true) }
	let(:normal) { FactoryGirl.create(:user) }
	subject { page }

	describe "before login" do
		describe "admin index page" do
			before { visit admins_path }
			let(:page_title) { 'Admin Users List' }
			it_should_behave_like "pages before login"
		end
		describe "show admin page" do
			before { visit admin_path(:admin) }
			let(:page_title) { 'Admin View' }
			it_should_behave_like "pages before login"
		end
		describe "show admin page" do
			before { visit edit_admin_path(:admin) }
			let(:page_title) { 'Admin Edit' }
			it_should_behave_like "pages before login"
		end
	end

	describe "normal login" do
		before { sign_in normal }
		describe "admin index page" do
			before { visit admins_path }
			let(:page_title) { 'Admin Users List' }
			it_should_behave_like "pages for wrong user"
		end
		describe "show admin page" do
			before { visit admin_path(:admin) }
			let(:page_title) { 'Admin View' }
			it_should_behave_like "pages for wrong user"
		end
		describe "show admin page" do
			before { visit edit_admin_path(:admin) }
			let(:page_title) { 'Admin Edit' }
			it_should_behave_like "pages for wrong user"
		end
	end

	describe "admin login" do
		before { sign_in admin }
		describe "admin index page" do
			before { visit admins_path }
			let(:page_title) { 'Admin Users List' }
			it_should_behave_like "pages after login"
		end
	end
end
