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
end
