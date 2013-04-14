%%% 'antonius' chess engine
%%% Copyright (C) 2013 Rabbe Fogelholm
%%%
%%% This program is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% (at your option) any later version.
%%%
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% @author erarafo
%% @doc @todo Add description to core_nif.


-module(core_nif).

-export([init/1]).
-export([createPiecesMap/4]).
-export([coverageValueHelper/2]).


%% @doc Load the C version of certain functions.

init(LibDir) ->
	LibSpec = filename:join(LibDir, "core_nif"),
	case erlang:load_nif(LibSpec, 0) of
		{error, {Reason, Text}} ->
			{error, {Reason, Text, "path was: "++LibSpec}};
		ok ->
			{ok}
	end.


%% @doc This is the pure Erlang version of createPiecesMap.

createPiecesMap(White, Black, _BoardMap, _Null) ->
	core_boardmap:createPiecesMap(White, Black).


coverageValueHelper(Squares, Bias) ->
	core_node:coverageValueHelper(Squares, Bias).


