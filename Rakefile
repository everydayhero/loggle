task :build do
  sh *%W(docker build -t loggle .)
end

task :run do
  if `docker ps -a | grep loggle-base`.strip.size > 0
    sh *%W(docker rm loggle-base)
  end
  sh *%W(docker run
           --detach
           --name="loggle-base"
           -v /loggle:/loggle
           loggle)
  sh *%W(docker logs loggle-base)
end
