# nextstep

A simple tool to read a state machine definition from a file 
and execute the next step in it.

# Installation

Add the `nexstep.sh` file to your path.

# Usage
## Defining a state machine

Create a state file like this:

```
one=echo one
one_next=two

two=echo two
two_next=three

three=echo three && echo restarting
three_next=one
```

## Executing the next step
First, set your starting state in your working directory:

`echo one > nextstep.state`

Then, run `nextstep.sh` to execute the next step:

```
> nextstep <state file>
one
> nextstep <state file>
two
> nextstep <state file>
three
restarting
> nextstep <state file>
one
```