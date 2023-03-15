# Be sure to restart your server when you modify this file.

# Проверяем, что все переменные окружения переданы и верно настроено подключение к ресурсам.
Rails.application.config.after_initialize do
  next unless Rails.env.production?

  VARIABLES = %w[DATABASE_NAME DATABASE_HOST DATABASE_PORT DATABASE_USERNAME DATABASE_PASSWORD].freeze
  # Проверяем установки переменных окружения
  VARIABLES.each do |variable_name|
    unless ENV[variable_name]
      abort "The environment variable #{variable_name} is not present, please set the variable."
    end
  end

  # Проверяем соединение с БД
  begin
    Report.first
  rescue => e
    abort "Could not connect to database. #{e.message}.\nPlease check parameters #{VARIABLES.to_s}" \
          ' and accessible the database'
  end
end
