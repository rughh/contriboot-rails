module ContributionsHelper
  def valid_class(object, field)
    if object.errors.include?(field)
      'is-invalid'
    else
      'is-valid'
    end
  end
end
