require 'spec_helper'

describe Item do
	let(:user) { FactoryGirl.create(:user) }
	before { @item = user.items.build(name: "Old Laptop") }

	subject { @item }
	it { should respond_to(:name) }
	it { should respond_to(:is_a_box) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:root_id) }
	it { should respond_to(:root) }
	it { should respond_to(:root?) }
	it { should respond_to(:is_root?) }
	it { should respond_to(:parent_id) }
	it { should respond_to(:parent) }
	it { should respond_to(:children) }
	it { should respond_to(:path_ids) }
	it { should respond_to(:path) }
	it { should respond_to(:depth) }
	it { should be_valid }

	describe "when user_id is not present" do
		before { @item.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @item.name = " " }
		it { should_not be_valid }
	end

	describe "with name that is too long" do
		before { @item.name = "a" * 81 }
		it { should_not be_valid }
	end
end