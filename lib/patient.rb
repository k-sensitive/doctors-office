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
      id = patient.fetch('id').to_i()
      patient_lists.push(Patient.new({:name => name, :birthday => birthday}))
    end
    patient_lists
  end


end
