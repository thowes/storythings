require 'spec_helper'

describe "Item pages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	let!(:i1) { FactoryGirl.create(:item, user: user, name: "Trashcan", is_a_box: true) }
	let!(:i2) { FactoryGirl.create(:item, user: user, name: "Laptop") }

	describe "before login" do
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items List' }
			it_should_behave_like "pages before login"
			it { should_not have_content(i1.name) }
			it { should_not have_content(i2.name) }
		end
		describe "boxes page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes List' }
			it_should_behave_like "pages before login"
			it { should_not have_content(i1.name) }
			it { should_not have_content(i2.name) }
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "pages before login"
		end
		describe "show item i1 page" do
			before { visit item_path(i1) }
			let(:page_title) { i1.name }
			it_should_behave_like "pages before login"
		end
		describe "show item i2 page" do
			before { visit item_path(i2) }
			let(:page_title) { i2.name }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		before { sign_in user }
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items List' }
			it_should_behave_like "pages after login"
			it { should have_content(i1.name) }
			it { should have_link(i1.name, href: item_path(i1)) }
			it { should have_content(i2.name) }
			it { should have_link(i2.name, href: item_path(i2)) }
		end
		describe "boxes page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes List' }
			it_should_behave_like "pages after login"
			it { should have_content(i1.name) }
			it { should_not have_content(i2.name) }
			it { should have_link('Create New Box', href: newbox_path) }
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "pages after login"
		end
		describe "show item i1 page" do
			before { visit item_path(i1) }
			let(:page_title) { i1.name }
			it_should_behave_like "pages after login"
		end
		describe "show item i2 page" do
			before { visit item_path(i2) }
			let(:page_title) { i2.name }
			it_should_behave_like "pages after login"
		end
	end

	describe "item creation" do
		before { sign_in user }
		before { visit add_path }
		describe "with invalid information" do
			it "should not create an item" do
				expect { click_button "Add Item" }.not_to change(Item, :count)
			end
			describe "error messages" do
				before { click_button "Add Item" }
				it { should have_content('error') }
			end
		end
		describe "with valid information" do
			before { fill_in 'item_name', with: "Old Junk" }
			it "should create an item" do
				expect { click_button "Add Item" }.to change(Item, :count).by(1)
			end
		end
	end

end