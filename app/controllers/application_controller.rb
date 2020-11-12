class ApplicationController < ActionController::Base
    helper_method :signed_in_redirect, :not_current_user_redirect
        def signed_in_redirect
            if !signed_in?
                redirect_to new_user_session_path, notice: "Please Sign-in to Access"
            end
        end

        def not_current_user_redirect
            # signed_in_redirect
            if current_user.id != @outcrop.user_id
                redirect_to outcrops_path, notice: "Not your Outcrop"
            end
        end

end
