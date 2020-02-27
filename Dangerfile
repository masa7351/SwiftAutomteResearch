# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
#declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
#warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
#warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
#fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
#fail("fit left in tests") if `grep -r fit specs/ `.length > 1
#
# --------------------
# test
# --------------------
is_source_changed = !git.modified_files.grep(/^mamariQ\/Classes/).empty?
is_test_changed = !git.modified_files.grep(/^mamariQTests\/Case/).empty?

if is_source_changed && !is_test_changed
  warn('$B%3!<%I$NJQ99$,$"$j$^$9$,!"%F%9%H$NJQ99$,$"$j$^$;$s!#I,MW$G$"$l$P%F%9%H$rDI2C!&=$@5$7$^$7$g$&!#(B')
end

# --------------------
# base branch
# --------------------
is_to_master = github.branch_for_base == 'master'
is_to_release = !!github.branch_for_base.match(/release-[0-9]+\.[0-9]+\.[0-9]/)
is_from_release = !!github.branch_for_head.match(/release-[0-9]+\.[0-9]+\.[0-9]/)

if is_to_master && !is_from_release
  warn('master$B$X(Bmerge$B=PMh$k$N$O(Brelease branch$B$N$_$G$9!#(B')
end

if is_to_release
  warn('release branch$B$KBP$7$F(BPR$B$r8~$1$J$$$G2<$5$$!#(Bdevelop branch$B$K8~$1$F(BPR$B$r:n@.$7!"(Bdevelop branch$B$r(Brelease branch$B$K(Bmerge$B$7$F$/$@$5$$!#(B')
end

# --------------------
# pr title
# --------------------
is_wip = github.pr_title.include? '[WIP]'

if is_wip
  warn('$B$3$N(BPR$B$O:n6HCf$G$9!#(B')
end

is_to_develop = github.branch_for_base == 'develop'
is_start_with_issue_id = !!github.pr_title.match(/^#[0-9]+/)

if is_to_develop && !is_start_with_issue_id && !is_wip
  warn('PR$B$N%?%$%H%k$O(B<b>$B!V(B#XXX Foo bar...$B!W(B</b>$B$H(BIssue id$B$+$i;O$a$F$/$@$5$$!#(B')
end

# --------------------
# diff size
# --------------------
is_big_pr = git.lines_of_code > 500

if is_big_pr
  warn('PR$B$NJQ99NL$,B?$9$.$^$9!#2DG=$G$"$l$P(BPR$B$rJ,3d$7$^$7$g$&!#J,3d$,Fq$7$1$l$P<!$+$i5$$r$D$1$k$h$&$K$7$^$7$g$&!#(B')
end
