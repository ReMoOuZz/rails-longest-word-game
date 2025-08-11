require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @user_choice = params[:score]
    url  = "https://dictionary.lewagon.com/api/v1/words/#{@user_choice}"
    word_serialized = URI.open(url).read
    @word = JSON.parse(word_serialized)
  end
end
