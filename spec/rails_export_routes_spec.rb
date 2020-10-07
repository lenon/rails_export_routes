# frozen_string_literal: true

RSpec.describe RailsExportRoutes, type: :aruba do
  it 'prints a help message when executed with no args' do
    run_command('rails-export-routes')

    aggregate_failures do
      expect(last_command_started).to be_successfully_executed
      expect(last_command_started).to have_output(/rails-export-routes export FILE/)
      expect(last_command_started).to have_output(/rails-export-routes help \[COMMAND\]/)
    end
  end

  it 'prints an error when trying to export with an invalid format' do
    run_command('rails-export-routes export --format foo file.foo')

    aggregate_failures do
      expect(last_command_started).not_to be_successfully_executed
      expect(last_command_started).to have_output(/Expected '--format' to be one of csv, json, json-pretty; got foo/)
    end
  end

  it 'prints an error when trying to export without a file' do
    run_command('rails-export-routes export --format csv')

    aggregate_failures do
      expect(last_command_started).not_to be_successfully_executed
      expect(last_command_started).to have_output(/Usage: "rails-export-routes export FILE"/)
    end
  end

  it 'prints an error when running in a non-Rails app' do
    create_directory('my_rails_app')
    cd('my_rails_app')

    run_command('rails-export-routes export --format csv output.csv')

    aggregate_failures do
      expect(last_command_started).not_to be_successfully_executed
      expect(last_command_started).to have_output(/Rails app not found in .*my_rails_app/)
    end
  end

  it 'correctly exports routes to a CSV file' do
    copy('%/sample_app', 'sample_app')
    cd('sample_app')

    run_command('rails-export-routes export --format csv my-app-routes.csv')

    aggregate_failures do
      expect(last_command_started).to be_successfully_executed
      expect('my-app-routes.csv').to have_same_file_content_as('%/output.csv')
    end
  end

  it 'correctly exports routes to a JSON file' do
    copy('%/sample_app', 'sample_app')
    cd('sample_app')

    run_command('rails-export-routes export --format json my-app-routes.json')

    aggregate_failures do
      expect(last_command_started).to be_successfully_executed
      expect('my-app-routes.json').to have_same_file_content_as('%/output.json')
    end
  end

  it 'correctly exports routes to a pretty JSON file' do
    copy('%/sample_app', 'sample_app')
    cd('sample_app')

    run_command('rails-export-routes export --format json-pretty my-app-routes.json')

    aggregate_failures do
      expect(last_command_started).to be_successfully_executed
      expect('my-app-routes.json').to have_same_file_content_as('%/output-pretty.json')
    end
  end
end
