class AccessesController < ApplicationController
  before_filter :require_user

  # GET /accesses
  # GET /accesses.json
  def index
    @accesses = Access.all
  end

  # GET /accesses/1
  # GET /accesses/1.json
  def show
    @access = Access.find(params[:id])
  end

  # GET /accesses/new
  # GET /accesses/new.json
  def new
    @access = Access.new
  end

  # GET /accesses/1/edit
  def edit
    @access = Access.find(params[:id])
  end

  # POST /accesses
  # POST /accesses.json
  def create
    @access = Access.new(params[:access])

    respond_to do |format|
      if @access.save
        format.html { redirect_to accesses_url, :notice=> 'Access was successfully created.' }
        format.json { render :json=> @access, :status=> :created, :location=> @access }
      else
        format.html { render :action=> "new" }
        format.json { render :json=> @access.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # PUT /accesses/1
  # PUT /accesses/1.json
  def update
    @access = Access.find(params[:id])

    respond_to do |format|
      if @access.update_attributes(params[:access])
        format.html { redirect_to accesses_url, :notice=> 'Access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action=> "edit" }
        format.json { render :json=> @access.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # DELETE /accesses/1
  # DELETE /accesses/1.json
  def destroy
    @access = Access.find(params[:id])
    @access.destroy
    redirect_to accesses_url
  end
end
