require 'rails_helper'

RSpec.describe RoundsFacade, type: :facade do
  describe 'Round Facade Instance Methods', :vcr do
    before(:each) do
      @facade = RoundsFacade.new  
    end

    it "exists" do
      expect(@facade).to be_a(RoundsFacade)
    end

    it "#target_weather_data" do
      result = @facade.target_weather_data

      expect(result).to be_a(Hash)
    end

    it "#previous_user_rounds" do
      results = @facade.previous_user_rounds

      results.each do |previous_round|
        expect(previous_round).to be_a(Round)
        expect(movie).to respond_to(:close_date)
        expect(movie).to respond_to(:number_of_votes)
        expect(movie).to respond_to(:target_weather_stats)
        expect(movie).to respond_to(:game_id)
        expect(movie).to respond_to(:votes)
      end
    end

  end
end
