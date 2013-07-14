actions :install
attribute :name,
  :name_attribute => true

### hax for default action
def initialize( *args )
  super
  @action = :install
end
