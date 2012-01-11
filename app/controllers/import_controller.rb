class ImportController < ApplicationController
  def show
  end

  def create
    dom = Nokogiri::HTML(params[:file].read)
    success_count = 0
    failure_count = 0
    dom.xpath('//dt/a').each do |a|
      begin
        Bookmark.create!(
            user: current_user,
            title: a.content,
            url: a['href'],
            tag_list: a['tags'],
            public: a['private'] == "0",
            created_at: Time.at(a['add_date'].to_i)
        )
        success_count += 1
      rescue Exception => e
        failure_count += 1
        logger.info(e)
      end
    end

    notice = if failure_count == 0
      I18n.translate('import.success', success_count: success_count)
    else
      I18n.translate('import.skipped', success_count: success_count, failure_count: failure_count)
    end

    redirect_to bookmarks_path, notice: notice
  end
end
