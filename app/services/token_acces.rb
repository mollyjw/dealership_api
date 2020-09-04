require 'digest/sha1'
class AccessToken

  def initialize(model)
    @model = model
  end

  def generate(obj="")
    Digest::SHA1.hexdigest("#{@model.to_s}-#{@model.id}-#{@model.created_at}-[base_api-#{@model.id.to_s(36)}]-[#{obj}]-[#{rand(-200..200).days.ago}]")
  end


end