require 'rails_helper'

RSpec.feature 'Urls', type: :feature do
  scenario 'anonymous users can shorten long urls on the homepage' do
    test_url = Url.create(long_url: 'www.andela.com')

    visit root_path

    expect(page).to have_content(test_url.short_url)
  end
end
