class AddressesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /addresses
  # GET /addresses.xml
  def index
    @addresses = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    # Convert B.E. back to B.C
    params[:address]["bdate"] = christian_date(params[:address]["bdate"])
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to(@address, :notice => 'Address was successfully created.') }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])
    
    respond_to do |format|
      # Convert B.E. back to B.C
      params[:address]["bdate"] = christian_date(params[:address]["bdate"])
      if @address.update_attributes(params[:address])
        format.html { redirect_to(@address, :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
  
  # Buddhist Era date -> be_date 13/03/2554
  def christian_date(be_date)
    if (be_date.class == Date)
      d = be_date.day
      m = be_date.month
      y = be_date.year - 543
      bc_date = "#{y}-#{m}-#{d}"
    else
      # format m/d/y
      dmy = be_date.split('/')
      d = dmy[0]
      m = dmy[1]
      y = dmy[2].to_i - 543
      bc_date = "#{y}-#{m}-#{d}"
    end
  end
end
