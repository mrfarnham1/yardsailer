class TripsController < ActiveController
  before_action :authenticate_user!
  before_action :get_trip, :only => [:edit, :update, :destroy, :add_yarsale]
  
  def index
    @trips = current_user.trips
  end
  
  def new
    @trip = Trip.new
  end
  
  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      redirect_to users_trip_path(@trip), :notice => 'Trip Created'
    else
      render "new"
    end
  end
  
  def edit
    
  end
  
  def update
    if @trip.update(params[:trip])
      redirect_to users_trip_path(@trip), :notice => 'Trip Updated'
    else
      render "edit"
    end
  end
  
  def destroy
    @trip.destroy
    redirect_to users_trips_path
  end
  
  def add_yardsale
    @trip.yardsales << Yardsale.find_by_id(params[:yardsale_id])
    redirect_to users_trip_path(@trip), :notice => "Yardsale added"
  end
  
  def reorder
    params[:yardsale_ids].each_with_index do |id, i|
      if ys = @trip.trip_yardsales.find_by({:yardsale_id => id})
        ys.update(:position => i + 1)
      end
    end
    redirect_to users_trip_path(@trip), :notice => "Yardsales ordered"
  end
  
  private
  
  def get_trip
    @trip = current_user.trips.find_by_id(params[:id])
  end
end