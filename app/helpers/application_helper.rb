module ApplicationHelper
  def show_alert(alert)
    if alert
    "#{alert}" 
    end
  end

  def show_notice(notice)
    if notice
   "#{notice}"
    end
  end
end
