%% Copyright
-module(yahtzee_player).
-author("chadrs").

-behaviour(gen_fsm).

%% API
-export([start_link/0]).

%% gen_fsm
-export([init/1, state_name/2, state_name/3, handle_event/3,
  handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).

%% API
start_link() ->
  gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

%% gen_fsm callbacks
-record(state, {}).

init(_Args) ->
  {ok, initial_state_name, initial_state}.

state_name(_Event, State) ->
  {next_state, state_name, State}.

state_name(_Event, _From, State) ->
  {reply, ok, state_name, State}.

handle_event(_Event, StateName, State) ->
  {next_state, StateName, State}.

handle_sync_event(_Event, _From, StateName, State) ->
  {reply, ok, StateName, State}.

handle_info(_Info, StateName, State) ->
  {next_state, StateName, State}.

terminate(_Reason, _StateName, _State) ->
  ok.

code_change(_OldVsn, StateName, State, _Extra) ->
  {ok, StateName, State}.
