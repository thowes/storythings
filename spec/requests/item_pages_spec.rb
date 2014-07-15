require 'spec_helper'

describe "Item pages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	let(:wrong) { FactoryGirl.create(:user) }
	let!(:box) { FactoryGirl.create(:item, user: user, name: "MyTestUser Box", is_a_box: true) }
	let!(:thing) { FactoryGirl.create(:item, user: user, name: "MyTestUser Thing") }
	let!(:w_item) { FactoryGirl.create(:item, user: wrong, name: "WrongUser Thing") }

	describe "before login" do
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items List' }
			it_should_behave_like "pages before login"
			it { should_not have_content("MyTestUser") }
			it { should_not have_content("WrongUser") }
		end
		describe "boxes page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes List' }
			it_should_behave_like "pages before login"
			it { should_not have_content("MyTestUser") }
			it { should_not have_content("WrongUser") }
		end
		describe "coll items page" do
			before { visit coll_path }
			let(:page_title) { 'Coll List' }
			it_should_behave_like "pages before login"
			it { should_not have_content("MyTestUser") }
			it { should_not have_content("WrongUser") }
		end
		describe "components page" do
			before { visit components_path }
			let(:page_title) { 'Components List' }
			it_should_behave_like "pages before login"
			it { should_not have_content("MyTestUser") }
			it { should_not have_content("WrongUser") }
		end
		describe "things page" do
			before { visit things_path }
			let(:page_title) { 'Things List' }
			it_should_behave_like "pages before login"
			it { should_not have_content("MyTestUser") }
			it { should_not have_content("WrongUser") }
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "pages before login"
		end
		describe "new box page" do
			before { visit newbox_path }
			let(:page_title) { 'New Box' }
			it_should_behave_like "pages before login"
		end
		describe "show box" do
			before { visit item_path(box) }
			let(:page_title) { box.name }
			it_should_behave_like "all static pages"
			it { should have_content(box.user.name) }
		end
		describe "show thing" do
			before { visit item_path(thing) }
			let(:page_title) { thing.name }
			it_should_behave_like "all static pages"
			it { should have_content(thing.user.name) }
		end
		describe "show wrong item" do
			before { visit item_path(w_item) }
			let(:page_title) { w_item.name }
			it_should_behave_like "all static pages"
			it { should have_content(w_item.user.name) }
		end
		describe "edit box" do
			before { visit edit_item_path(box) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages before login"
		end
		describe "edit thing" do
			before { visit edit_item_path(thing) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages before login"
		end
		describe "edit wrong item" do
			before { visit edit_item_path(w_item) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages before login"
		end
	end

	describe "after login" do
		before { sign_in user }
		describe "item index page" do
			before { visit items_path }
			let(:page_title) { 'Items List' }
			it_should_behave_like "pages after login"
			it { should have_content(box.name) }
			it { should have_link(box.name, href: item_path(box)) }
			it { should have_content(thing.name) }
			it { should have_link(thing.name, href: item_path(thing)) }
		end
		describe "boxes page" do
			before { visit boxes_path }
			let(:page_title) { 'Boxes' }
			it_should_behave_like "pages after login"
			it { should have_content(box.name) }
			it { should_not have_content(thing.name) }
			it { should_not have_content(w_item.name) }
			it { should have_link('Create New Box', href: newbox_path) }
		end
		describe "things page" do
			before { visit things_path }
			let(:page_title) { 'Things' }
			it_should_behave_like "pages after login"
			it { should_not have_content(box.name) }
			it { should_not have_content(w_item.name) }
			it { should have_content(thing.name) }
			it { should have_link('Create New Item', href: add_path) }
			it { should have_link('Boxes', href: boxes_path) }
		end
		describe "new item page" do
			before { visit add_path }
			let(:page_title) { 'Add New Item' }
			it_should_behave_like "pages after login"
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
		describe "new box page" do
			before { visit newbox_path }
			let(:page_title) { 'New Box' }
			it_should_behave_like "pages after login"
			describe "with invalid information" do
				it "should not create an item" do
					expect { click_button "Create New Box" }.not_to change(Item, :count)
				end
				describe "error messages" do
					before { click_button "Create New Box" }
					it { should have_content('error') }
				end
			end
			describe "with valid information" do
				before { fill_in 'item_name', with: "My Intradimensional Box" }
				it "should create a box" do
					expect { click_button "Create New Box" }.to change(Item, :count).by(1)
				end
			end
		end
		describe "show box" do
			before { visit item_path(box) }
			let(:page_title) { box.name }
			it_should_behave_like "pages after login"
		end
		describe "show thing" do
			before { visit item_path(thing) }
			let(:page_title) { thing.name }
			it_should_behave_like "pages after login"
		end
		describe "edit box" do
			before { visit edit_item_path(box) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages after login"
		end
		describe "edit wrong item" do
			before { visit edit_item_path(w_item) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages for wrong user"
			it { should_not have_content( w_item.name ) }
		end
		describe "edit thing" do
			before { visit edit_item_path(thing) }
			let(:page_title) { 'Edit Item' }
			it_should_behave_like "pages after login"
			describe "error messages" do
				before { fill_in 'item_name', with: "" }
				before { click_button "Save changes" }
				it { should have_content('error') }
			end
			describe "with a valid name" do
				before { fill_in 'item_name', with: "My Renamed Thing" }
				before { click_button "Save changes" }
				it { should have_content('My Renamed Thing') }
			end
		end
	end

end