module ValidData
  class ParallelRunner
    def initialize(padding, adapter, &after_fork)
      @padding    = padding.to_i
      @adapter    = adapter
      @printer    = Printer.new(padding.to_i)
      @readers    = {}
      @after_fork = after_fork || Proc.new {}
    end

    def run(num_of_processes = 2)
      @readers = fork(num_of_processes.to_i, &worker)
      set_manager_procline(pids(@readers))
      watch(@readers)
      wait(pids(@readers))
    end

    private

    def worker
      Proc.new do |models, writer|
        @after_fork.call(self)

        procline("Processing #{models.map(&:name)}")

        Collector.new(models).each do |result|
          writer.puts @printer.print(result)
          writer.flush
        end
      end
    end

    def fork(n, &worker)
      buckets(n).each_with_object({}) do |models, readers|
        reader, writer = IO.pipe

        pid = Process.fork do
          reader.close
          worker.call(models, writer)
        end

        writer.close
        readers[pid] = reader if pid
      end
    end

    def watch(readers)
      watch_and_react(readers) do |reader|
        if reader.eof?
          readers.delete_if { |_, value| reader == value }
        else
          puts(reader.gets)
        end

        set_manager_procline(pids(readers))
      end
    end

    def watch_and_react(readers, &reaction)
      Thread.new do
        begin
          loop do
            io = IO.select(readers.values)

            ((io && io.first) || []).each do |reader|
              yield reader
            end
          end
        rescue Exception => ex
          puts ex.message
          puts ex.backtrace
        end
      end
    end

    def buckets(n)
      buckets = Hash.new{ |h, k| h[k] = [] }

      mapping(n).each_with_index do |position, idx|
        buckets[position] << models[idx] if models[idx]
      end

      buckets.values
    end

    def mapping(n)
      (0..n - 1).cycle.take(models.size)
    end

    def wait(pids)
      pids.each { |pid| Process.waitpid(pid) }
    end

    def pids(readers)
      readers.keys
    end

    def set_manager_procline(pids)
      procline("Manager #{pids}")
    end

    def procline(str)
      $0 = "[ValidData-#{ValidData::VERSION}] #{str}"
    end

    def models
      @adapter.descendants.reject { |klass|
        klass.name.include?("::Translation") || klass.abstract_class?
      }.sort_by(&:count)
    end
  end
end
