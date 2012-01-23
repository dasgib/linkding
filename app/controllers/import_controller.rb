class ImportController < ApplicationController
  def show
    @import_form = ImportForm.new
  end

  def create
    @import_form = ImportForm.new(params[:import_form])

    unless @import_form.valid?
      render :show
      return
    end

    dom = Nokogiri::HTML(@import_form.file.read)
    success_count = 0
    failure_count = 0
    import = Import.create!(user: current_user)
    dom.xpath('//dt/a').each do |a|
      begin
        next_element = next_element(a)
        description = (next_element.content if next_element.try(:name) == "dd")
        url = a['href'].try(:strip)
        Bookmark.create!(
            user: current_user,
            url: url,
            title: a.content.try(:strip).truncate(1024),
            description: description.try(:strip),
            tag_list: filter_tags(a['tags']),
            public: a['private'] == "0",
            created_at: Time.at(a['add_date'].to_i),
            import: import
        )
        success_count += 1
      rescue Exception => e
        failure_count += 1
        logger.info("Import #{import.id}, url: #{url.inspect}: #{e}")
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
