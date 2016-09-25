##Note to Gannett

How to get running on your machine:
1. This app uses Ruby on Rails. If you don't have Ruby, Rails, or Bundler, get it via http://railsinstaller.org/en
2. Clone the repo.
3. Run `bundle` inside the repo you just cloned.
4. Run `rake db:migrate` to create the tables. If this doesn't work, run `rake db:create` first.
5. Then run `rails s` to open to app.

Note: 
1. The 365 days persistence requirement for tying User to their unique profile_id was not met. Right now, it persists eternally. I contemplated using chron jobs but the implementation was heavy so I skipped that. However, what it would do is run a scan for all Users in the database every day and scans for Users where created_date was more than 365 days ago and delete it. 
2. The test coverage in this app is not 100%. I ran into some development traps when I stopepd using TDD and one of the classes had a very diffcult to test public interface. I inadverdently wrote a imperative shell for the public method, and hiding most of the business logic inside the private methods which it calls. This took up a lot of time which exceeded the scope of the challenge. 

Assumptions:
1. I thought about implementing a caching system for the articles per profile_id. Meaning when we have a new User on our app that we previously never seen, we would fetch the content from the endpoint. However, if the User did exist (I'm basing this off of the ip address), we would simply fetch the cached version of the articles from our db. 

However, due to the volatile nature of articles in general, I am going to presume that they will change frequently. Given that there's no immediate way on the endpoint to tell if the content has changed without actually fetching the content, there's no need for this. 

# Gannett Developer Candidate Exercise

Greetings! This exercise was written to provide developers with an opportunity to show off their mad coding chops.

If you do not understand, or are unable to complete some of the acceptance criteria in this exercise, don't panic! The exercise was written by fellow developers that are just as eager to see how you approach a problem as they are to see the end result.

## Feature Set Overview

The goal of this exercise is to deliver a single page of personalized content in an efficient, scalable manner.

### Acceptance Criteria

1. Visiting "/" on the web application server should display an HTML page.
	1. At the top of the page a headline should display with the following content: "My Delicious Articles"
	2. A profile id should be retrieved from "https://peaceful-springs-7920.herokuapp.com/profile/" on every page load.
		1. The profile id each user acquires should persist the same value for that user across requests for 365 days.
	3. Using the profile id acquired, profile specific content should be retrieved from "https://peaceful-springs-7920.herokuapp.com/content/PROFILE_ID/".
		1. The "articles" from the profile specific content should be displayed directly below the headline.
			1. The articles should be displayed in the order they were returned by the endpoint.
			2. For each item the article's "title" should appear first.
			3. For each item the article's "summary" should appear directly below its "title".
			4. For each item the "title" and "summary" should be links to that article's "href".
		2. If the profile specific content includes a "theme" with the value "rare", the HTML page's default text color should be crimson (#DC143C).
		3. If the profile specific content includes a "theme" with the value "well", the HTML page's default text color should be saddle brown (#8B4513).
2. The feature set should be delivered as a GitHub pull request against this repository's "master" branch.
	1. The pull request should include step-by-step instructions describing how the feature set can be run locally.

### Technical Notes

1. This exercise can be completed with any common web language or framework (Go, Java, Node.js, Python, Ruby, etc.). Any tool-set that can be used to fulfill the acceptance criteria is welcome.
2. The profile id endpoint referenced above automatically uses a cookie to preserve the profile id across requests.
3. Both endpoints in the acceptance criteria above support a content type of either "application/json" or "application/javascript" (JSONP). The JSONP callback query string parameter is "callback".
4. The exercise is relatively short to allow time for ample polish. Consider the implementation's: scalability, test coverage, readability, etc.