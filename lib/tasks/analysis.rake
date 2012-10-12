namespace :analyzer do
    desc "run rails_best_practices"
    task :rails_best_practices do
      require 'rails_best_practices'
      app_root = Rake.application.original_dir
      output_file = File.join(app_root, 'analyzer', 'rails_best_practices.html')
      analyzer = RailsBestPractices::Analyzer.new(app_root, {
        'format' => 'html',
        'with-textmate' => true,
        'output-file' => output_file
      })
      analyzer.analyze
      analyzer.output
      fail "found bad practices, see details in " + output_file if analyzer.runner.errors.size >0
    end
end
