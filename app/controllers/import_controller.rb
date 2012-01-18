class ImportController < ApplicationController
  def show
  end

  def create
    dom = Nokogiri::HTML(params[:file].read)
    success_count = 0
    failure_count = 0
    import = Import.create!(user: current_user)
    dom.xpath('//dt/a').each do |a|
      begin
        next_element = next_element(a)
        description = (next_element.content if next_element.try(:name) == "dd")
        Bookmark.create!(
            user: current_user,
            url: a['href'].try(:strip),
            title: a.content.try(:strip),
            description: description.try(:strip),
            tag_list: filter_tags(a['tags']),
            public: a['private'] == "0",
            created_at: Time.at(a['add_date'].to_i),
            import: import
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

  private

  def filter_tags(input)
    # Remove delicious share tags since this information should not be public
    blacklist = /for\:.+/
    input.split(",").map(&:strip).reject { |tag| tag =~ blacklist }.join(",") if input.present?
  end

  def next_element(node)
    node.next_element || next_element(node.parent) unless node.nil?
  end
end
