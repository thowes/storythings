require 'spec_helper'

describe "Boxes pages" do
	subject { page }
	
	describe "box index page" do
		before { visit boxes_path }
		let(:page_title) { 'Boxes' }
		it_should_behave_like "all static pages"
		it { should have_link('Create New Box', href: box_path) }
	end
	
	describe "new box page" do
		before { visit box_path }
		let(:page_title) { 'Create New Box' }
		it_should_behave_like "all static pages"
	end
end