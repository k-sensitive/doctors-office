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
end
