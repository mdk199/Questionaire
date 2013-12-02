module ApplicationHelper
  def show_alert(alert)
    if alert
      raw "<p class = 'alert'> #{alert} </p>" 
    end
  end

  def show_notice(notice)
    if notice
      raw "<p class = 'notice'> #{notice} </p>"
    end
  end
end
