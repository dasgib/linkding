class ImportController < ApplicationController
  def show
  end

  def create
    dom = Nokogiri::HTML(params[:file].read)
    count = 0
    dom.xpath('//dt/a').each do |a|
      bookmark = Bookmark.create(
          user: current_user,
          title: a.content,
          url: a['href'],
          tag_list: a['tags'],
          public: a['private'] == "0"
      )
      count += 1 unless bookmark.errors.present?
    end

    redirect_to bookmarks_path, notice: I18n.translate('import.success', count: count)
  end
end
