require 'spec_helper'

describe "Boxes pages" do
	subject { page }
	
  describe "box index page" do
		before { visit boxes_path }
		it { should have_content('Boxes') }
		it { should have_title(full_title('Boxes')) }
  end
	
  describe "new box page" do
		before { visit box_path }
		it { should have_content('Create New Box') }
		it { should have_title(full_title('Create New Box')) }
  end
end