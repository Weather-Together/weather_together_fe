require 'rails_helper'

RSpec.describe RoundsFacade, type: :facade do
  describe 'Round Facade Instance Methods', :vcr do
    before(:each) do
      @facade = RoundsFacade.new  
      allow_any_instance_of(WeatherTogetherService).to receive(:get_response).and_return({ key: 'value' }) 
      allow_any_instance_of(ReceivingService).to receive(:previous_rounds).and_return({ 
        data: [{ 
          attributes: { 
            close_date: '2022-01-01', 
            target_weather_stats: {}, 
            status: 'open', 
            votes: [] 
          } 
        }] 
      }) 
      allow_any_instance_of(ReceivingService).to receive(:current_round).and_return({ 
        data: { 
          attributes: { 
            close_date: '2022-01-01', 
            target_weather_stats: '{"weather_data": {}}', 
            status: 'open', 
            votes: [] 
          } 
        } 
      }) 
    end

    it "exists" do
      expect(@facade).to be_a(RoundsFacade)
    end

    it "#target_weather_data" do
      result = @facade.target_weather_data

      expect(result).to be_a(Hash)
    end

    it "#previous_user_rounds" do
      user_id = 1 
      results = @facade.previous_user_rounds(user_id)

      results.each do |previous_round|
        expect(previous_round).to be_a(Round)
      end
    end

  end
end
