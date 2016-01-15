#!/bin/bash

perl $EBISC_CODE/tracking_code/scripts/subset_for_release.pl -api_compares_json /homes/ebiscdcc/public_html/track/json/api_compares.json \
      -allowed_line UKBi002-A \
      -allowed_line UKBi003-A \
      -allowed_line UKBi005-A \
      -allowed_line UKBi006-A \
      -allowed_line UKBi008-A \
      -allowed_line UKKi006-A \
      -allowed_line UKKi007-A \
      -allowed_line UKKi007-B \
      -allowed_line UKKi008-A \
      -allowed_line UKKi011-A \
      -allowed_line UKKi012-A \
      #TODO Get confirmation of these lines and get HipSCi lines
      > $HOME/api_compares.subset.json \
&& perl $EBISC_CODE/tracking_code/scripts/create_error_json.pl -api_compares_json $HOME/api_compares.subset.json > $HOME/api_errors.subset.json \
&& perl $EBISC_CODE/tracking_code/scripts/create_tests_json.pl -api_compares_json $HOME/api_compares.subset.json > $HOME/api_tests.subset.json \
&& mv -f $HOME/api_compares.subset.json /homes/ebiscdcc/public_html/release0116/json/api_compares.json \
&& mv -f $HOME/api_errors.subset.json /homes/ebiscdcc/public_html/release0116/json/errors.json \
&& mv -f $HOME/api_tests.subset.json /homes/ebiscdcc/public_html/release0116/json/tests.json \
&& cp /homes/ebiscdcc/public_html/track/json/error_history.json /homes/ebiscdcc/public_html/release0116/json/error_history.json
