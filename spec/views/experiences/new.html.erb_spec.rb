require 'spec_helper'

describe "experiences/new" do
  before(:each) do
    assign(:experience, stub_model(Experience).as_new_record)
  end

  it "renders new experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", experiences_path, "post" do
    end
  end
end
