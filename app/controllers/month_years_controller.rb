class MonthYearsController < ApplicationController
  before_action :set_month_year, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show]

  # GET /month_years
  # GET /month_years.json
  def index
    @month_years = MonthYear.all
  end

  # GET /month_years/1
  # GET /month_years/1.json
  def show
    @month_year = MonthYear.find(params[:id])
  end

  # GET /month_years/new
  def new
    @month_year = MonthYear.new
  end

  # GET /month_years/1/edit
  def edit
  end

  # POST /month_years
  # POST /month_years.json
  def create
    @month_year = MonthYear.new(month_year_params)

    respond_to do |format|
      if @month_year.save
        format.html { redirect_to @month_year, notice: 'Month year was successfully created.' }
        format.json { render :show, status: :created, location: @month_year }
      else
        format.html { render :new }
        format.json { render json: @month_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /month_years/1
  # PATCH/PUT /month_years/1.json
  def update
    respond_to do |format|
      if @month_year.update(month_year_params)
        format.html { redirect_to @month_year, notice: 'Month year was successfully updated.' }
        format.json { render :show, status: :ok, location: @month_year }
      else
        format.html { render :edit }
        format.json { render json: @month_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_years/1
  # DELETE /month_years/1.json
  def destroy
    @month_year.destroy
    respond_to do |format|
      format.html { redirect_to month_years_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month_year
      @month_year = MonthYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def month_year_params
      params[:month_year]
    end
end
