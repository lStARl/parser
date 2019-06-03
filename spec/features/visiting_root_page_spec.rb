require 'rails_helper'

RSpec.feature "VisitingRootPages", type: :feature do
  scenario 'Guest visits home page' do
    visit root_path

    expect(page).to have_selector('h2', text: 'Log in')
  end

  scenario 'Registered user visits home page' do
    user = FactoryBot.create(:user)
    resources = 10.times { FactoryBot.create(:resource) }
    login_as(user, :scope => :user)

    visit root_path
    expect(page).to have_selector('h1', text: 'Advisory Archive')
    expect(page).to have_selector('tr', count: 10)
  end
end
