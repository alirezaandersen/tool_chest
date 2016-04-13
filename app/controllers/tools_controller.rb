class ToolsController < ApplicationController

  def index
    if session[:user_id]
     @user = User.find(session[:user_id])
     @tools = @user.tools
   else
     @tools = Tool.all
   end
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

end
