class PasswordsController < ApplicationController
    http_basic_authenticate_with name: "ohlala", password: "secret", except: [:index, :show]
    

    def index
        @passwords = Password.all
        puts @passwords.count
    end

    def new
        @password = Password.new
    end

    def edit
        @password = Password.find(params[:id])
    end    

    def show
        @password = Password.find(params[:id])
    end


    def create
        @password = Password.new(password_params)

        if @password.save
            flash[:success] = "Your new password have been successfully created for #{@password.url}."
            redirect_to @password
        else            
            flash.now[:error] = "password creation has failed for #{@password.url}"
            puts "creation failed"
            render 'new'
        end
    end

    def update
        @password = Password.find(params[:id])

        if @password.update(password_params)
            flash[:success] = "Your new password have been successfully updated for #{@password.url}."
            redirect_to @password
        else
            flash.now[:error] = "password updating has failed for #{@password.url}."
            render 'edit'
        end

    end

    def destroy
        @password = Password.find(params[:id])
        @password.destroy
        redirect_to passwords_path
    end

    private
    def password_params
        params.require(:password).permit(:url, :email, :pwd)
    end
end
