class UserActionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index_all]
  # GET /user_actions
  # GET /user_actions.json
  def index_all
    @user_actions = UserAction.order("created_at").page(params[:page])         #User_actions ?  check this and home.html.


   # respond_to do |format|
   #   format.html # index.html.erb
   #   format.json { render json: @user_actions }
   # end
  end

  def index
    @user_actions = PublicActivity::Activity.order("created_at desc").page(params[:page]).per_page(8)
    #@user_actions = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User").page(params[:page]).per_page(5)
    #@user_actions = UserAction.find_all_by_user_id(current_user.id).order("created_at").page(params[:page]).per_page(5)         #User_actions ?  check this and home.html.

    respond_to do |format|
      format.html # index.html.erb
      ajax_respond format, :section_id => "pagination"
    end
  end

  # GET /user_actions/1
  # GET /user_actions/1.json
  def show
    @user_action = UserAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_action }
    end
  end

  # GET /user_actions/new
  # GET /user_actions/new.json
  def new
    @user_action = UserAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_action }
    end
  end

  # POST /user_actions
  # POST /user_actions.json
  def create
    @user_action = UserAction.new(params[:user_action])

    respond_to do |format|
      if @user_action.save
        format.html { redirect_to @user_action, notice: 'User action was successfully created.' }
        format.json { render json: @user_action, status: :created, location: @user_action }
      else
        format.html { render action: "new" }
        format.json { render json: @user_action.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /user_actions/1
  # DELETE /user_actions/1.json
  def destroy
    @user_action = UserAction.find(params[:id])
    @user_action.destroy

    respond_to do |format|
      format.html { redirect_to user_actions_url }
      format.json { head :no_content }
    end
  end
end
