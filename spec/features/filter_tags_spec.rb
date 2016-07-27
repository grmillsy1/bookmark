feature 'Filter tags' do

  scenario 'I can filter links by tags' do
    visit '/links/new'
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])

    Link.create(url: 'http://www.bubblelondon.com', title: 'Child clothing exhibition', tags: [Tag.first_or_create(name: 'bubbles')])

    visit '/tags/bubbles'
    expect(page).to have_content 'Child clothing exhibition'
    expect(page).not_to have_content 'Makers Academy'

  end
end
