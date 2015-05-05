require('spec_helper')

describe('Doctor') do
  describe('#name') do
    it('returns the name of the doctor') do
      test_doctor = Doctor.new({:name => 'Will'})
      expect(test_doctor.name()).to(eq('Will'))
    end
  end

  describe('#specialty') do
    it('returns what the doctor specializes in') do
      test_doctor = Doctor.new({:specialty => 'pediatrics'})
      expect(test_doctor.specialty()).to(eq('pediatrics'))
    end
  end

  describe('.all') do
    it('returns an empty array of doctors') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a doctor object') do
      test_doctor = Doctor.new({:name => 'John', :specialty => 'pediatrics'})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('.find') do
    it('will find a doctor through their id number') do
      test_doctor = Doctor.new({:name => 'John', :specialty => 'pediatrics'})
      test_doctor.save()
      expect(Doctor.find(test_doctor.id())).to(eq(test_doctor))
    end
  end

  describe('#patients') do
    it('will list out all patients by the doctor id') do
      test_doctor = Doctor.new({:name => 'John', :specialty => 'pediatrics'})
      test_doctor.save()
      newpatient = Patient.new({:name => 'Will', :birthday => '2015-05-05 00:00:00', :doctor_id => test_doctor.id()})
      newpatient.save()
      expect(test_doctor.patients()).to(eq([newpatient]))
    end
  end

  describe('#id') do
    it('returns the id of the doctor') do
      test_doctor = Doctor.new({:name => 'John', :specialty => 'pediatrics'})
      test_doctor.save()
      expect(test_doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

end
