When(/^I visit the Shorten URL page$/) do 
  visit(new_shortened_url_path)
end

When(/^I try to shorten "(.*?)"$/) do |url|
  within "#shortening_form" do
    fill_in :url, with: url
    click_on "Shorten!"
  end
end

Then(/^I should recieve a shortened URL$/) do
  shortened_url = ShortenedUrl.first
  expect(ShortenedUrl.count).to eq(1)
  expect(page).to have_content("http://#{HOST}:#{PORT}/#{shortened_url.shortened_url}")
end

