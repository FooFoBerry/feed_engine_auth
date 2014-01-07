require 'spec_helper'

describe "the user viewing the homepage" do
  it "can view login button" do
    visit root_path
    expect(page).to have_link("Get started with Github",
                              :href => "/auth/github")
    click_on 'Get started with Github'
    expect(page.current_url).to eq dashboard_url
  end
end
