require 'spec_helper'

describe "badges/edit" do
  before(:each) do
    @badge = assign(:badge, stub_model(Badge,
      :name => "MyString",
      :picture => "MyString"
    ))
  end

  it "renders the edit badge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", badge_path(@badge), "post" do
      assert_select "input#badge_name[name=?]", "badge[name]"
      assert_select "input#badge_picture[name=?]", "badge[picture]"
    end
  end
end
