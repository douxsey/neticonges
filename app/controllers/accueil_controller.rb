class AccueilController < ApplicationController
    def login
        if params[:utilisateur]
        email, password = params[:utilisateur][:email], params[:utilisateur][:password]
        user = Utilisateur.authenticate(email, password)

            if user
                session[:user] = user
                redirect_to root_path
            else
                @erreur = "Email ou mot de passe incorrect"
                render :login
            end
        end
    end
    def logout
        session[:user]   = nil
        redirect_to login_path
    end
end
