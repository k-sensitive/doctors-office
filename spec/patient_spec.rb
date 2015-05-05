require('spec_helper')

describe('Patient') do
  describe('#name') do
    it('will show the name of the patient') do
      newpatient = Patient.new({:name => "John"})
      expect(newpatient.name()).to(eq("John"))
    end
  end
end
