class AdminController < ApplicationController
  def index

    conversion_query = "SELECT 'January' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 1) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 1) AS SF) AS SignupSubmits
UNION
SELECT 'Feburary' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 2) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 2) AS SF) AS SignupSubmits
UNION
SELECT 'March' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 3) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 3) AS SF) AS SignupSubmits
UNION
SELECT 'April' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 4) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 4) AS SF) AS SignupSubmits
UNION
SELECT 'May' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 5) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 5) AS SF) AS SignupSubmits
UNION
SELECT 'June' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 6) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 6) AS SF) AS SignupSubmits
UNION
SELECT 'July' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 7) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 7) AS SF) AS SignupSubmits
UNION
SELECT 'August' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 8) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 8) AS SF) AS SignupSubmits
UNION
SELECT 'September' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 9) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 9) AS SF) AS SignupSubmits
UNION
SELECT 'October' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 10) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 10) AS SF) AS SignupSubmits
UNION
SELECT 'Novenber' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 11) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 11) AS SF) AS SignupSubmits
UNION

SELECT 'December' AS MONTH,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(day from created_at) AS Day, EXTRACT(month from created_at), EXTRACT(year from created_at) from eventlogs
				 WHERE controller = 'HomeController' AND action = 'Visited Home Page' AND EXTRACT(month FROM created_at) = 12) AS LP) AS HomePage,
	(SELECT COUNT(*) FROM (SELECT DISTINCT ip, EXTRACT(DAY FROM created_at) AS day, EXTRACT(MONTH FROM created_at), EXTRACT(YEAR FROM created_at) FROM eventlogs
		      WHERE controller = 'SignupsController' AND action = 'Submitted Signup Form' AND EXTRACT(MONTH FROM created_at) = 12) AS SF) AS SignupSubmits"

    @conversions = ActiveRecord::Base.connection.execute(conversion_query)

    total = 0
    @conversions.each do |row|
      row.each do |column|
        total = total + 1
      end
    end

  end
end
