require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "index" do
		let(:user) { FactoryGirl.create(:user) }
		before(:each) do
			sign_in user
			visit users_path
		end
		it { should have_title('All Users') }
		it { should have_content('All Users') }

		describe "pagination" do
			before(:all) { 30.times { FactoryGirl.create(:user) } }
			after(:all)  { User.delete_all }
			it { should have_selector('div.pagination') }
			it "should list each user" do
				User.paginate(page: 1).each do |user|
					expect(page).to have_selector('b', text: user.name)
				end
			end
		end

		describe "delete links" do
			it { should_not have_link('delete') }
			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
				before do
					sign_in admin
					visit users_path
				end
				it { should have_link('delete', href: user_path(User.first)) }
				it "should be able to delete another user" do
					expect do
						click_link('delete', match: :first)
					end.to change(User, :count).by(-1)
				end
				it { should_not have_link('delete', href: user_path(admin)) }
			end
		end
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user, admin: true) }
		let(:wrong) { FactoryGirl.create(:user) }
		let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
		let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }
		let!(:i1) { FactoryGirl.create(:item, user: user, name: "Junk A") }
		let!(:i2) { FactoryGirl.create(:item, user: user, name: "Laptop") }
		let!(:i3) { FactoryGirl.create(:item, user: user, name: "Stuff B") }
		let!(:i4) { FactoryGirl.create(:item, user: user, name: "Thing C") }
		let!(:i5) { FactoryGirl.create(:item, user: user, name: "Trinket D") }
		let!(:i6) { FactoryGirl.create(:item, user: user, name: "Chekovs Gun") }
		let!(:i7) { FactoryGirl.create(:item, user: user, name: "Katana") }
		let!(:i8) { FactoryGirl.create(:item, user: user, name: "The One Ring") }
		let!(:i9) { FactoryGirl.create(:item, user: user, name: "Pandoras Box") }
		before { visit user_path(user) }
		describe "content" do
			before { sign_in user }
			it { should have_content(user.name) }
			it { should have_title(user.name) }
			it { should have_content(m1.content) }
			it { should have_content(m2.content) }
			it { should have_content(user.microposts.count) }
			it { should have_content(user.items.count) }
		end
    describe "follow/unfollow buttons" do
      let(:other_user) { FactoryGirl.create(:user) }
      before { sign_in user }

      describe "following a user" do
        before { visit user_path(other_user) }

        it "should increment the followed user count" do
          expect do
          	click_button "Follow"
        	end.to change(user.followed_users, :count).by(1)
        end

        it "should increment the other user's followers count" do
          expect do
            click_button "Follow"
          end.to change(other_user.followers, :count).by(1)
        end

        describe "toggling the button" do
          before { click_button "Follow" }
          it { should have_xpath("//input[@value='Unfollow']") }
        end
      end

      describe "unfollowing a user" do
        before do
          user.follow!(other_user)
          visit user_path(other_user)
        end

        it "should decrement the followed user count" do
          expect do
            click_button "Unfollow"
          end.to change(user.followed_users, :count).by(-1)
        end

        it "should decrement the other user's followers count" do
          expect do
          	click_button "Unfollow"
          end.to change(other_user.followers, :count).by(-1)
        end

        describe "toggling the button" do
          before { click_button "Unfollow" }
          it { should have_xpath("//input[@value='Follow']") }
        end
      end
    end
	end

	describe "signup page" do
		before { visit signup_path }
		let(:page_title) { 'Sign up' }
		it_should_behave_like "all static pages"
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
			describe "after submission" do
				before { click_button submit }
				it { should have_title('Sign up') }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by(email: 'user@example.com') }
				it { should have_link('Sign out') }
				it { should have_title(user.name) }
				it { should have_selector('div.success', text: 'Welcome') }
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end
		#before { visit edit_user_path(user) }

		describe "page" do
			it { should have_content("Update your profile") }
			it { should have_title("Update your profile") }
			it { should have_link('change', href: 'http://gravatar.com/emails') }
		end
		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end
		describe "with valid information" do
			let(:new_name)  { "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name",             with: new_name
				fill_in "Email",            with: new_email
				fill_in "Password",         with: user.password
				fill_in "Confirm Password", with: user.password
				click_button "Save changes"
			end
			it { should have_title(new_name) }
			it { should have_selector('div.success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.name).to  eq new_name }
			specify { expect(user.reload.email).to eq new_email }
		end
		describe "forbidden attributes" do
			let(:params) do
				{ user: { admin: true, password: user.password,
									password_confirmation: user.password } }
			end
			before do
				sign_in user, no_capybara: true
				patch user_path(user), params
			end
			specify { expect(user.reload).not_to be_admin }
		end
	end
	
	describe "following/followers" do
		let(:user) { FactoryGirl.create(:user) }
		let(:other_user) { FactoryGirl.create(:user) }
		before { user.follow!(other_user) }
		describe "followed users" do
			before do
				sign_in user
				visit following_user_path(user)
			end
			it { should have_title(full_title('Following')) }
			it { should have_selector('h3', text: 'Following') }
			it { should have_link(other_user.name, href: user_path(other_user)) }
		end
		describe "followers" do
			before do
				sign_in other_user
				visit followers_user_path(other_user)
			end
			it { should have_title(full_title('Followers')) }
			it { should have_selector('h3', text: 'Followers') }
			it { should have_link(user.name, href: user_path(user)) }
		end
	end

	describe "admin user" do
		let(:user) { FactoryGirl.create(:user, admin: true) }
		let(:wrong) { FactoryGirl.create(:user) }
		before { sign_in user }
		describe "user admin page" do
			before { visit user_admin_path(wrong) }
			let(:page_title) { 'User Admin View' }
			it_should_behave_like "pages after login"
		end
	end

	describe "non-admin user" do
		let(:user) { FactoryGirl.create(:user, admin: true) }
		let(:wrong) { FactoryGirl.create(:user) }
		before { sign_in wrong }
		describe "user admin page" do
			before { visit user_admin_path(user) }
			let(:page_title) { 'User Admin View' }
			it_should_behave_like "pages for wrong user"
		end
	end

	describe "tester user" do
		let(:user) { FactoryGirl.create(:user, tester: true) }
		before { sign_in user }
	end
end