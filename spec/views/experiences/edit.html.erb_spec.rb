require 'spec_helper'

describe "experiences/edit" do
  before(:each) do
    @experience = assign(:experience, stub_model(Experience))
  end

  it "renders the edit experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", experience_path(@experience), "post" do
    end
  end
end
