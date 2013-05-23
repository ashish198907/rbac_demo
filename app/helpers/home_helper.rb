module HomeHelper

  def fetch_options(model_name)

    model_name == User ? model_name.all.map{|u|[u.login,u.id]} : model_name.all.map{|u|[u.name,u.id]}
  end

end
