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

Given(/^there is a shortened URL for "(.*?)"$/) do |url|
  @shortened_url = ShortenedUrl.create!(original_url: url, shortened_url: "12345")
  expect(ShortenedUrl.count).to eq(1)
end

When(/^I visit the endpoint for the shortened URL$/) do
  visit(redirection_path(id: @shortened_url.shortened_url))
end

Then(/^I should be redirected to the shortened url's ultimate destination$/) do
  expect(current_url).to eq("http://localhost:3000/")
end

