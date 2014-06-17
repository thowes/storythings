require 'spec_helper'

describe "Boxes pages" do
	subject { page }
	
  describe "box index page" do
		before { visit '/boxes/index' }
		it { should have_content('Boxes') }
		it { should have_title(full_title('Boxes')) }
  end
end