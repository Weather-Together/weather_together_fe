class User
  attr_reader :name, :email

  def initialize(details)
    @name = details[:name]
    @email = details[:email]
  end
end