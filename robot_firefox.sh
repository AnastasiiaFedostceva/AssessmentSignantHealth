#!/bin/bash

dir=$(pwd)
cd ui_tests
robot --variable browser_name:Firefox $dir
