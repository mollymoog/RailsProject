class ApplicationController < ActionController::Base
    helpers do
        def signed_in_redirect
            if !signed_in?
                redirect_to new_user_session_path
            end
        end

        def not_current_user_redirect
            # if current_user != 
            # end
        end

    end
end
