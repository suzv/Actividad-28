class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end


  def show
      @employee = Employee.new
  end


  def new
    @employee = Employee.new
  end


  def edit
  end


  def create
    @company = Company.find(params[:company_id])
    @employee = @company.employees.build(employee_params)
    @employee.save
    redirect_to company_path(@employee.company_id)


  end


  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
    end
end
