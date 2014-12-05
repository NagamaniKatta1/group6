class EmployeesController < ApplicationController
 before_filter :authenticate_user!
  def new
    @department = Department.find(params[:department_id])
    @Employee = @department.employees.build
  end
  
  def show
    
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def index
    @department = Department.find(params[:department_id])
    @Employees = Employee.where(department_id: params[:department_id])
  end
  
  def update
    @Employee = Employee.find params[:id]
    @Employee.update_attributes!(Employee_params)
    department = @Employee.department
    redirect_to department_Employees_path(department)
  end

  def create
     @department = Department.find(params[:department_id])
     @Employee = @department.Employees.create(Employee_params)
     redirect_to department_Employees_path
  end
  private 
  def Employee_params
    params.require(:Employee).permit(:name, :sex, :phone, :hdate, :salary)
  end
end
