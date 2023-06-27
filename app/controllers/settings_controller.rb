class SettingsController < ApplicationController
    def index
      # Logic for the settings page
    end
    
    def update
        @user = current_user
        if @user.update(user_params)
          # Successful update logic
          bypass_sign_in(@user) # Reload the user object
          redirect_to profile_path # Redirect to the profile page
        else
          # Failed update logic
          render :edit # Render the edit page with error messages
        end
      end
      
      private
      
      def user_params
        params.require(:user).permit(:name, :email) # Add any other permitted attributes
      end
      


  end
  