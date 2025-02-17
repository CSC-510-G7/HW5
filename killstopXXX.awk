# killstopXXX.awk - Removes stop words from text
BEGIN {
    # Define a list of stop words
    stopwords["is"]; stopwords["the"]; stopwords["in"]; stopwords["but"];
    stopwords["can"]; stopwords["a"]; stopwords["that"]; stopwords["it"];
    stopwords["for"]; stopwords["on"]; stopwords["with"]; stopwords["as"];
    stopwords["this"]; stopwords["was"]; stopwords["at"]; stopwords["by"];
    stopwords["an"]; stopwords["be"]; stopwords["from"]; stopwords["or"];
    stopwords["are"]; stopwords["to"]; stopwords["of"];
}
{
    for (i = 1; i <= NF; i++) {
        if (!($i in stopwords)) {
            printf "%s ", $i;
        }
    }
    print ""; # Newline after each processed line
}
