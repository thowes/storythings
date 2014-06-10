require 'spec_helper'

describe Item do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @item = Item.new(name: "Old Laptop", user_id: user.id)
  end

  subject { @item }
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end
end