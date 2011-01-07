class CrowdiesController < ApplicationController
  # GET /crowdies
  # GET /crowdies.xml
  def index
    @crowdies = Crowdy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crowdies }
    end
  end

  def random
	@crowdies = Crowdy.all
	clen = @crowdies.length;
	rcrowdy = @crowdies[rand(clen)]
	#render :action => :show, :id => rcrowdy.id
	redirect_to(crowdy_path(rcrowdy))
  end

  # GET /crowdies/1
  # GET /crowdies/1.xml
  def show
    @crowdy = Crowdy.find(params[:id])
    @desired = @crowdy.desired_crowd_choices
    @votecount = 0
    @crowdy.choices.each do |choice|
	@votecount = @votecount + choice.votecount
    end
    if @votecount < @desired
	respond_to do |format|
	  format.html # show.html.erb
	  format.xml  { render :xml => @crowdy }
	end
    else
	render :result
    end
  end

  #GET /crowdies/1/result
  def result
    @crowdy = Crowdy.find(params[:id])

    respond_to do |format|
      format.html #result.html.erb, hopefully
      #add XML? -JBM 1/2/11
    end
  end

  # GET /crowdies/new
  # GET /crowdies/new.xml
  def new
    @crowdy = Crowdy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crowdy }
    end
  end

  # GET /crowdies/1/edit
  def edit
    @crowdy = Crowdy.find(params[:id])
  end

  # POST /crowdies
  # POST /crowdies.xml
  def create
    @crowdy = Crowdy.new(params[:crowdy])
    #params[:choice].each do
	    @crowdy.choices.build(params[:choice1])
	    @crowdy.choices.build(params[:choice2])
    #end
    if @crowdy.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
 end

  # PUT /crowdies/1
  # PUT /crowdies/1.xml
  def update
    @crowdy = Crowdy.find(params[:id])

    respond_to do |format|
      if @crowdy.update_attributes(params[:crowdy])
        format.html { redirect_to(@crowdy, :notice => 'Crowdy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crowdy.errors, :status => :unprocessable_entity }
      end
    end
  end

  #POST /crowdies/1/vote/1? idk
  def vote
	@crowdy = Crowdy.find(params[:id])
	#@vote = params[:vote]
	@choice = Choice.find(params[:vote])
	@choice.increment!(:votecount)
	redirect_to(:action => 'result')
  end

  # DELETE /crowdies/1
  # DELETE /crowdies/1.xml
  def destroy
    @crowdy = Crowdy.find(params[:id])
    @crowdy.destroy

    respond_to do |format|
      format.html { redirect_to(crowdies_url) }
      format.xml  { head :ok }
    end
  end
end
