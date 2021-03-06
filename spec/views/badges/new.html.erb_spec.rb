require 'spec_helper'

describe "badges/new" do
  before(:each) do
    assign(:badge, stub_model(Badge,
      :name => "MyString",
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new badge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", badges_path, "post" do
      assert_select "input#badge_name[name=?]", "badge[name]"
      assert_select "input#badge_picture[name=?]", "badge[picture]"
    end
  end
end
