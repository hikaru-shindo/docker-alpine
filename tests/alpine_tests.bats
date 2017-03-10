#!/usr/bin/env bats

@test "printing test should not fail" {
  run docker run --rm alpine-build echo test
  [[ "$status" -eq 0 ]]
  [[ "$output" == "test" ]]
}

@test "os release should be 3.5.0" {
  run docker run --rm alpine-build sh -c 'cat /etc/os-release | grep VERSION_ID'

  [[ "$status" -eq 0 ]]
  [[ "$output" == "VERSION_ID=3.5.0" ]]
}

@test "cache dirs are empty" {
  resultTemp=`docker run --rm alpine-build ls /tmp`
  resultApk=`docker run --rm alpine-build ls /var/cache/apk`

  [[ "$resultTemp" == "" ]]
  [[ "$resultApk" == "" ]]
}
