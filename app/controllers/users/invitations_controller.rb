class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  def create
    @user = invite_resource
    @event = Event.find(params[:event].to_i)
    @member = Member.create(user: @user, event: @event)
    if @user
      redirect_to @event, notice: "#{@user.username} invited to event"
    else
      render :new
    end
  end

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:username, :email, :event_id])
  end


  #  # This is called when creating invitation.
  #   # It should return an instance of resource class.
  #   def invite_resource
  #     # skip sending emails on invite
  #     super { |user| user.skip_invitation = true }
  #   end

  #   # This is called when accepting invitation.
  #   # It should return an instance of resource class.
  #   def accept_resource
  #     resource = resource_class.accept_invitation!(update_resource_params)
  #     # Report accepting invitation to analytics
  #     Analytics.report('invite.accept', resource.id)
  #     resource
  #   end
end
