require 'spec_helper'

describe "the user viewing the homepage" do

  it "can view login button and sign up" do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :uid => '123545'
    })
    visit root_path
    expect(page).to have_link("Get started with Github",
                              :href => "/auth/github")
    click_on 'Get started with Github'
    expect(page.current_url).to eq dashboard_url
  end

end
