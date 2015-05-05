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
