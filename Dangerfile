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
  warn('コードの変更がありますが、テストの変更がありません。必要であればテストを追加・修正しましょう。')
end

# --------------------
# base branch
# --------------------
is_to_master = github.branch_for_base == 'master'
is_to_release = !!github.branch_for_base.match(/release-[0-9]+\.[0-9]+\.[0-9]/)
is_from_release = !!github.branch_for_head.match(/release-[0-9]+\.[0-9]+\.[0-9]/)

if is_to_master && !is_from_release
  warn('masterへmerge出来るのはrelease branchのみです。')
end

if is_to_release
  warn('release branchに対してPRを向けないで下さい。develop branchに向けてPRを作成し、develop branchをrelease branchにmergeしてください。')
end

# --------------------
# pr title
# --------------------
is_wip = github.pr_title.include? '[WIP]'

if is_wip
  warn('このPRは作業中です。')
end

is_to_develop = github.branch_for_base == 'develop'
is_start_with_issue_id = !!github.pr_title.match(/^#[0-9]+/)

if is_to_develop && !is_start_with_issue_id && !is_wip
  warn('PRのタイトルは<b>「#XXX Foo bar...」</b>とIssue idから始めてください。')
end

# --------------------
# diff size
# --------------------
is_big_pr = git.lines_of_code > 500

if is_big_pr
  warn('PRの変更量が多すぎます。可能であればPRを分割しましょう。分割が難しければ次から気をつけるようにしましょう。')
end
