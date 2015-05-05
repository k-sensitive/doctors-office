class Doctor
  attr_reader(:name,:specialty,:id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    all_doctors = DB.exec("SELECT * FROM doctors;")
    doctors_list = []
    all_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      id = doctor.fetch('id').to_i()
      doctors_list.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors_list
  end

  define_method(:save) do
   result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
   @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&(self.specialty().==(another_doctor.specialty()))
  end

  define_singleton_method(:find) do |identification|
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.id.==(identification)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  define_method(:patients) do
    doctor_patients = []
    results = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()}")
    results.each() do |patient|
      name = patient.fetch('name')
      birthday = patient.fetch('birthday')
      doctor_id = patient.fetch('doctor_id').to_i()
      doctor_patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    doctor_patients
  end
end
