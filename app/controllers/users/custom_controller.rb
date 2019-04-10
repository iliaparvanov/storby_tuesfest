class Users::CustomController < ApplicationController
    def library
        render :template => "users/library"
    end 
end