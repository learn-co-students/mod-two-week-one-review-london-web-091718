class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def show
    @seas = Sea.find(params[:id])
  end

  def new
    @seas = Sea.new
  end

  def edit
    @seas = Sea.find(params[:id])
  end

  def create
    @seas = Sea.create(sea_params)
    redirect_to @seas
  end

  def update
    @seas = Sea.find(params[:id])

    if @seas.update(sea_params)
      redirect_to @seas
    else
      render 'edit'
    end
  end

  def destroy
    @seas = Sea.find(params[:id])
    @seas.destroy

    redirect_to seas_path
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
