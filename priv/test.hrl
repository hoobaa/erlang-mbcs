-record(mbcs_codecs_item, {
	  undefined    :: set(),	% undefine bytes
	  leadbytes	   :: set(),    % dbcs lead bytes
	  mbtable      :: dict(),	% multiple byte to wide character table
	  wctable      :: dict()    % wide character to multiple byte table
	 }).

-record(mbcs_server, {
	  codecs       :: dict(),	% codecs name to codecs type 'unicode' | 'mbcs' | 'gb18030'
	  mbcs_codecs  :: dict()    % mbcs codecs name to #mbcs_codecs_item{}
	 }).
     
-record(mbcs_options, {
	  return             :: atom(),	            % file name
	  error	             :: atom(),             % error strategy  'strict' | 'ignore' | 'replace'
	  error_replace_char :: non_neg_integer(),	% error replace char
	  bom                :: boolean()           % encode bom
	 }).
