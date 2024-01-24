class Users::ReportInfected
  def initialize(params)
    @id = params['id']
  end

  def perform
    user = User.find(@id)
    user.increase_report_count
  end
end
