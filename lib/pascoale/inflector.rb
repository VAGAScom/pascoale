module Pascoale
  class Inflector
    RULES = [
        # Exceções
        ['qualquer', 'quaisquer'],
        ['avô', 'avós'],
        ['raiz', 'raízes'],
        ['júnior', 'juniores'],
        ['sênior', 'seniores'],
        ['caráter', 'caracteres'],
        # ão => ães
        ['alemão', 'alemães'],
        ['capitão', 'capitães'],
        ['pão', 'pães'],
        ['cão', 'cães'],
        ['charlatão', 'charlatães'],
        ['sacristão', 'sacristães'],
        ['capelão', 'capelães'],
        ['escrivão', 'escrivães'],
        ['tabelião', 'tabeliães'],
        # ão => ãos
        ['sótão', 'sótãos'],
        ['cidadão', 'cidadãos'],
        ['chão', 'chãos'],
        ['bênção', 'bênçãos'],
        ['cristão', 'cristãos'],
        ['grão', 'grãos'],
        ['órfão', 'órfãos'],
        ['irmão', 'irmãos'],
        ['mão', 'mãos'],
        ['refrão', 'refrãos'],
        # S exceptions - no flex
        ['pires', 'pires'],
        ['vírus', 'vírus'],
        ['atlas', 'atlas'],
        ['lápis', 'lápis'],
        ['ônibus', 'ônibus'],
        # S exceptions - accent change
        ['gás', 'gases'],
        ['mês', 'meses'],
        # S general rule
        [/(s)$/, '\1es'],
        # L exceptions
        ['mal', 'males'],
        ['cônsul', 'cônsules'],
        ['gol', 'gols'],
        # L rules (too many accents :p)
        [/([#{Constants::ACCENTED}].*)[#{Constants::ES}]l$/, '\1eis'],
        [/[#{Constants::ES}]l$/, 'éis'],
        [/([#{Constants::ACCENTED}].*)[#{Constants::IS}]l$/, '\1eis'],
        [/[#{Constants::IS}]l$/, 'is'],
        [/([#{Constants::ACCENTED}].*)[#{Constants::OS}]l$/, '\1ois'],
        [/[#{Constants::OS}]l$/, 'óis'],
        [/([#{Constants::VOWELS}])l$/, '\1is'],
        # General rules
        [/ão$/, 'ões'],
        [/^(.*zinho)$/, ->(match) { m = match.sub(/zinho$/, ''); Inflector.new(m).pluralize.sub(/s$/, '').tr(Constants::ACCENTED, Constants::NOT_ACCENTED) + 'zinhos'}],
        [/^(.*zinha)$/, ->(match) { m = match.sub(/zinha$/, ''); Inflector.new(m).pluralize.sub(/s$/, '').tr(Constants::ACCENTED, Constants::NOT_ACCENTED) + 'zinhas'}],
        [/^.*n$/, ->(match) { match.tr(Constants::ACCENTED, Constants::NOT_ACCENTED) + 's' }],
        [/(m)$/, 'ns'],
        [/([rz])$/, '\1es'],
        [/([#{Constants::VOWELS}])$/, '\1s']
    ]

    def initialize(text)
      @text = text
    end

    def pluralize
      @pluralized ||= plural(@text)
    end

    private
    def plural(text)
      pluralized = text.dup
      RULES.each do |regex, replace|
        reg = Regexp === regex ? regex : /^#{regex}$/
        case replace
          when Proc
            return pluralized if pluralized.sub!(reg, &replace)
          else
            return pluralized if pluralized.sub!(reg, replace)
        end
      end
      pluralized
    end
  end
end