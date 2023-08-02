class User < ApplicationRecord
  def validate_user(password)
    self.password === password
  end
end
