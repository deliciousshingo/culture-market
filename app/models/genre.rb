class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Hiphop' },
    { id: 3, name: 'Jazz' },
    { id: 4, name: 'Lockin' },
    { id: 5, name: 'Breakin' },
    { id: 6, name: 'Poppin' },
    { id: 7, name: 'House' },
    { id: 8, name: 'Kids' },
    { id: 9, name: 'Tap' },
    { id: 10, name: 'K-POP' },
    { id: 11, name: 'その他' }
  ]
  end