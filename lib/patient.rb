class Patient
  attr_reader(:name,:birthday)


  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @birthday = attributes[:birthday]
  end

  define_singleton_method(:all) do
    all_patients = DB.exec("SELECT * FROM patients;")
    patient_lists = []
    all_patients.each() do |patient|
      name = patient.fetch('name')
      birthday = patient.fetch('birthday')
      id = patient.fetch('id').to_i()
      doctor_id = patient.fetch('doctor_id').to_i()
      patient_lists.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    patient_lists
  end

  define_method(:save) do
    DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{birthday}',null)")
  end

  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&(self.birthday().==(another_patient.birthday()))
  end

end
