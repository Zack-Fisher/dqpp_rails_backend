# following the MVC pattern, this is the controller for the games
class GamesController < ApplicationController
  def play
    session[:number] ||= rand(1..100) # Generate a random number and store it in the session

    @guess = params[:guess]&.to_i
    @message = check_guess(@guess)
  end

  private

  def check_guess(guess)
    return nil if guess.nil?

    if guess > session[:number]
      "Too high!"
    elsif guess < session[:number]
      "Too low!"
    else
      "Congratulations! You guessed it!"
    end
  end
end

