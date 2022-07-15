class HardWorkerWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "hello"
  end
end
