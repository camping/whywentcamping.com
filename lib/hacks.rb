require 'redcloth'

class RedCloth::TextileDoc
  def self.new(*a)
    i = super(*a)
    i.hard_breaks = false
    i
  end
end

class String
  def to_url
    remove_formatting.
    sub(/./) { |s| s.downcase }.
    gsub(/ (.)/) { $1.upcase }
  end
end

module Helpers
  def latest_news
    @pages.find(
      :limit => :all,
      :in_directory => 'news',
      :sort_by => 'created_at'
    ).last.title 
  end
  
  def news_header
    partial = @partials.find(:filename => "_entry_header", :in_directory => "/")
    '<notextile>' + render(partial) + '</notextile>'
  end
end

Webby::Helpers.register(Helpers)
