require 'spec_helper'

describe "licenses/new" do
  before(:each) do
    assign(:license, stub_model(License,
      :name => "MyString",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", licenses_path, "post" do
      assert_select "input#license_name[name=?]", "license[name]"
      assert_select "input#license_price[name=?]", "license[price]"
    end
  end
end
