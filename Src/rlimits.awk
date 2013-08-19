# 
# $Id: rlimits.awk,v 3.1.0.1 1996/12/14 01:22:02 hzoli Exp $
#
# rlimits.awk: {g,n}awk script to generate rlimits.h
# rewritten by Peter Stephenson <pws@ifh.de> from Geoff Wing
# <mason@werple.apana.org.au>'s signames.awk
# NB: On SunOS 4.1.3 - user-functions don't work properly, also \" problems
# Without 0 + hacks some nawks compare numbers as strings
#
/^[\t ]*#[\t ]*define[\t _]*RLIMIT_[A-Z]*[\t ]*[0-9][0-9]*/ { 
    limindex = index($0, "RLIMIT_")
    limtail = substr($0, limindex, 80)
    split(limtail, tmp)
    limnam = substr(tmp[1], 8, 20)
    limnum = tmp[2]
    limrev[limnam] = limnum
    if (lim[limnum] == "") {
	lim[limnum] = limnam
	if (limnum ~ /^[0-9]*$/) {
	    if (limnam == "MEMLOCK") { msg[limnum] = "memorylocked" }
	    if (limnam == "RSS")     { msg[limnum] = "resident" }
	    if (limnam == "VMEM")    { msg[limnum] = "vmemorysize" }
	    if (limnam == "NOFILE")  { msg[limnum] = "descriptors" }
	    if (limnam == "CORE")    { msg[limnum] = "coredumpsize" }
	    if (limnam == "STACK")   { msg[limnum] = "stacksize" }
	    if (limnam == "DATA")    { msg[limnum] = "datasize" }
	    if (limnam == "FSIZE")   { msg[limnum] = "filesize" }
	    if (limnam == "CPU")     { msg[limnum] = "cputime" }
	    if (limnam == "NPROC")   { msg[limnum] = "maxproc" }
	    if (limnam == "AS")      { msg[limnum] = "addressspace" }
	    if (limnam == "TCACHE")  { msg[limnum] = "cachedthreads" }
        }
    }
}
/^[\t ]*#[\t ]*define[\t _]*RLIM_NLIMITS[\t ]*[0-9][0-9]*/ {
    limindex = index($0, "RLIM_")
    limtail = substr($0, limindex, 80)
    split(limtail, tmp)
    nlimits = tmp[2]
}

END {
    if (limrev["MEMLOCK"] != "") {
        irss = limrev["RSS"]
        msg[irss] = "memoryuse"
    }
    ps = "%s"

    printf("%s\n%s\n\n%s\n", "/** rlimits.h                                 **/", "/** architecture-customized limits for zsh **/", "static char *recs[RLIM_NLIMITS+1] = {")

    for (i = 0; i < 0 + nlimits; i++)
	if (msg[i] == "") {
            badlimit++
            printf("\t%c%s%c,\n", 034, lim[i], 034)
	} else
	    printf("\t%c%s%c,\n", 034, msg[i], 034)
    print "\tNULL"
    print "};"
    print ""
    exit(badlimit)
}
