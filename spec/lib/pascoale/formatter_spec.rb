require 'spec_helper'

describe Pascoale::Formatter do
  describe '#as_title' do
    it 'formats simple text' do
      formatter = Pascoale::Formatter.new('teste')
      expect(formatter.as_title).to eq 'Teste'
    end

    it 'formats simple text with accent' do
      formatter = Pascoale::Formatter.new('épico')
      expect(formatter.as_title).to eq 'Épico'
    end

    it 'formats multiple words' do
      formatter = Pascoale::Formatter.new('joão alves ferreira')
      expect(formatter.as_title).to eq 'João Alves Ferreira'
    end

    it 'formats prepositions and connect words as exceptions' do
      formatter = Pascoale::Formatter.new('josé da silva e santos dos anjos')
      expect(formatter.as_title).to eq 'José da Silva e Santos dos Anjos'
    end

    it 'formats first words always as capitalized' do
      formatter = Pascoale::Formatter.new('da vida e das coisas')
      expect(formatter.as_title).to eq 'Da Vida e das Coisas'
    end

    it 'formats acronyms' do
      formatter = Pascoale::Formatter.new('a ONU não gosta de violência')
      expect(formatter.as_title).to eq 'A ONU Não Gosta de Violência'

      formatter = Pascoale::Formatter.new('IRQ é algo ultrapassado!')
      expect(formatter.as_title).to eq 'IRQ É Algo Ultrapassado!'
    end
  end

  describe '#upcase'
  describe '#downcase'
  describe '#capitalize'
  describe '#upcase?'
  describe '#dowcase?'
  describe '#capitalize?'
  describe '#to_s'
end
