# Method Parameters Lab

## Objectives

1. Define a method that takes in a parameter and uses that parameter in the method body. 
2. Define a method that takes in two parameters and uses both parameters in the method body. 

## Instructions

You'll be coding your methods in `lib/introduction.rb`. 

### The `#introduction` Method

Run the test suite to get started. To do that, run `rspec` in your terminal. Let's take a look at the first error:

```bash
Failures:

  1) #introduction takes in an argument of a name and puts out a phrase with that name using string interpolation
     Failure/Error: expect{introduction("Josh")}.to output("Hi, my name is Josh.\n").to_stdout
     NoMethodError:
       undefined method `introduction' for #<RSpec::ExampleGroups::Introduction:0x007fdbc499a938>
     # ./spec/introduction_spec.rb:5:in `block (3 levels) in <top (required)>'
     # ./spec/introduction_spec.rb:5:in `block (2 levels) in <top (required)>'
```

Wow, that's a lot of information. The important part for us though is the line that tells us *what kind of error* we are experiencing:

```bash
NoMethodError:
       undefined method `introduction`
```

Looks like our test is expecting to test a method called `#introduction`. Let's define that method in `lib/introduction.rb`.

```ruby
# lib/introduction.rb

def introduction
end
```

Now we'll run our test suite again. You should see the following error:

```bash
Failures:

  1) #introduction takes in an argument of a name and puts out a phrase with that name using string interpolation
     Failure/Error: expect{introduction("Josh")}.to output("Hi, my name is Josh.\n").to_stdout
     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./lib/introduction.rb:9:in `introduction'
     # ./spec/introduction_spec.rb:5:in `block (3 levels) in <top (required)>'
     # ./spec/introduction_spec.rb:5:in `block (2 levels) in <top (required)>'


```

Once again the important part of this error message is the part where the type of error is described:

```bash
ArgumentError:
       wrong number of arguments (1 for 0)
```

Now we have an ArgumentError. The test is trying to call our `#introduction` method with an argument (notice it says `1`) but we haven't defined our method to take in any arguments, the `for 0` part of the error message.

Let's fix that now:

```ruby
# lib/introduction.rb

def introduction(name)
end
```

Run the test again and you'll see the following:

```bash
Failures:

  1) #introduction takes in an argument of a name and puts out a phrase with that name using string interpolation
     Failure/Error: expect{introduction("Josh")}.to output("Hi, my name is Josh.\n").to_stdout
       expected block to output "Hi, my name is Josh.\n" to stdout, but output nothing
       Diff:
       @@ -1,2 +1 @@
       -Hi, my name is Josh.
       
     # ./spec/introduction_spec.rb:5:in `block (2 levels) in <top (required)>'

```

Now the important part of our error message is here:

```bash
expected block to output "Hi, my name is Josh.\n" to stdout, but output nothing
```

Behind the scenes, the test is calling this method with the argument `"Josh"` and expecting the output to be`"Hi, my name is Josh."`

At this point, you should be thinking "Oh, I need to use the parameter in the body of the method using string interpolation."  **BUT**, let's imagine you tried to fool the test by simply hard-coding this method to always greet Josh (no matter what argument was used). 

```ruby
# lib/introduction.rb

def introduction(name)
  puts "Hi, my name is Josh."
end
```

Just when you think you fooled `rspec`, it comes back with another test case:

```bash
Failures:

  1) #introduction takes in an argument of a name and puts out a phrase with that name using string interpolation
     Failure/Error: expect{introduction("Jill")}.to output("Hi, my name is Jill.\n").to_stdout
     
       expected block to output "Hi, my name is Jill.\n" to stdout, but output "Hi, my name is Josh.\n"
       Diff:
       @@ -1,2 +1,2 @@
       -Hi, my name is Jill.
       +Hi, my name is Josh.
       
     # ./spec/introduction_spec.rb:6:in `block (2 levels) in <top (required)>'
```

So, yes, your method works for the **Josh** test, but fails for the **Jill** test.  This is the art of well-written tests: covering multiple test cases.

So, since our test is expecting our method to `puts` out the exact phrase, using the value of the `name` argument that the method is called with, let's fix that:

```ruby
# lib/introduction.rb

def introduction(name)
  puts "Hi, my name is #{name}."
end
```

Run the test again and we should be passing the first of our two tests. Use the test output and the procedure we just followed to get the second test passing. 


### The `#introduction_with_language` Method

Define a method, `#introduction_with_language` that takes in two arguments, `name` and `language` and outputs the phrase: `"Hi, my name is _____ and I am learning to program in _____."`