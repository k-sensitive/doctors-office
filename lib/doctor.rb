class Doctor
  attr_reader(:name,:specialty)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end

  define_singleton_method(:all) do
    all_doctors = DB.exec("SELECT * FROM doctors;")
    doctors_list = []
    all_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      id = doctor.fetch('id').to_i()
      doctors_list.push(Doctor.new({:name => name, :specialty => specialty}))
    end
    doctors_list
  end

  define_method(:save) do
    DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}')")
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&(self.specialty().==(another_doctor.specialty()))
  end
end
