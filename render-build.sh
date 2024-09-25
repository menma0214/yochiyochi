#!/usr/bin/env bash

# システムパッケージを更新し、ImageMagickをインストール
pt-get update && apt-get install -y imagemagick libmagickwand-dev
