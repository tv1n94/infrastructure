# Use base image with Ruby installed
FROM ruby:2.3

#Устанавливаем нужные пакеты в образ
RUN apt-get update -qq && \
    apt-get install -y build-essential

#Создаём директорию и устанавливаем зависимости ruby
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY raddit/Gemfile* $APP_HOME/
RUN bundle install

# Копируем само приложение в нашу рабочую директорию
ADD raddit/ $APP_HOME

# Определяем команду для запуска приложения
CMD ["puma"]
