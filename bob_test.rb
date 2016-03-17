require 'minitest/autorun'  # => true
require_relative 'bob'      # => true

class BobTest < Minitest::Test  # => Minitest::Test
  def bob
    ::Bob.new                   # => #<Bob:0x007fa38c95dff8>, #<Bob:0x007fa38c94d950>
  end                           # => :bob

  def feedback(text)
    "Bob hears #{text.inspect}, and.."  # => "Bob hears \"Tom-ay-to, tom-aaaah-to.\", and..", "Bob hears \"WATCH OUT!\", and.."
  end                                   # => :feedback

  def test_stating_something
    remark = 'Tom-ay-to, tom-aaaah-to.'                          # => "Tom-ay-to, tom-aaaah-to."
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)  # => true
  end                                                            # => :test_stating_something

  def test_shouting
    remark = 'WATCH OUT!'                                               # => "WATCH OUT!"
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_shouting

  def test_shouting_gibberish
    remark = ('A'..'Z').to_a.shuffle[0, 10].join
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_shouting_gibberish

  def test_asking_a_question
    remark = 'Does this cryogenic chamber make me look fat?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end                                                         # => :test_asking_a_question

  def test_asking_a_numeric_question
    remark = 'You are, what, like 15?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end                                                        # => :test_asking_a_numeric_question

  def test_asking_gibberish
    remark = ('a'..'z').to_a.shuffle[0, 10].join << '?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end                                                        # => :test_asking_gibberish

  def test_talking_forcefully
    remark = "Let's go make out behind the gym!"
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end                                                            # => :test_talking_forcefully

  def test_using_acronyms_in_regular_speech
    remark = "It's OK if you don't want to go to the DMV."
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end                                                            # => :test_using_acronyms_in_regular_speech

  def test_forceful_questions
    remark = 'WHAT THE HELL WERE YOU THINKING?'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_forceful_questions

  def test_shouting_numbers
    remark = '1, 2, 3 GO!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_shouting_numbers

  def test_only_numbers
    remark = '1, 2, 3'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end                                                            # => :test_only_numbers

  def test_question_with_only_numbers
    remark = '4?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end                                                        # => :test_question_with_only_numbers

  def test_shouting_with_special_characters
    remark = 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_shouting_with_special_characters

  def test_shouting_with_no_exclamation_mark
    remark = 'I HATE YOU'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end                                                                   # => :test_shouting_with_no_exclamation_mark

  def test_statement_containing_question_mark
    remark = 'Ending with ? means a question.'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end                                                            # => :test_statement_containing_question_mark

  def test_prattling_on
    remark = 'Wait! Hang on. Are you going to be OK?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end                                                        # => :test_prattling_on

  def test_silence
    remark = ''
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end                                                                     # => :test_silence

  def test_prolonged_silence
    remark = ' ' * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end                                                                     # => :test_prolonged_silence

  def test_alternate_silences
    remark = "\t" * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end                                                                     # => :test_alternate_silences

  def test_on_multiple_line_questions
    remark = %(Does this cryogenic chamber make me look fat? no)
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end                                                             # => :test_on_multiple_line_questions
end                                                               # => :test_on_multiple_line_questions

# >> Run options: --seed 15852
# >>
# >> # Running:
# >>
# >> SSSSSSS.SSSSSFSSSSSS
# >>
# >> Finished in 0.001666s, 12004.1607 runs/s, 1200.4161 assertions/s.
# >>
# >>   1) Failure:
# >> BobTest#test_shouting [/Users/mikewest/desktop/class/bob_test/bob_test.rb:20]:
# >> Bob hears "WATCH OUT!", and...
# >> Expected: "Whoa, chill out!"
# >>   Actual: "Whatever."
# >>
# >> 20 runs, 2 assertions, 1 failures, 0 errors, 18 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
