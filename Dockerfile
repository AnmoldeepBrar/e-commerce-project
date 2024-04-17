# Use the official Ruby image
FROM ruby:latest

# Set environment variables
ENV RAILS_ROOT /app
ENV LANG C.UTF-8

# Create and set the working directory
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# Install Rails
RUN gem install rails

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Configure database
RUN rails db:create db:migrate db:seed

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
