class ToolsController < ApplicationController

  def index
    # cookies[:hit_counter] = cookies[:hit_counter].to_i + 1
    @tools = Tool.all
  end

  def show
    @tool = Tool.find( params[:id] )
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new( tool_params )
    if @tool.save
      session[:most_recent_tool_id] = @tool.id
      # byebug
      flash[:success] = "Enjoy Your New Tool!"
      redirect_to tool_path(@tool.id)
    else
      flash.now[:error] = "Your Tool Has Not Been Created"
      render :new
    end
  end

  def destroy
    # byebug
    tool = Tool.find( params[:id] )
    tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

  # user goes to home page
  # user clicks on create new tool
  # user does not enter new tool name but fills out the rest of the form
  # user clicks on create tool
  # user should see an error and redirect to new page


end
