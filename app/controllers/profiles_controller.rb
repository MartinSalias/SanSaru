class ProfilesController < ApplicationController
  before_action :set_profile, only: [:destroy]
  before_action :require_login

    # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def require_login
      unless user_signed_in?
        #TODO flash doesnt work
        flash[:error] = "debes estar logueado para ver esto"
        redirect_to new_user_session_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:residence, :first_time, :expectancy, :agile_id, :agile_description, :hobbies, :bring, :proposal, :bio, :agileRelation_id, :gender_id, :size_id)
    end
end