require 'spec_helper'


describe XDR::Hyper, ".read" do

  it "decodes values correctly" do
    expect(read("\x00\x00\x00\x00\x00\x00\x00\x00")).to eq(0)
    expect(read("\x00\x00\x00\x00\x00\x00\x00\x01")).to eq(1)
    expect(read("\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF")).to eq(-1)
    expect(read("\x7F\xFF\xFF\xFF\xFF\xFF\xFF\xFF")).to eq(2**63 - 1)
    expect(read("\x80\x00\x00\x00\x00\x00\x00\x00")).to eq(-(2**63))
  end

  def read(str)
    io = StringIO.new(str)
    subject.read(io)
  end
end