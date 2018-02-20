class HomeController < ApplicationController

  before_action :require_login


  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  # GET /profiles/new
  def new
    @profile = current_user.profile || Profile.new
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        current_user.profile = @profile
        current_user.save!
        format.html { redirect_to '/home', notice: 'Profile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      @profile = current_user.profile
      if @profile.update(profile_params)
        format.html { redirect_to '/home', notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

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