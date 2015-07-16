require 'spec_helper'

describe Inflector do
  matcher :pluralize_as do |expected|
    result = nil
    match do |actual|
      result = Inflector.new(actual).pluralize
      result == expected
    end
    failure_message do |actual|
      %(expected "#{actual}" to pluralize as "#{expected}", but was "#{result}")
    end
  end

  describe '#pluralize' do
    it 'pluralize simple cases' do
      expect('teste').to pluralize_as 'testes'
      expect('venda').to pluralize_as 'vendas'
      expect('casa').to pluralize_as 'casas'
      expect('peru').to pluralize_as 'perus'
      expect('pai').to pluralize_as 'pais'
      expect('lei').to pluralize_as 'leis'
      expect('herói').to pluralize_as 'heróis'
      expect('réu').to pluralize_as 'réus'
      expect('troféu').to pluralize_as 'troféus'
      expect('fogaréu').to pluralize_as 'fogaréus'
      expect('degrau').to pluralize_as 'degraus'
      expect('grau').to pluralize_as 'graus'
      expect('sarau').to pluralize_as 'saraus'
      expect('bacalhau').to pluralize_as 'bacalhaus'
      expect('maçã').to pluralize_as 'maçãs'
      expect('mãe').to pluralize_as 'mães'
    end

    it 'pluralize paroxytone "ão"' do
      expect('sótão').to pluralize_as 'sótãos'
      expect('cidadão').to pluralize_as 'cidadãos'
      expect('chão').to pluralize_as 'chãos'
      expect('bênção').to pluralize_as 'bênçãos'
      expect('cristão').to pluralize_as 'cristãos'
      expect('grão').to pluralize_as 'grãos'
      expect('órfão').to pluralize_as 'órfãos'
      expect('irmão').to pluralize_as 'irmãos'
      expect('mão').to pluralize_as 'mãos'
      expect('refrão').to pluralize_as 'refrãos' # OK also: refrães
    end

    it 'pluralize "ão" to "ões"' do
      expect('botão').to pluralize_as 'botões'
      expect('guardião').to pluralize_as 'guardiões' # OK also: guardiães
      expect('verão').to pluralize_as 'verões' # OK also: verãos
      expect('anão').to pluralize_as 'anões' # OK also: anãos
      expect('cirurgião').to pluralize_as 'cirurgiões' # OK also: cirurgiães
      expect('corrimão').to pluralize_as 'corrimões' # OK also: corrimãos
      expect('vilão').to pluralize_as 'vilões' # OK also: vilãos
      expect('ancião').to pluralize_as 'anciões' # OK also: anciães, anciãos
      expect('ermitão').to pluralize_as 'ermitões' # OK also: ermitães, ermitãos
      expect('faisão').to pluralize_as 'faisões' # OK also: faisães
    end

    it 'pluralize "ão" to "ães"' do
      expect('alemão').to pluralize_as ('alemães')
      expect('capitão').to pluralize_as ('capitães')
      expect('pão').to pluralize_as ('pães')
      expect('cão').to pluralize_as ('cães')
      expect('charlatão').to pluralize_as ('charlatães')
      expect('sacristão').to pluralize_as ('sacristães')
      expect('capelão').to pluralize_as ('capelães')
      expect('escrivão').to pluralize_as ('escrivães')
      expect('tabelião').to pluralize_as ('tabeliães')
    end

    it 'pluralize "m" to "ns"' do
      expect('homem').to pluralize_as 'homens'
      expect('jardim').to pluralize_as 'jardins'
      expect('som').to pluralize_as 'sons'
      expect('atum').to pluralize_as 'atuns'
    end

    it 'pluralize "r" or "z" to "es"' do
      expect('mar').to pluralize_as 'mares'
      expect('açúcar').to pluralize_as 'açúcares'
      expect('hambúrguer').to pluralize_as 'hambúrgueres'
      expect('flor').to pluralize_as 'flores'
      expect('repórter').to pluralize_as 'repórteres'
      expect('revólver').to pluralize_as 'revólveres'
      expect('rapaz').to pluralize_as 'rapazes'
      expect('cruz').to pluralize_as 'cruzes'
      expect('luz').to pluralize_as 'luzes'
    end

    it 'pluralize "s" to "es"' do
      expect('obus').to pluralize_as 'obuses'
      expect('país').to pluralize_as 'países'

      expect('pires').to pluralize_as 'pires'
      expect('vírus').to pluralize_as 'vírus'
      expect('lápis').to pluralize_as 'lápis'
      expect('atlas').to pluralize_as 'atlas'
      expect('ônibus').to pluralize_as 'ônibus'

      # No accent
      expect('gás').to pluralize_as 'gases'
      expect('mês').to pluralize_as 'meses'
    end

    it 'pluralize "l" to "is"' do
      expect('animal').to pluralize_as 'animais'
      expect('canal').to pluralize_as 'canais'
      expect('vogal').to pluralize_as 'vogais'
      expect('igual').to pluralize_as 'iguais'
      expect('anel').to pluralize_as 'anéis'
      expect('pastel').to pluralize_as 'pastéis'
      expect('anzol').to pluralize_as 'anzóis'
      expect('lençol').to pluralize_as 'lençóis'
      expect('espanhol').to pluralize_as 'espanhóis'

      expect('infantil').to pluralize_as 'infantis'
      expect('gentil').to pluralize_as 'gentis'
      expect('funil').to pluralize_as 'funis'
      expect('barril').to pluralize_as 'barris'
      expect('ardil').to pluralize_as 'ardis'
      expect('fuzil').to pluralize_as 'fuzis'

      expect('fóssil').to pluralize_as 'fósseis'
      expect('hábil').to pluralize_as 'hábeis'
      expect('útil').to pluralize_as 'úteis'
      expect('fácil').to pluralize_as 'fáceis'
      expect('difícil').to pluralize_as 'difíceis'

      expect('projétil').to pluralize_as 'projéteis'
      expect('réptil').to pluralize_as 'répteis'

      # Yeah! Those are real words :)
      expect('projetil').to pluralize_as 'projetis'
      expect('reptil').to pluralize_as 'reptis'


      expect('álcool').to pluralize_as 'álcoois'
      expect('afável').to pluralize_as 'afáveis'
      expect('amável').to pluralize_as 'amáveis'
    end

    it 'pluralize "n" to "ns"' do
      expect('abdômen').to pluralize_as 'abdomens'
      expect('gérmen').to pluralize_as 'germens'
      expect('hífen').to pluralize_as 'hifens'
      expect('líquen').to pluralize_as 'liquens'
    end

    it '"x" does not pluralize' do
      expect('xerox').to pluralize_as 'xerox'
      expect('tórax').to pluralize_as 'tórax'
      expect('clímax').to pluralize_as 'clímax'
    end

    it 'pluralize "zinho" to "pluraizinhos"' do
      expect('pluralzinho').to pluralize_as 'pluraizinhos'
      expect('botãozinho').to pluralize_as 'botõezinhos'
      expect('balãozinho').to pluralize_as 'balõezinhos'
      expect('pãozinho').to pluralize_as 'pãezinhos'
      expect('papelzinho').to pluralize_as 'papeizinhos'
      expect('anzolzinho').to pluralize_as 'anzoizinhos'
      expect('colarzinho').to pluralize_as 'colarezinhos'
      expect('florzinha').to pluralize_as 'florezinhas'
      expect('molezinha').to pluralize_as 'molezinhas'
      expect('luzinha').to pluralize_as 'luzinhas'
      expect('cruzinha').to pluralize_as 'cruzinhas'

      # Not diminutive ;)
      expect('colarinho').to pluralize_as 'colarinhos'
    end

    it 'pluralize exception' do
      expect('avô').to pluralize_as 'avós'
      expect('avó').to pluralize_as 'avós'

      expect('qualquer').to pluralize_as 'quaisquer'
      expect('raiz').to pluralize_as 'raízes'
      expect('júnior').to pluralize_as 'juniores'
      expect('sênior').to pluralize_as 'seniores'
      expect('caráter').to pluralize_as 'caracteres'

      expect('mal').to pluralize_as 'males'
      expect('cônsul').to pluralize_as 'cônsules'
      expect('gol').to pluralize_as 'gols'
    end

    it 'pluralize interesting ones' do
      expect('degrau').to pluralize_as 'degraus'
      expect('chapéu').to pluralize_as 'chapéus'
    end

    it 'pluralize is immutable' do
      x = Inflector.new('teste')
      x.pluralize
      expect(x.pluralize).to eq 'testes'
    end
  end
end
