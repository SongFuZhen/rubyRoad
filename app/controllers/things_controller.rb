class ThingsController < ApplicationController

  before_action :set_thing, :only => [:show, :edit, :update, :destroy]

  def index
    # 倒序排列   每本五条数据为一页
    @things=Thing.page(params[:page]).per(5).order("id desc")
  end

  def new
    @thing=Thing.new

  end

  def create
    flash[:notice] = "event was successfully created"

    @thing = Thing.new(things_params)
    @thing.save

    redirect_to :action => :index
  end

  def show
  end

  def edit
  end

  def update
    flash[:notice] = "event was successfully Updated"

    # 先查找，然后在更新
    @thing.update(things_params)
    redirect_to :action => :show, :id => @thing
  end

  def destroy
    flash[:alert] = "event was successfully deleted"

    @thing.destroy

    redirect_to :action => :index
  end

  private

  def set_thing
    @thing=Thing.find(params[:id])
  end

  def things_params
    params.require(:thing).permit(:name, :description, :amount)
  end
end
