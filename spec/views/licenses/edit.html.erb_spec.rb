require 'spec_helper'

describe "licenses/edit" do
  before(:each) do
    @license = assign(:license, stub_model(License,
      :name => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", license_path(@license), "post" do
      assert_select "input#license_name[name=?]", "license[name]"
      assert_select "input#license_price[name=?]", "license[price]"
    end
  end
end
