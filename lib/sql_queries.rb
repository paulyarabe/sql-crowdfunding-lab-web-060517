# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
  # a project can have many pledges, so group the projects and sum the pledges for each.
  # we wanted info from projects and pledges tables if the project belonged to the pledge so we use INNER JOIN
  "SELECT projects.title, sum(pledges.amount) FROM projects INNER JOIN pledges ON pledges.project_id = projects.id GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, sum(pledges.amount) FROM users INNER JOIN pledges ON pledges.user_id = users.id GROUP BY users.name ORDER BY users.name"
end

# amount over goal equals amount - funding_goal
def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, sum(pledges.amount)-projects.funding_goal FROM projects INNER JOIN pledges ON pledges.project_id = projects.id GROUP BY projects.title HAVING sum(pledges.amount) >= projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
  "SELECT users.name, sum(pledges.amount) FROM users INNER JOIN pledges ON pledges.user_id = users.id GROUP BY users.name ORDER BY sum(pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount FROM projects INNER JOIN pledges ON pledges.project_id = projects.id WHERE category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, sum(pledges.amount) FROM projects INNER JOIN pledges ON pledges.project_id = projects.id WHERE category = 'books';"
end
