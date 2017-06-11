module ApplicationHelper
  def bootstrap_alerts key
    {
      "error" => "danger",
      "notice" => "success"
    }.with_indifferent_access[key]
  end
end
