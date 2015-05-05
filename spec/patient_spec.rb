require('spec_helper')

describe('Patient') do
  describe('#name') do
    it('will show the name of the patient') do
      newpatient = Patient.new({:name => "John"})
      expect(newpatient.name()).to(eq("John"))
    end
  end

  describe('#birthday') do
    it('will show the birthday of the patient') do
      newpatient = Patient.new({:birthday => 2015-05-05})
      expect(newpatient.birthday()).to(eq(2015-05-05))
    end
  end

  describe('.all') do
    it('will return an empty array where a list of patients will be') do
      expect(Patient.all()).to(eq([]))
    end
  end
end
