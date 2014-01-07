require 'spec_helper'

describe "the user viewing the homepage" do
  it "can view login button" do
    visit root_path
    expect(page).to have_content("Get started with Github")
    click_on "Get started with Github"
    #expect(page.status_code).to eq(301)
  end
end
