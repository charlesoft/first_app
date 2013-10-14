class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

	#Atrr accessible
	attr_accessible :name, :email, :age, :gender

	#Constants
	MALE = 1
	FAMALE = 2
	OTHER = 3


	#Validations 
	validates :name, :presence => true, :allow_blank => false
	validates :email,:presence => true, :allow_blank => false
	validates_uniqueness_of :email
	validates :gender, :presence => true, :if => :adulthood



	#Associations 
	has_many :bills, :dependent => :destroy

	#Scopes

	#Públic methods 
	def adulthood
		self.age.present? and age >= 18
	end
end