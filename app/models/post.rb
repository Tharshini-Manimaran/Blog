class Post < ActiveRecord::Base

    public
  validates_presence_of :name, :title, :content, :message => " Feild is Required"
  before_validation :overwrite_title_as_name
  protected
   def overwrite_title_as_name
     if title.blank?
       self.title = name unless name.blank?
     end
  end
   # def after_initialize
   #   puts "Initialized"
   # end
public
  validates_length_of :title, :minimum => 5 , :too_short => " must be a of minimum {{count}} Characters"
  validates_length_of :content, :maximum => 50 , :too_long => "{{count}} is the maximum no of Characters allowed"
  has_many :comments, :dependent => :destroy
  has_many :tags, :dependent => :destroy
  validates_format_of :name, :with => /^[A-Z]/, :message => " should start with caps"
  validates_associated :tags
  validates_acceptance_of :terms_of_service , :message => " must be accepted"
  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  # validates_inclusion_of :name , :in => %w{Tharshini, Janani}
  # validates_exclusion_of :name, :in => %w(Nandhini, Sister), :message => "{{value}} is excluded"
end
