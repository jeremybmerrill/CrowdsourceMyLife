class ChoicesController < ApplicationController
  def create #unused, I think
    @crowdy = Crowdy.find(params[:crowdy_id])
    @choice = @crowdy.choices.create!(params[:choice]) #make this actually insert the damn thing...
    @len = @crowdy.choices.length
    @total_desired_choices = 2;
    raise ("Creation of choice for crowdy id " + :crowdy_id + "failed.") unless @len > 0
    raise ("There are more Choices for this Crowdy than there should be...'") unless @len <= @total_desired_choices
    if @len >= @total_desired_choices #if 2 choices already made
 	   redirect_to crowdy_path(@crowdy, :notice => "Alright, your Crowdy is done. Come back in a bit and see how people voted...")
    else #that is, if @crowdy.chocies.length is 1 (it should not be zero)
	   redirect_to(new_crowdy_choice_path(@crowdy), :notice => 'Alright, you made one choice, now add the other...')
    end
  end

  # GET /crowdies/new
  # GET /crowdies/new.xml
  def new
    @choice = Choice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @choice }
    end
  end

  def destroy
    @choice = Choices.find(params[:id])
    @choice.destroy
    redirect_to(crowdies_path)
  end
end
