# Package
version     = "0.1.2"
author      = "Charles Blake"
description = "Low Overhead Numerical/Native IO library & tools"
license     = "MIT/ISC"

# Deps
requires    "nim >= 1.5.1"
requires    "cligen >= 1.5.5"

import std/os

template isTest(file: string): bool =
  let fn = file.lastPathPart
  fn.startsWith("0") and fn.endsWith(".sh")

const devShmD = "/dev/shm/d"

task test, "run tests":
  if devShmD.dirExists:
    exec "rm -r " & devShmD
  for file in listFiles "tests":
    if file.isTest:
      exec file
