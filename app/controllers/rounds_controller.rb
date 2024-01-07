class RoundsController < ApplicationController
  def public_show
    service = UsersService.new
    round_id = service.get_url("/rounds/current")[:id]
    vote_info = {
      latitude: params[:latitude],
      longitude: params[:longitude]
    }
    service.post_url("/users/#{sessiom[:user_id]}/rounds/#{round_id}", vote_info)
  end
end
