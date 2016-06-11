class User
  attr_accessor :username, :email

  def initialize(attributes = {})
    @username  = attributes[:username]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@username} <#{@email}>"
  end
end