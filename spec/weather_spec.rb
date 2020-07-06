require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    context 'when weather is stormy' do
      it 'returns true' do
        allow(Kernel).to receive(:rand) {9}

        expect(subject.stormy?).to be true
      end
    end

    context 'when weather is not stormy' do
      it 'returns false' do
        allow(Kernel).to receive(:rand) {1}

        expect(subject.stormy?).to be false
      end
    end
  end
end
