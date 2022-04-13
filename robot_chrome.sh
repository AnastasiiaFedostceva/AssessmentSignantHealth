#!/bin/bash

dir=$(pwd)
cd ui_tests
robot --variable browser_name:Chrome $dir
