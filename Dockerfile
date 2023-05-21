# Use a base image with Ruby and dependencies installed
FROM ruby:3.0.1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  libsqlite3-dev

# Install Rails gem
RUN gem install rails -v 6.1.3

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install project dependencies
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application code to the container
COPY . .

# Compile assets
RUN bundle exec rails assets:precompile

# Expose the desired port for incoming connections
EXPOSE 3000

# Set the command to start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
