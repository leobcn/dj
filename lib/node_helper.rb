
module Devo
  class NodeHelper

    def run(args, options)
      if args.length < 1
        raise "devo node: invalid args."
      end
      case args[0]
      when 'install', 'vendor'
        # npm install
        Devo.docker_exec("iron/node:dev", "npm install")
        Devo.exec("chmod -R a+rw node_modules")
      when 'image'
        Devo::ImageHelper.build1('iron/node', 'node', args[1..args.length])
      when 'version'
        Devo.docker_exec("iron/node", "node -v")
      else
        raise "Invalid node command: #{args[0]}"
      end

    end

  end
end
