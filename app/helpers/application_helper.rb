module ApplicationHelper
  def buddhist_date(bc_date)
    if (bc_date.nil?)
      bc_date = Time.now
    end
    y = bc_date.year + 543
    m = (bc_date.month < 10) ? '0' + bc_date.month.to_s : bc_date.month
    d = (bc_date.day < 10) ? '0' + bc_date.day.to_s : bc_date.day
    be_date = "#{d}/#{m}/#{y}"
  end
end
