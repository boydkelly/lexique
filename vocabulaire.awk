BEGIN { FS="\t" }
NR==1 {
    for (i=1; i<=NF; i++) {
        tags[i] = $i
    }
    next
}
{
    print "<lexique>"
    for (i=1; i<=NF; i++) {
        printf "    <%s>%s</%s>\n", tags[i], $i, tags[i]
    }
    print "</lexique>"
}
