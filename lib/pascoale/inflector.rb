module Pascoale
  class Inflector
    include Constants

    PLURAL_RULES = [
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
        [/([#{ACCENTED}].*)[#{ES}]l$/, '\1eis'],
        [/[#{ES}]l$/, 'éis'],
        [/([#{ACCENTED}].*)[#{IS}]l$/, '\1eis'],
        [/[#{IS}]l$/, 'is'],
        [/([#{ACCENTED}].*)[#{OS}]l$/, '\1ois'],
        [/[#{OS}]l$/, 'óis'],
        [/([#{VOWELS}])l$/, '\1is'],
        # General rules
        [/ão$/, 'ões'],
        [/^(.*zinho)$/, ->(match) { m = match.sub(/zinho$/, ''); Inflector.new(m).pluralize.sub(/s$/, '').tr(ACCENTED, NOT_ACCENTED) + 'zinhos'}],
        [/^(.*zinha)$/, ->(match) { m = match.sub(/zinha$/, ''); Inflector.new(m).pluralize.sub(/s$/, '').tr(ACCENTED, NOT_ACCENTED) + 'zinhas'}],
        [/^.*n$/, ->(match) { match.tr(ACCENTED, NOT_ACCENTED) + 's' }],
        [/(m)$/, 'ns'],
        [/([rz])$/, '\1es'],
        [/([#{VOWELS}])$/, '\1s']
    ]

    SINGULAR_RULES =[
        # Exceptions
        ['papeizinhos', 'papelzinho'],
        ['avós', 'avô'],
        ['quaisquer', 'qualquer'],
        ['raízes', 'raiz'],
        ['juniores', 'júnior'],
        ['seniores', 'sênior'],
        ['caracteres', 'caráter'],
        ['males', 'mal'],
        ['cônsules', 'cônsul'],
        # NS to N, not M
        ['abdomens', 'abdômen'],
        ['germens', 'gérmen'],
        ['hifens', 'hífen'],
        ['liquens', 'líquen'],
        # S exceptions - no flex
        ['pires', 'pires'],
        ['vírus', 'vírus'],
        ['atlas', 'atlas'],
        ['lápis', 'lápis'],
        ['ônibus', 'ônibus'],
        # S exceptions - accent change
        ['gases', 'gás'],
        ['meses', 'mês'],
        # S general rule
        [/ses$/, 's'],
        # L general rules
        [/áveis$/, 'ável'], # No good >_<, too specific
        [/éis$/, 'el'],
        [/óis$/, 'ol'],
        [/eis$/, 'il'],
        [/([aou])is$/, '\1l'],
        # General rules
        [/^(.*zinhos)$/, ->(match) { m = match.sub(/zinhos$/, ''); Inflector.new(m + 's').singularize + 'zinho'}],
        [/^(.*zinhas)$/, ->(match) { m = match.sub(/zinhas$/, ''); Inflector.new(m + 's').singularize + 'zinha'}],
        [/is$/, 'il'],
        [/res$/, 'r'],
        [/zes$/, 'z'],
        [/ns$/, 'm'],
        [/ães$/, 'ão'],
        [/ões$/, 'ão'],
        [/s$/, '']
    ]

    def initialize(text)
      @text = text
    end

    def pluralize
      @pluralized ||= apply_rules_to(@text, PLURAL_RULES)
    end

    def singularize
      @singularized ||= apply_rules_to(@text, SINGULAR_RULES)
    end

    private
    def apply_rules_to(text, rules)
      rslt = text.dup
      rules.each do |regex, replace|
        reg = Regexp === regex ? regex : /^#{regex}$/
        case replace
          when Proc
            return rslt if rslt.sub!(reg, &replace)
          else
            return rslt if rslt.sub!(reg, replace)
        end
      end
      rslt
    end
  end
end