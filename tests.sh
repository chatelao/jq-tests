#! /bin/bash

  # pretty print 1:1 from pipe
  - echo '{"hello":"test", "world":"it"}' | jq .

  # pretty print 1:1 from file
  - jq . hello.json
  
  # add a field
  - echo '{}' | jq '.[] | .gugus= "dada"'

  # filter a field
  - echo '{"hello":"test", "world":"it"}' | jq .hello

  # Load two files
  - jq . hello.json world.json

  # Slurp two files to an array
  - jq . -s hello.json world.json  
  - jq -s '.[0]' hello.json world.json
  - jq -s '.[1]' hello.json world.json
  
  # Try combine & merge
  - echo '[{"latin":{"de":"true"}},{"latin":{"fr":"true"}}]' | jq 'reduce .[] as $item ({}; . + $item)'
  - echo '[{"latin":{"de":"true"}},{"latin":{"fr":"true"}}]' | jq 'reduce .[] as $item ({}; . * $item)'
  
  - jq -s 'reduce .[] as $item ({}; . + $item)' hello.json world.json
  - jq -s 'reduce .[] as $item ({}; . * $item)' hello.json world.json
  
  - jq -s 'reduce .[][] as $item ([] ; . + $item)' hello.json world.json
  - jq -s 'reduce .[][] as $item ([] ; . + { latin : $item } )' hello.json world.json
