require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit "users/#{user.id}" }#Ugly, but I got stuck hard and I must moove.

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit "/signup" }

    it { should have_title('Sign up') }
  end

  describe "signup" do

    before { visit "/signup" }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "seach a user" do
    # let(:user) { FactoryGirl.create(:user) }
    # let(:other_user) { FactoryGirl.create(:user) }
    # before { visit "users/#{user.id}" }
    # it { should have_content(user.name) }
    # it { should have_title(user.name) }
    # fill_in 'search-form', :with => other_user.email
    # click_button "Search"
    # expect { click_button "Add Friend #{other_user.email}" }
    

  end







end

