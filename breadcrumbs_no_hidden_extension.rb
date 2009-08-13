# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class BreadcrumbsNoHiddenExtension < Radiant::Extension
  version "1.0"
  description "Redefines breadcrumbs tag to ignore hidden ancestor pages. [FAR END Technologies Corporation]"
  url "http://www.farend.co.jp/"
  
  def activate
    Page.send :include, BreadcrumbsNoHidden
  end
  
  def deactivate
  end
  
end
