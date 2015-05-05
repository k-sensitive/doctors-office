require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'hospital'})

get('/') do
  erb(:index)
end

get('/administration/doctors') do
  @doctors = Doctor.all()
  erb(:doctor)
end

get('/administration/patients/new') do
  erb(:patient_form)
end

get('/administration/doctors/new') do
  erb(:doctor_form)
end

post('/administration/doctors') do
  name = params.fetch('name')
  specialty = params.fetch('specialty')
  @doctor = Doctor.new({:name => name, :specialty => specialty})
  @doctor.save()
  erb(:success)
end

get('/administration/doctors/:id/patients/new') do
  @doctor = Doctor.find(params.fetch('id').to_i())
  erb(:patient_form)
end

get('/administration/doctors/:id/patients') do
  @doctor = Doctor.find(params.fetch('id').to_i())  
  erb(:patients)
end

post('/administration/doctors/:id/patients') do
  name = params.fetch('name')
  birthday = params.fetch('birthday')
  doctors_id = params.fetch('doctors_id')
  @patient = Patient.new({:name => name,:birthday => birthday, :doctors_id => doctors_id})
  @patient.save()
  erb(:success)
end
