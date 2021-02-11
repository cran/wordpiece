## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example0-----------------------------------------------------------------
library(wordpiece)
# Get path to sample vocabulary included with package.
vocab_path <- system.file("extdata", "tiny_vocab.txt", package = "wordpiece")

# Load the vocabulary.
vocab <- load_or_retrieve_vocab(vocab_path, use_cache = FALSE)

# Take a peek at the vocabulary.
head(vocab)

## ----example1-----------------------------------------------------------------
# Now tokenize some text!
wordpiece_tokenize(text = "I love tacos, apples, and tea!", vocab = vocab)

## ----example2-----------------------------------------------------------------
# The above vocabulary was uncased.
attr(vocab, "is_cased")

# Here is the same vocabulary, but containing the capitalized token "Hi".
vocab_path2 <- system.file("extdata", "tiny_vocab_cased.txt", 
                           package = "wordpiece")
vocab_cased <- load_or_retrieve_vocab(vocab_path2, use_cache = FALSE)
head(vocab_cased)

# vocab_cased is inferred to be case-sensitive...
attr(vocab_cased, "is_cased")

# ... so the tokenization will *not* convert strings to lowercase, and so the
# words "I" and "And" are not found in the vocabulary (though "and" still is).
wordpiece_tokenize(text = "And I love tacos and salsa!", vocab = vocab_cased)

## ----example3-----------------------------------------------------------------

wordpiece_tokenize(text = "I love tacos!", 
                   vocab = vocab_cased, 
                   unk_token = "[missing]")

