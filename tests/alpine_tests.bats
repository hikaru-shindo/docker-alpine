#!/usr/bin/env bats

@test "printing test should not fail" {
  run docker run --rm alpine-build echo test
  [[ "$status" -eq 0 ]]
  [[ "$output" == "test" ]]
}

@test "cache dirs are empty" {
  resultTemp=`docker run --rm alpine-build ls /tmp`
  resultApk=`docker run --rm alpine-build ls /var/cache/apk`

  [[ "$resultTemp" == "" ]]
  [[ "$resultApk" == "" ]]
}
