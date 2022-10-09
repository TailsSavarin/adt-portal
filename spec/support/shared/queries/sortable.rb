# frozen_string_literal: true

shared_examples_for 'sortable by dates' do
  context 'when asc' do
    before { params[:sort_dir] = :asc }

    it 'sorts' do
      expect(query[0].public_send(param)).to eq(models[0].public_send(param))
    end
  end

  context 'when desc' do
    before { params[:sort_dir] = :desc }

    it 'sorts' do
      expect(query[0].public_send(param)).to eq(models[1].public_send(param))
    end
  end
end

shared_examples_for 'sortable by fields' do
  context 'when asc' do
    before { params[:sort_dir] = :asc }

    it 'sorts' do
      expect(query[0].public_send(param)).to eq(models[0].public_send(param))
    end
  end

  context 'when desc' do
    before { params[:sort_dir] = :desc }

    it 'sorts' do
      expect(query[0].public_send(param)).to eq(models[1].public_send(param))
    end
  end
end
