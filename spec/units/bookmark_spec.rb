require 'bookmark'

RSpec.describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')


      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmark = Bookmark.all
      expect(bookmark).to include("http://www.makersacademy.com")
      expect(bookmark).to include("http://www.destroyallsoftware.com")
      expect(bookmark).to include("http://www.google.com")
    end
  end
end
