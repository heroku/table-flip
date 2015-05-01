require "./lib/table_flip"

RSpec.describe TableFlip do
  subject(:flipper) { TableFlip.new(DB) }

  describe "#check!" do
    subject { -> { flipper.check! } }

    context "with no data in the DB" do
      it { is_expected.to_not raise_error }
    end

    context "with data in the DB" do
      before { DB[:items].insert(id: 1) }

      it { is_expected.to raise_error(TableFlip::DBNotEmptyError) }

      context "with the override flag set" do
        before { ENV[TableFlip::OVERRIDE_FLAG] = "true" }
        it { is_expected.to_not raise_error }
      end
    end
  end
end
