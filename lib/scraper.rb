require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  # this method is responsible for scraping the index page that lists all of the students
  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []

    page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value

      student_info = {:name => name,
                :location => location,
                :profile_url => profile_url}
                
      students << student_info
      end
    students
  end

  # This method is responsible for scraping an individual student's profile page
  def self.scrape_profile_page(profile_url)
    
  end

end
