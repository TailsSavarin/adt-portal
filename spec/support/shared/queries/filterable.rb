# frozen_string_literal: true

shared_examples_for 'filterable' do
  context 'with params' do
    it 'has correct size' do
      expect(query.size).to eq(1)
    end

    it 'has correct result' do
      expect(query[0].public_send(param)).to eq(params[param])
    end
  end
end
