class Patient
  attr_reader(:name,:birthday)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @birthday = attributes[:birthday]
  end

end
