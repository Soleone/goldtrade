class InvestmentsController < ApplicationController
  # GET /investments
  # GET /investments.xml
  def index
    @investments = Investment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @investments }
    end
  end

  # GET /investments/1
  # GET /investments/1.xml
  def show
    @investment = Investment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @investment }
    end
  end

  # GET /investments/new
  # GET /investments/new.xml
  def new
    @investment = Investment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investment }
    end
  end

  # GET /investments/1/edit
  def edit
    @investment = Investment.find(params[:id])
  end

  # POST /investments
  # POST /investments.xml
  def create
    @investment = Investment.new(params[:investment])

    respond_to do |format|
      if @investment.save
        flash[:notice] = 'Investment was successfully created.'
        format.html { redirect_to(@investment) }
        format.xml  { render :xml => @investment, :status => :created, :location => @investment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @investment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /investments/1
  # PUT /investments/1.xml
  def update
    @investment = Investment.find(params[:id])

    respond_to do |format|
      if @investment.update_attributes(params[:investment])
        flash[:notice] = 'Investment was successfully updated.'
        format.html { redirect_to(@investment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @investment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.xml
  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy

    respond_to do |format|
      format.html { redirect_to(investments_url) }
      format.xml  { head :ok }
    end
  end
end
