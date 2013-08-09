actions :install

attribute :name,       :kind_of => String, :name_attribute => true

### hax for default action
def initialize( *args )
  super
  @action = :install
end
