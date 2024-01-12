require 'rails_helper'
require 'nokogiri'

RSpec.feature 'Application layout', type: :feature do
  it 'renders the layout correctly' do
    visit root_path
    doc = Nokogiri::HTML(page.body)

    metas = doc.css('meta[name="viewport"]')
    expect(metas.any? { |meta| meta['content'] == "width=device-width,initial-scale=1" }).to be true

    expect(doc.at_css('title').text).to eq('WeatherTogether')
    expect(doc.at_css('link[rel="stylesheet"][href*="application"]')).not_to be_nil
    expect(doc.at_css('script[src*="bootstrap.min.js"]')).not_to be_nil
    expect(doc.at_css('script[src*="jquery-3.5.1.slim.min.js"]')).not_to be_nil
    expect(doc.at_css('script[src*="popper.min.js"]')).not_to be_nil

    body = doc.at_css('body')

    expect(body.css('> *').any?).to be true
  end
end