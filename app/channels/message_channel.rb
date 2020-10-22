class MessageChannel < ApplicationCable::Channel
  def subscribed
    puts "connected from where?"
    stream_from 'messages'
    ActionCable.server.broadcast('messages', {
      epic_raw_cookie_string: '__cfduid=d2dea7f000000000000000000000000000000000000; expires=Wed, 01-Jul-20 21:52:47 GMT; path=/; domain=.getepic.com; HttpOnly; SameSite=Lax, PHPSESSID=odkb4ls0000000000000000000; path=/; domain=.getepic.com, PHPSESSID=odkb4lsn000000000000000000; expires=Thu, 11-Jun-2020 21:52:48 GMT; Max-Age=864000; path=/; samesite=strict; domain=.getepic.com; secure; HttpOnly, epic_session=8e0c5876-4120-4dbd-b551-3b83cefda5dc%3Ad9800000000000000000000000000000; expires=Wed, 01-Jul-2020 21:52:48 GMT; Max-Age=2592000; path=/; domain=.getepic.com',
      current_beanstack_profile_id: '6_290_590',
      epic_accounts: [
          { account_id: '22_519_080', id: '99_850_362', name: 'Avery' },
          { account_id: '22_519_080', id: '99_898_511', name: 'Bob' },
          { account_id: '22_519_080', id: '99_858_421', name: 'Dave' }
      ],
      beanstack_profiles: [
          { id: '6_290_590', first_name: 'Avery', prefilled_epic_id: '99_850_362', initials: 'AA', image_url: 'https://dowvq86h33m3d.cloudfront.net/profiles/1/image/1/original/B8CFA156-051F-4CEB-98C8-C8D3A9928295.jpg?1598629065' },
          { id: '6_290_589', first_name: 'Dave', prefilled_epic_id: '-1', initials: 'DA', image_url: '' },
          { id: '6_290_595', first_name: 'Robert', prefilled_epic_id: '99_898_511', initials: 'RA', image_url: '' }
      ],
    })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def received
    ActionCable.server.broadcast('messages', {hello: 'world'})
  end

  def send_message(args)
  	ActionCable.server.broadcast('messages', args)
  end
end
