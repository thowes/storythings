include ApplicationHelper


shared_examples_for "all static pages" do
	it { should have_selector('h1', text: page_title) }
	it { should have_title(full_title(page_title)) }
	it { should have_link('About', href: about_path) }
	it { should have_link('Home', href: root_path) }
	it { should have_link('Help', href: help_path) }
	it { should have_link('Contact', href: contact_path) }
	it { should have_link('News') }
	it { should have_link('storythings', href: root_path) }
end

shared_examples_for "pages before login" do
	it { should_not have_title(full_title(page_title)) }
	it { should have_title('Sign in') }
	it { should have_link('Sign in') }
	it { should_not have_link('Add') }
	it { should_not have_link('Items') }
	it { should_not have_link('Boxes') }
	it { should_not have_link('Profile') }
	it { should_not have_link('Settings') }
	it { should_not have_link('Sign out') }
end

def valid_signin(user)
	fill_in "Email",    with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end

def sign_in(user, options={})
	if options[:no_capybara]
		# Sign in when not using Capybara.
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
	else
		visit signin_path
		fill_in "Email",    with: user.email
		fill_in "Password", with: user.password
		click_button "Sign in"
	end
end