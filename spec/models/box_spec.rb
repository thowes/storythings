require 'spec_helper'

describe Box do
	let(:user) { FactoryGirl.create(:user) }
	before { @box = user.items.build(name: "Laptop Bag", is_a_box: true) }

	subject { @box }
	it { should respond_to(:name) }
	it { should respond_to(:is_a_box) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should be_valid }

	describe "when user_id is not present" do
		before { @box.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @box.name = " " }
		it { should_not be_valid }
	end

	describe "with name that is too long" do
		before { @box.name = "a" * 81 }
		it { should_not be_valid }
	end
	
end