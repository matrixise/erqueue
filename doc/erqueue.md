

# Module erqueue #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



<a name="types"></a>

## Data Types ##




### <a name="type-erqueue">erqueue()</a> ###



<pre><code>
erqueue() = #erqueue{}
</code></pre>


<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#close-1">close/1</a></td><td></td></tr><tr><td valign="top"><a href="#dump-1">dump/1</a></td><td></td></tr><tr><td valign="top"><a href="#get-1">get/1</a></td><td></td></tr><tr><td valign="top"><a href="#is_empty-1">is_empty/1</a></td><td></td></tr><tr><td valign="top"><a href="#is_full-1">is_full/1</a></td><td></td></tr><tr><td valign="top"><a href="#len-1">len/1</a></td><td></td></tr><tr><td valign="top"><a href="#new-0">new/0</a></td><td></td></tr><tr><td valign="top"><a href="#new-1">new/1</a></td><td></td></tr><tr><td valign="top"><a href="#put-2">put/2</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="close-1"></a>

### close/1 ###


<pre><code>
close(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; ok
</code></pre>

<br></br>



<a name="dump-1"></a>

### dump/1 ###


<pre><code>
dump(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; term()
</code></pre>

<br></br>



<a name="get-1"></a>

### get/1 ###


<pre><code>
get(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; {Data::term()}
</code></pre>

<br></br>



<a name="is_empty-1"></a>

### is_empty/1 ###


<pre><code>
is_empty(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; boolean()
</code></pre>

<br></br>



<a name="is_full-1"></a>

### is_full/1 ###


<pre><code>
is_full(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; boolean()
</code></pre>

<br></br>



<a name="len-1"></a>

### len/1 ###


<pre><code>
len(Ref::<a href="#type-erqueue">erqueue()</a>) -&gt; integer()
</code></pre>

<br></br>



<a name="new-0"></a>

### new/0 ###


<pre><code>
new() -&gt; {ok, <a href="#type-erqueue">erqueue()</a>} | {error, term()}
</code></pre>

<br></br>



<a name="new-1"></a>

### new/1 ###


<pre><code>
new(Length::integer()) -&gt; {ok, <a href="#type-erqueue">erqueue()</a>} | {error, term()}
</code></pre>

<br></br>



<a name="put-2"></a>

### put/2 ###


<pre><code>
put(Ref::<a href="#type-erqueue">erqueue()</a>, Data::any()) -&gt; true
</code></pre>

<br></br>



