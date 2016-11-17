class User < ApplicationRecord
  has_many :shares

  def password=(unhashed_password)
    @_password = BCrypt::Password.create(unhashed_password)
    self.password_hash = @_password
  end

  def password
    @_password ||= BCrypt::Password.new(password_hash)
  end
end
