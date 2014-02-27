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

  it 'handles double consonants border cases' do
    expect('destravar').to separate_as %w(des tra var)
    expect('desencontro').to separate_as %w(de sen con tro)
    expect('exaltar').to separate_as %w(e xal tar)
    expect('excomungar').to separate_as %w(ex co mun gar)
  end

  it 'keeps "oclusivas" and "fricativas" together with "r" or "l"' do
    expect('brasa').to separate_as %w(bra sa)
    expect('agrupado').to separate_as %w(a gru pa do)
    expect('fragrância').to separate_as %w(fra grân ci a)
    expect('protocriogênico').to separate_as %w(pro to cri o gê ni co)
  end

  it 'keeps long codas' do
    expect('transpiração').to separate_as %w(trans pi ra ção)
    expect('transatlântico').to separate_as %w(tran sa tlân ti co)
    expect('mirins').to separate_as %w(mi rins)
    expect('transerrano').to separate_as %w(tran ser ra no)
    # Yes! It's a real word o_O
    expect('falansterialismo').to separate_as %w(fa lans te ri a lis mo)
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

  it 'handle "tritongos"' do
    expect('ideia').to separate_as %w(i dei a)
    expect('tireoide').to separate_as %w(ti re oi de)
  end

  it 'separates "hiatos"' do
    expect('moeda').to separate_as %w(mo e da)
    expect('leal').to separate_as %w(le al)
    expect('aéreo').to separate_as %w(a é re o)
    expect('pior').to separate_as %w(pi or)
    expect('raíz').to separate_as %w(ra íz)
    expect('ruído').to separate_as %w(ru í do)
  end

  it 'keeps "sineréses" together'
  it 'separates "dieréses"'
  it 'keeps the first consonant of the word together'

  it 'separates random words' do
    expect('acidentariamente').to separate_as %w(a ci den ta ri a men te)
    expect('cooperar').to separate_as %w(co o pe rar)
    #expect('abrupto').to separate_as %w(a brup to)
  end
end
