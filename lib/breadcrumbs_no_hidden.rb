module BreadcrumbsNoHidden
  include Radiant::Taggable

  desc "breadcrumbs tag which ignores hidden ancestors."
  tag "breadcrumbs" do |tag|
    page = tag.locals.page
    breadcrumbs = [page.breadcrumb]
    nolinks = (tag.attr['nolinks'] == 'true')
    page.ancestors.each do |ancestor|
      next if ancestor.status.name.downcase == 'hidden'
      tag.locals.page = ancestor
      if nolinks
        breadcrumbs.unshift tag.render('breadcrumb')
      else
        breadcrumbs.unshift %{<a href="#{tag.render('url')}">#{tag.render('breadcrumb')}</a>}
      end
    end
    separator = tag.attr['separator'] || ' &gt; '
    breadcrumbs.join(separator)
  end
end

