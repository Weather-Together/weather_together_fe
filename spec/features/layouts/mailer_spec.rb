require 'rails_helper'
require 'nokogiri'

RSpec.feature 'Email layout', type: :feature do
  xit 'renders the layout correctly' do
    visit some_path # replace with a path that renders the email layout

    doc = Nokogiri::HTML(page.body)

    expect(doc.at('meta[http-equiv="Content-Type"][content="text/html; charset=utf-8"]')).not_to be_nil
    expect(doc.at('body')).not_to be_nil
  end
end