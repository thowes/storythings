require 'spec_helper'

describe "Boxes pages" do
	subject { page }

	describe "before login" do
		describe "box index page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes' }
			it_should_behave_like "pages before login"
		end
		describe "new box page" do
			before { visit new_box_path }
			let(:page_title) { 'New Box' }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		describe "item index page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes' }
			it_should_behave_like "all static pages"
			it { should have_link('Create New Box', href: new_box_path) }
		end
		describe "new box page" do
			before { visit new_box_path }
			let(:page_title) { 'New Box' }
			it_should_behave_like "all static pages"
		end
	end

end