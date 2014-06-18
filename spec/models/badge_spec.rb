require 'spec_helper'

describe Badge do
	subject { @badge }
	before { @badge = Badge.new(name: "Test Badge", picture: "badge.jpg") }

	it { should respond_to(:name) }
	it { should respond_to(:picture) }
	it { should be_valid }

	describe "with blank content" do
		before { @badge.name = " " }
		it { should_not be_valid }
	end

	describe "with name that is too long" do
		before { @badge.name = "a" * 81 }
		it { should_not be_valid }
	end
	
end