module Searchable
  def search(params)
    results = self.all

    page = (params[:offset] || 1).to_i
    per_page = (params[:limit] || 25).to_i

    if params[:sort]
      sort = params[:sort].split(' ')
      sort_key = sort[0]
      sort_dir = sort[1]
      results = results.order("LOWER(#{sort_key}) #{sort_dir}")
    end

    results = results.paginate(page: page, per_page: per_page)
    total_pages = results.total_pages
    total_count = results.total_entries

    meta = {page: page, per_page: per_page, total_pages: total_pages, total_count: total_count}
    ActiveModel::ArraySerializer.new(results, root: self.to_s.pluralize.downcase, meta: meta, each_serializer: "#{self.to_s}Serializer".constantize).to_json
  end
end