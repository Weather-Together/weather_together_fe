class User
  attr_reader :id, 
              :email

  def initialize(details)
    @id = details[:id]
    @email = details[:email]
  end
end
