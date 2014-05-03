require 'spec_helper'

feature 'Comment' do

  before(:each) do
    signup_as_jeff
  end

  context "commenting on a goal" do

    before(:each) do
      create_test_goal
      click_link "Comment"
    end

    scenario "a user can navigate to the comment page" do
      expect(page).to have_content "Comment"
    end

    scenario "a user can't leave a blank comment" do
      click_button "Add Comment"
      expect(page).to have_content "can't be blank"
    end

    scenario "adds a non-blank comment and returns to the user home page" do
      fill_in "Comment", with: "I'm a comment!"
      click_button "Add Comment"
      expect(page).to have_content "Home"
      expect(page).to have_content "I'm a comment!"
    end

  end

  context "commenting on a user" do

    before(:each) do
      buck = FactoryGirl.create(:buck)
      visit user_url(buck)
    end

    scenario "a user can't leave a blank comment" do
      click_button "Add Comment"
      expect(page).to have_content "can't be blank"
    end

    scenario "adds a non-blank comment and returns to the user home page" do
      fill_in "Comment", with: "I'm a comment!"
      click_button "Add Comment"
      expect(page).to have_content "#{buck.name}"
      expect(page).to have_content "I'm a comment!"
    end

  end

end

