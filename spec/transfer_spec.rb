describe Transfer do
  it { should validate_presence_of :amount }
  it { should belong_to :nonprofit }
end
