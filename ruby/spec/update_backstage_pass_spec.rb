require 'update_backstage_pass'

describe UpdateBackstagePass do
  let(:ticket) { Item.new('ticket', 11, 5) }
  let(:ticket_7) { Item.new('ticket', 7, 5) }
  let(:ticket_4) { Item.new('ticket', 3, 5) }
  let(:ticket_50) { Item.new('ticket', 3, 48) }
  let(:ticket_0) { Item.new('ticket', -1, 5) }

  it 'increase quality by 1 if sell_in is > 10' do
    shop = UpdateBackstagePass.new(ticket)
    shop.update
    expect(ticket.quality).to eq(6)
  end

  it 'increase quality by 1 if sell_in is > 10' do
    shop = UpdateBackstagePass.new(ticket_7)
    shop.update
    expect(ticket_7.quality).to eq(7)
  end

  it 'increase quality by 1 if sell_in is > 10' do
    shop = UpdateBackstagePass.new(ticket_4)
    shop.update
    expect(ticket_4.quality).to eq(8)
  end

  it "won't increase quality by if will put quality over 50" do
    shop = UpdateBackstagePass.new(ticket_50)
    shop.update
    expect(ticket_50.quality).to eq(50)
  end

  it 'should set quality to 0 after concert' do
    shop = UpdateBackstagePass.new(ticket_0)
    shop.update
    expect(ticket_0.quality).to eq(0)
  end
end
