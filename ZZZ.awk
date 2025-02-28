# ZZZ.awk - Word frequency table generator
# This script has two passes:
# PASS=1: Read the list of top words
# PASS=2: Count occurrences of these words in each paragraph of the text

BEGIN {
    # Make input split by paragraph
    RS=""
}

# First pass - read the top words file
PASS == 1 {
    # This will all come in one block, because it is one paragraph
    # so split that into the individual words and print that as the first row
    split($0, top, "\n")

    for (i in top) {
        printf "%s%s", top[i], ","
    }
    printf "\n"
}

# Second pass - process the cleaned text file
PASS == 2 {
    # Reset word counters
    for (i in top) {
        counts[i] = 0
    }

    split($0, words, " ")
    for (i in words) {
        for (j in top) {
            if (words[i] == top[j]) {
                counts[j] += 1
                break
            }
        }
    }

    for (i in counts) {
        printf "%s%s", counts[i], ","
    }
    printf "\n"
}
