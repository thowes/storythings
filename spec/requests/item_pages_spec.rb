require 'spec_helper'

describe "Item pages" do
	subject { page }
	
  describe "item index page" do
		before { visit items_path }
		it { should have_content('Items') }
		it { should have_title(full_title('Items')) }
  end
	
  describe "new item page" do
		before { visit add_path }
		it { should have_content('Create New Item') }
		it { should have_title(full_title('Create New Item')) }
  end
end