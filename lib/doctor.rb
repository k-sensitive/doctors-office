class Doctor
  attr_reader(:name,:specialty)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end
end
