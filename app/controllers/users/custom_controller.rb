class Users::CustomController < ApplicationController
    def library
        render :template => "users/library"
    end 

    def dashboard
        render :template => "users/dashboard"
    end
end