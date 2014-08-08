

# erqueue - Queue using ETS. #

Copyright (c) 2014 Stéphane Wirtel.

__Version:__ 0.1.0

## Description

The erqueue module implements a queue using the ETS module of Erlang.

## Usage

## Example

```
Queue = erqueue:new(),
true = erqueue:is_empty(Queue),
ok = erqueue:put(Queue, <<"hello world!">>),
{value, Value} = erqueue:get(Queue),
ok = erqueue:close(Queue).
```

## Ownership and License
The contributors are listed in AUTHORS. This project uses the MPL v2 license,
see LICENSE.

erqueue uses the 
[C4.1 (Collective Code Construction Contract)](http://rfc.zeromq.org/spec:22)
process for contributions.

## Examples

## Development

Under C4.1 process, you are more than welcome to help us by:
* join the discussion over anything from design to code style
* try out and [submit issue reports](https://github.com/matrixise/erqueue/issues/new) or feature requests
* pick a task in [issues](https://github.com/matrixise/erqueue) ang get it done
* for the repository and have your own fixes
* send us pull requests


## Modules ##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="http://github.com/matrixise/erqueue/blob/master/doc/erqueue.md" class="module">erqueue</a></td></tr></table>

