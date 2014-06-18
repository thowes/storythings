require 'spec_helper'

describe "Item pages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }

	describe "before login" do
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items' }
			it_should_behave_like "pages before login"
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		before { sign_in user }
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items' }
			it_should_behave_like "all static pages"
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "all static pages"
		end
	end

end