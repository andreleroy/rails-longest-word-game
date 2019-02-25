class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:array_of_letters].split()
    @word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = RestClient.get(url)
    response_parsed = JSON.parse(response)
    if !(@word.split('') - @letters).empty?
      @answer = "Sorry but #{@word} can't be built out of #{@letters}"
    elsif response_parsed["found"]
      @answer = "Congratulations! #{@word} is a valid English word!"
      if session.key?(:score)
        session[:score] += @word.length
      else session[:score] = @word.length
      end
    else
      @answer = "Sorry but #{@word} does not seem to be a valid English word...."
    end
  end

  def reset
    session[:score] = 0
    redirect_to :controller => 'games', :action => 'new'
  end
end
