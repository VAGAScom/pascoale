# coding: utf-8
require 'spec_helper'

describe Reflector do
  describe '#proparoxytone?' do
    it 'detects proparoxytone words' do
      expect(Reflector.new('dióxido')).to be_proparoxytone
      expect(Reflector.new('pãozinho')).not_to be_proparoxytone
    end
  end

  describe '#paroxytone?' do
    it 'detects paroxytone words' do
      expect(Reflector.new('jiboia')).to be_paroxytone
      expect(Reflector.new('ideia')).to be_paroxytone
      expect(Reflector.new('assembleia')).to be_paroxytone
      expect(Reflector.new('heroico')).to be_paroxytone
      expect(Reflector.new('variável')).to be_paroxytone
      expect(Reflector.new('prováveis')).to be_paroxytone
    end
  end

  describe '#oxytone?' do
    it 'detects oxytone words' do
      expect(Reflector.new('pão')).to be_oxytone
      expect(Reflector.new('pé')).to be_oxytone
      expect(Reflector.new('chulé')).to be_oxytone
      expect(Reflector.new('parati')).to be_oxytone
      expect(Reflector.new('urubu')).to be_oxytone
      expect(Reflector.new('jabuti')).to be_oxytone
      expect(Reflector.new('jesus')).to be_oxytone
      expect(Reflector.new('tatu')).to be_oxytone
      expect(Reflector.new('amor')).to be_oxytone
      expect(Reflector.new('terror')).to be_oxytone
      expect(Reflector.new('ruim')).to be_oxytone
      expect(Reflector.new('condor')).to be_oxytone
      expect(Reflector.new('anzol')).to be_oxytone
      expect(Reflector.new('variável')).not_to be_oxytone
      expect(Reflector.new('prováveis')).not_to be_oxytone
      expect(Reflector.new('ámavel')).not_to be_oxytone
    end
  end

  it 'detects edge cases' do
    expect(Reflector.new('cítara')).to be_proparoxytone
    expect(Reflector.new('citara')).to be_paroxytone
    expect(Reflector.new('citará')).to be_oxytone

    expect(Reflector.new('pais')).to be_oxytone
    expect(Reflector.new('país')).to be_oxytone
  end
end
