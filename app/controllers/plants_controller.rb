class PlantsController < ApplicationController
  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plants }
    end
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
    @plant = Plant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plant }
    end
  end

  # GET /plants/new
  # GET /plants/new.json
  def new
    @plant = Plant.new

    # As requested, populating fields so the user will only have to input the plant type and name.
    @plant.user_id= current_user.id
    @plant.fertilizer_frequency=0
    @plant.fertilizer_quantity=0
    @plant.initial_plant_info="Initial info"
    @plant.irrigation_frequency=2
    @plant.irrigation_info="Irrigation info"
    @plant.irrigation_level=100
    @plant.irrigation_quantity=100
    @plant.safe_temp_min=70
    @plant.safe_temp_max=80
    @plant.sun_info="Sun is fun"
    @plant.sun_level=100
    @plant.temperature_info="Temp Info"
    @plant.irrigation_level_updated_at= DateTime.now
    @plant.save!


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plant }
    end
  end

  # GET /plants/1/edit
  def edit
    @plant = Plant.find(params[:id])
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(params[:plant])
     #sleep 3
    respond_to do |format|
      if @plant.save
        #@plant.create_activity :create, owner: current_user
        format.html { redirect_to @plant, notice: 'Plant was successfully created.' }
        format.json { render json: @plant, status: :created, location: @plant }
      else
        format.html { render action: "new" }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plants/1
  # PUT /plants/1.json
  def update
    @plant = Plant.find(params[:id])
    if(!params[:plant]['image'].nil?)
      @plant.update_attributes(params[:plant])
      redirect_to root_path
    else
    respond_to do |format|
      if @plant.update_attributes(params[:plant])
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant = Plant.find(params[:id])
    #@plant.create_activity :destroy, owner: current_user
    @plant.destroy


    respond_to do |format|
      format.html { redirect_to plants_url }
      format.json { head :no_content }
    end
  end

  # Filling water AJAX
  def fill_water
    Plant.find_all_by_user_id(current_user.id).each do |plant|
      plant.irrigation_level=100
      plant.irrigation_level_updated_at= DateTime.now
      plant.save!
    end
   respond_to do |format|
      format.html {redirect_to home_path}
      format.js {render 'plants.js', formats: :js}
    end
  end
end
