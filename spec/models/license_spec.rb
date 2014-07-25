require 'spec_helper'

describe License do
	subject { @license }
	before { @license = License.new(name: "Test License", price: "1.00") }

	it { should respond_to(:name) }
	it { should respond_to(:price) }
end
