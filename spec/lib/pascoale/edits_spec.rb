require 'spec_helper'

describe Edits do
  let(:edits) { Edits.new('test') }

  it 'deletes letters' do
    expect(edits.deletions).to include('est', 'tst', 'tet', 'tes')
  end

  it 'transpose letters' do
    expect(edits.transpositions).to include('etst', 'tset', 'tets')
  end

  it 'substitutes letters' do
    expect(edits.substitutions).to include('aest', 't st', 'teçt', 'tesz')
  end

  it 'inserts letters' do
    expect(edits.insertions).to include('t est', 'tesst', 'teste', 'átest')
  end

  it '1st editions' do
    expect(edits.editions).to include('est', 'tset', 'teçt', 'átest')
  end

  it '2nd editions' do
    expect(edits.editions2).to include('teõstç', 'es', 'tste', 'tessst')
  end
end
