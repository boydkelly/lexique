#!/usr/bin/bash
 git clone --recursive -b saxon98 https://github.com/transpect/calabash-frontend.git calabash
 git submodule add https://github.com/transpect/mml2tex.git
 git submodule add https://github.com/transpect/cascade.git
 git submodule add https://github.com/transpect/mml-normalize.git
 git submodule add https://github.com/transpect/xproc-util.git
 git submodule add https://github.com/transpect/xslt-util.git
 git submodule add https://github.com/transpect/xml2tex.git

