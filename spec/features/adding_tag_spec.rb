feature 'Adding tag' do

  scenario 'I can add a single tag to a link' do

    visit '/links/new'
    fill_in 'url',    with: 'http://www.zombo.com'
    fill_in 'title',  with: 'This is Zombocom'
    fill_in 'tags',   with: 'zombo'
    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include 'zombo'
  end
end
