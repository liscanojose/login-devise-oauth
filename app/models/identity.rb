class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def test_provider(provider)
  	self.provider = provider
  end

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

=begin  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end
=end 
end
