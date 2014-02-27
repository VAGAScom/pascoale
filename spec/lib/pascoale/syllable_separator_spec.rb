require 'spec_helper'

RSpec::Matchers.define :separate_as do |expected|
  result = nil
  match do |actual|
    result = Pascoale::SyllableSeparator.new(actual).separated
    result == expected
  end
  failure_message do |actual|
    %( expected "#{actual}" to separate as "#{expected}", but was "#{result}")
  end
end

describe Pascoale::SyllableSeparator do
  it 'separates simple words' do
    expect('bola').to separate_as %w(bo la)
    expect('batata').to separate_as %w(ba ta ta)
  end

  it 'keeps some "dígrafos" together' do
    expect('chocalho').to separate_as %w(cho ca lho)
    expect('batuque').to separate_as %w(ba tu que)
    expect('guelha').to separate_as %w(gue lha)
  end

  it 'separates other "dígrafos"' do
    expect('bossa').to separate_as %w(bos sa)
    expect('bosta').to separate_as %w(bos ta)
    expect('cassado').to separate_as %w(cas sa do)
    expect('carrasco').to separate_as %w(car ras co)
  end

  it 'separates single vowels at beggining' do
    expect('abacaxi').to separate_as %w(a ba ca xi)
    expect('exceto').to separate_as %w(ex ce to)
    expect('arrocho').to separate_as %w(ar ro cho)
  end

  it 'keeps "ditongos" together' do
    expect('maizena').to separate_as %w(mai ze na)
    expect('mausoléu').to separate_as %w(mau so léu)
    expect('ação').to separate_as %w(a ção)
    expect('põe').to separate_as %w(põe)
    expect('exceção').to separate_as %w(ex ce ção)
  end

  it 'separates "hiatos"' do
    expect('moeda').to separate_as %w(mo e da)
    expect('coxego').to separate_as %w(co xe go)
  end
end
