# controller for the password generation route
class PasswordsController < ApplicationController
    def index
        session[:user_id] = 123
        session[:password] = ""
        @hello = "hello"
        generate
    end

    def create
        puts "post request"
    end

    private
        def generate
            generated_pass = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
            # then the frontend reads this password.
            session[:password] = generated_pass
        end
end
