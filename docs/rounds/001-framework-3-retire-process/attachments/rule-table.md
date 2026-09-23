# Rule table

Round 001-framework-3-retire-process. One row for every rule in the rule
sources named in the brief: `AGENTS.md`, `CLAUDE.md`, `docs/project-rules.md`,
the 2.x `.claude/agents/{brain,worker,verifier}.md`, `.claude/README.md`,
`.claude/settings.json`, `.claude/hooks/*`, `.codex/agents/*.toml`,
`.codex/hooks.json`, `.codex/hooks/*` and `.githooks/pre-push`. Line numbers are
at the tag commit (`archive/pre-redesign-2026-09-23`, read with
`git show <tag>:<path>`), and a rule that appears in several sources has one
row per source. A row's rule is a paraphrase of 20 words or fewer or a shorter
summary of a bullet, and a range of lines is the bullet or paragraph it sits in.
A hook's behaviours are rows of their own.

Dispositions: **kept** (where it now lives), **covered by the framework**
(which rule or role card), **deferred** (to round B, C, D or E, and which of
that round's items), **retired** (why). In `FRAMEWORK.md` the numbered rules
are the 14 under 'The rules'; the role cards are `docs/agents/roles/*.md`.

## AGENTS.md (old, at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `AGENTS.md:1-7` | This file wins on process; CLAUDE.md wins on project facts. | covered by the framework: Precedence section (AGENTS.md first); CLAUDE.md is now a pointer that adds no rules. |
| `AGENTS.md:9-15` | The project's framework release is recorded here, derived from the framework's VERSION and remote, never hand-typed. | covered by the framework: `docs/agents/framework.json` pins the release and `fw.py status` compares it with the latest. |
| `AGENTS.md:17-19` | Moving to another pinned release is an ordinary reviewed round, never applied mid-round or outside review. | covered by the framework: FRAMEWORK.md 'Framework releases' (an update is a Tier 2 round, never mid-round). |
| `AGENTS.md:21-27` | Project-specific rules (topology, invariants, evidence) stay here; long operating detail lives in `docs/project-rules.md`. | retired: `docs/project-rules.md` is retired (its rules have their own rows below); the new AGENTS.md holds what remains. |
| `AGENTS.md:31-32` | The owner is the final authority over direction and scope and keeps veto and reversal. | covered by the framework: rule 1 (Roles). |
| `AGENTS.md:34-36` | The full authority model, including owner-reserved actions, is in CONSTITUTION.md, stated once. | covered by the framework: FRAMEWORK.md 'Always the owner's decision' replaces CONSTITUTION.md, which is retired. |
| `AGENTS.md:40-41` | Brain merges reviewed work only on the owner's approval, given explicitly for each merge. | kept: AGENTS.md, `Merge rule: owner-approves` and the paragraph under it. |
| `AGENTS.md:43` | Brain still does the independent review and the 3-region gate before asking. | covered by the framework: Brain card 'Judging a round'; the gate is in AGENTS.md Evidence. |
| `AGENTS.md:45-50` | Never say 'self-merge' except for the prohibited act; Decomper, Scaffolder and Verifier never merge or accept their own work, in any circumstance; only Brain merges, after the owner's approval. | covered by the framework: rules 1 and 11, Worker card 'Never', Verifier card 'Never'. The wording rule about the phrase 'self-merge' is retired (wording guarding, owner decision 2 and the brief). |
| `AGENTS.md:52-56` | The owner's interface is conversation: ask, receive one paste-ready prompt, paste, report finished, approve one merge. | covered by the framework: rule 13 and FRAMEWORK.md 'The round' (three pastes). |
| `AGENTS.md:58-69` | Topology: Brain in the primary checkout; Decomper, Scaffolder and Verifier each in a nested `.worktrees/<role>`, one lane at a time. | retired: owner decision 4 (roles collapse to Brain, Worker, Verifier) and framework 3.0.0 (seats are not tied to a folder). AGENTS.md Roles now says Two seats never share a checkout. |
| `AGENTS.md:73` | Brain owns AGENTS.md, docs/state.md, docs/briefs/, docs/queue/, docs/project-rules.md; hands off src/, tools/, libs/, include/, symbols.txt, .github/. | retired: the per-role path-ownership table is retired by the brief; a Worker's scope is its brief. Brain not implementing is Brain card 'Never'. |
| `AGENTS.md:74` | Decomper owns src/, symbols.txt renames (never hand-edit arm9/config.yaml), assets/; hands off tools/, libs/, include/, AGENTS.md. | retired: path table retired (Decomper name retired). The symbols rule is kept: AGENTS.md Invariants 'Symbol files are preserved'. |
| `AGENTS.md:75` | Scaffolder owns tools/, libs/, include/, .github/; hands off src/, symbols.txt, AGENTS.md. | retired: path table retired (Scaffolder name retired). |
| `AGENTS.md:76` | Verifier owns no path, reviews an exact SHA independently in its own checkout, never writes source, never merges. | covered by the framework: rule 1 and the Verifier card; kept in AGENTS.md Roles. |
| `AGENTS.md:78-85` | .github/ moved to Scaffolder; CLAUDE.md, docs/agents/, docs/research/, tests/ are shared infrastructure travelling with the change they verify. | retired: path-ownership rules retired with the table. |
| `AGENTS.md:87-92` | Roles are contracts, not vendors: any capable tool may hold any seat; adapters may never restate policy. | kept: AGENTS.md Roles ('Any capable tool may hold any seat'); adapters only point is covered by the framework Precedence section. |
| `AGENTS.md:94-96` | Adding or retiring a role is a strategic decision and goes to the owner; a provider never creates a lane. | kept: AGENTS.md Roles ('Adding or retiring a role is the owner's decision'). |
| `AGENTS.md:100-103` | The live branch namespaces are exactly the role prefixes decomper/, scaffolder/, brain/; no custom declaration or witness file is needed. | retired: the namespace scan and its witness files are gone; branches are `brain/<round-id>` and `worker/<round-id>` (AGENTS.md Roles, `fw.py start`). |
| `AGENTS.md:105-109` | Historical provider-named branches and archive tags are history, not policy. | retired: no scan exists to need the exemption; the archive tags stay as they are (not changed by this round). |
| `AGENTS.md:111-113` | `progress-visuals` is a CI-owned branch that the badge bot commits generated assets to. | kept: AGENTS.md Working rules ('progress-visuals is a CI-owned branch... never commit to it by hand'). |
| `AGENTS.md:117-118` | Every matched function stays matched; never turn a 100%-matched function back into a diff. | kept: AGENTS.md Invariants. |
| `AGENTS.md:119-121` | The 3-region SHA-1 round trip stays byte-identical; `ninja sha1` PASS in all three is the correctness proof. | kept: AGENTS.md Invariants. |
| `AGENTS.md:122-124` | Symbol files are preserved; symbols.txt is the durable record; never silently drop or corrupt entries. | kept: AGENTS.md Invariants. |
| `AGENTS.md:125-126` | ROMs are never committed; *.nds, BIOS dumps, extract/, build/ and downloaded tools stay gitignored. | kept: AGENTS.md Invariants. |
| `AGENTS.md:130-132` | Agent reports are evidence, not ground truth; the standard is in evidence.md. | covered by the framework: rules 7 and 10; evidence.md is retired. |
| `AGENTS.md:136` | Build-path change: `gate3.py --scope all` PASS is the merge gate (clean rebuild of all three regions, byte-identical, then full pytest as a hard gate). | kept: AGENTS.md Evidence, first row, with the log-quoting form and the exit-status warning. |
| `AGENTS.md:137` | tools/ or docs/ only: `pytest -q tests` and `unittest discover -s tests` both green. | kept: AGENTS.md Evidence, with `ruff check .` added because CI requires it. |
| `AGENTS.md:138` | Symbol renames: the build-path row plus the output of `rename_symbol.py --cascade` showing every region. | kept: AGENTS.md Evidence. |
| `AGENTS.md:140-141` | CI is the backstop, not the primary evidence. | kept: AGENTS.md Evidence. |
| `AGENTS.md:145-147` | One coherent task at a time; if the real fix is bigger than the brief, stop and report. | covered by the framework: Worker card 'Work' and 'Never' (expand scope). |
| `AGENTS.md:148` | One branch per task, named `<role>/<kebab-scope>`. | kept, changed: `worker/<round-id>` and `brain/<round-id>` (AGENTS.md Roles); `fw.py start` creates them. |
| `AGENTS.md:149-152` | Separate checkouts for concurrently-active roles; re-check branch and status at the start of every discrete task. | kept: AGENTS.md Roles ('Two seats never share a checkout'). The re-check is covered by `fw.py start` and `fw.py status`. |
| `AGENTS.md:153-154` | Protect unrelated work: stash or branch; do not clobber. | covered by the framework: rule 12. |
| `AGENTS.md:155` | Never push to the default branch. | covered by the framework: rule 12 and Worker card 'Work'. |
| `AGENTS.md:156` | Focused commits, not one giant commit. | covered by the framework: Worker card 'Work'. |
| `AGENTS.md:157` | Repository and source state outrank agent narrative. | covered by the framework: rule 10. |
| `AGENTS.md:158-159` | Exact-SHA verification: check a claim at the literal SHA, not the branch generally. | covered by the framework: rule 8. |
| `AGENTS.md:160` | Fix the defect class, not the first example. | kept: AGENTS.md Working rules. |
| `AGENTS.md:161-162` | State handoff: durable facts go in docs/state.md, kept short, never only in chat. | covered by the framework: rules 2 and 3 and the State section (budget checked by `fw.py check`). |
| `AGENTS.md:170-172` | Server side: the `main-protection` ruleset requires a PR, blocks deletion and force pushes, requires five checks; `required_approving_review_count` is 0. | kept: AGENTS.md 'What is actually enforced', re-read live on 2026-09-23 (evidence 9 of the brief). |
| `AGENTS.md:173` | Repository-admin bypass defeats the guarantee: the only collaborator holds admin with bypass `always`, and every agent uses that account. | kept: AGENTS.md 'What is actually enforced', re-read live. |
| `AGENTS.md:174` | .githooks/pre-push is local convenience: opt-in per clone, bypassable with --no-verify. | retired: the hook is removed this round; AGENTS.md says there are no local hooks and that round C writes new settings. |
| `AGENTS.md:176-180` | Executors never merging and Brain waiting for the owner are contract properties, not enforced by GitHub; do not describe them as server-enforced. | kept: AGENTS.md 'What is actually enforced', last paragraph before the framework-status note. |
| `AGENTS.md:184-188` | The .claude adapter covers launch mechanics only and never restates authority, roles, queue, branches or gates; where it and AGENTS.md disagree AGENTS.md wins. | covered by the framework: Precedence section (tool-specific files only point at AGENTS.md). |
| `AGENTS.md:188-191` | Decomper and Scaffolder launch on the generic worker seat; `.codex/agents/*.toml` point at the same seats. | retired: names retired (owner decision 4); `.codex/` removed. |
| `AGENTS.md:195-201` | The round: Brain rehydrates, writes one brief from the docs/queue backlog, hands a paste-ready prompt, inspects the exact SHA, reproduces the gate, merges after the owner approves. | covered by the framework: FRAMEWORK.md 'The round'; the docs/queue backlog is retired (owner decision 2). |
| `AGENTS.md:205-230` | Where to look: pointers to CONSTITUTION, roles, lifecycle, kickoff, evidence, git-and-isolation, reports, adapters, project-rules, state.md, briefs, queue, CLAUDE.md. | kept, rewritten: AGENTS.md 'Where to look'; every retired target is removed from it. |

## CLAUDE.md (old, at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `CLAUDE.md:3-4` | Goal: a byte-identical ROM rebuilt from C source, verified via SHA-1. | kept: AGENTS.md 'What this project is'. |
| `CLAUDE.md:6-10` | The three regions (usa AYXE, eur AYXP, jpn AYXJ) and their baserom paths `orig/baserom_<version>.nds`. | kept: AGENTS.md 'What this project is' and BUILD.md intro. |
| `CLAUDE.md:12-13` | The version is a positional argument to configure.py; all three may coexist; pick one per run. | kept: BUILD.md Quick start. |
| `CLAUDE.md:19` | mwccarm 2.0/sp1p5 is the default (decomp.me id mwcc_30_131); adjust if objdiff says so after the first matching attempt. | kept: BUILD.md Toolchain table. The 'adjust after the first attempt' clause is retired: the compiler tiers below settled it. |
| `CLAUDE.md:20` | mwccarm 1.2/sp2p3 is the per-TU compiler for Style A epilogue files (`*.legacy.c`). | kept: BUILD.md Toolchain table. |
| `CLAUDE.md:21` | mwccarm 1.2/sp3 is the per-TU compiler for the `sub sp, #4` / Style B epilogue tier (`*.legacy_sp3.c`). | kept: BUILD.md Toolchain table. |
| `CLAUDE.md:22-27` | mwldarm, dsd v0.11.0, objdiff-cli v2.7.1, ninja, Python 3.11+ and wibo 0.6.16 are the pinned toolchain. | kept: BUILD.md Toolchain table (existing rows; dsd, objdiff, wibo unchanged). |
| `CLAUDE.md:29-30` | Everything except ninja, Python and the baserom is downloaded by download_tool.py the first time ninja runs. | kept: BUILD.md 'Per-OS prerequisites'. |
| `CLAUDE.md:35-36` | Put a clean dump at orig/baserom_<version>.nds; never ship ROMs. | kept: AGENTS.md Invariants and BUILD.md intro. |
| `CLAUDE.md:39-45` | Quick start: install Python deps, `configure.py <region>` (verifies the SHA-1), `ninja sha1`. | kept: BUILD.md Quick start (unchanged). |
| `CLAUDE.md:48-49` | If the baserom SHA-1 is wrong or unset, configure.py fails loudly; do not bypass the check. | kept: AGENTS.md Invariants ('The baserom SHA-1 check is never bypassed') and BUILD.md. |
| `CLAUDE.md:53-67` | Matching workflow: edit, `ninja`, `ninja objdiff`, `ninja report`, `progress.py`, `ninja check`, `ninja sha1`. | kept: BUILD.md 'Matching workflow' (`ninja check` line added). |
| `CLAUDE.md:69-77` | A function is matched when objdiff shows it identical to the dsd-delinked `.o`; pick from symbols.txt, write C, iterate to 100%, rename the symbol. | kept: BUILD.md 'Matching workflow'. |
| `CLAUDE.md:79-80` | `ninja sha1` is the only test that matters at the project level. | kept: AGENTS.md Invariants. |
| `CLAUDE.md:84-85` | Language default is C; a `.cpp` file opts in to C++ and configure.py passes -lang=c++. | kept: BUILD.md Conventions and AGENTS.md Working rules. |
| `CLAUDE.md:86-93` | Source layout: src/ mirrors the overlay structure, libs/ holds SDK code with its own include/, include/ holds shared headers. | kept: BUILD.md Conventions and Project layout. |
| `CLAUDE.md:94-96` | Rename symbols in config/<ver>/**/symbols.txt with convention `ModuleName_FunctionName`; never hand-edit arm9/config.yaml. | kept: AGENTS.md Invariants and BUILD.md Conventions. |
| `CLAUDE.md:97-99` | Scratches: `ninja build/<ver>/path/file.ctx.c` produces a preprocessed context for decomp.me. | kept: BUILD.md Conventions. |
| `CLAUDE.md:100-101` | Do not commit ROMs, BIOS dumps, extract/, build/ or downloaded tools. | kept: AGENTS.md Invariants and BUILD.md Conventions. |
| `CLAUDE.md:105-108` | Placeholder 1: baserom SHA-1 for usa and jpn (now all hashed). | retired: resolved status note, not a rule. |
| `CLAUDE.md:109-112` | Placeholder 2: revisit the mwcc SP revision after the first objdiff attempt. | retired: settled by the per-TU compiler tiers (BUILD.md Toolchain). |
| `CLAUDE.md:113-115` | Placeholder 3: overlay count and NitroSDK version are unknown until dsd init completes. | retired: resolved status note. |
| `CLAUDE.md:116-118` | Placeholder 4: adjust progress.py's parser if ds-decomp's schema differs. | retired: resolved; progress.py is a kept, tested tool. |
| `CLAUDE.md:122-130` | dsd init is not in the ninja graph; run once per region by hand; a stock run fails on the overlay 0 and 2 base collision, and the hidden flag `--allow-unknown-function-calls` bypasses it. | kept, shortened: BUILD.md 'Bootstrapping config/<ver>/'. |
| `CLAUDE.md:140-142` | Run the init after `ninja extract/<ver>/config.yaml` and before anything else; upstream issue ds-decomp#58. | kept, shortened: BUILD.md (the output is committed under config/<ver>/, so a fresh clone does not repeat it; the upstream issue is linked). |
| `CLAUDE.md:146-150` | Byte-identical rebuild achieved for all three regions; all 27 modules times 3 regions check green. | kept: BUILD.md 'Round-trip status'. |
| `CLAUDE.md:152-155` | Re-verified 2026-06-01: for each region, configure, remove the ROM and objdiff.json, `ninja sha1` exits 0. | retired: a dated verification; the gate re-checks it and AGENTS.md Evidence requires the log. |
| `CLAUDE.md:157-173` | Three build-chain fixes closed the bytes outside dsd's coverage: the .DS_Store filter, the ov004 veneer patch and the ROM-header CRC patcher. | kept, shortened: BUILD.md 'Round-trip status'. |
| `CLAUDE.md:175-177` | The 2-byte USA/JPN main displacement has closed too; all three regions match. | kept: BUILD.md 'Round-trip status' (the three-region statement). |
| `CLAUDE.md:179-183` | configure.py filters per-region source trees: src/<region>/ is region-specific, src/<module>/ is the EUR baseline, libs/ is region-neutral. | kept: BUILD.md Conventions and AGENTS.md Working rules. |
| `CLAUDE.md:187-203` | macOS: install GPTK and Rosetta 2; configure.py picks wine from PATH; WINEPREFIX defaults to <worktree>/.wine-lane and can be overridden; the link step serializes. | kept: BUILD.md 'Platform notes' and `docs/machine-setup.md` step 4. |
| `CLAUDE.md:204-205` | Linux: wibo runs the Win32 compiler; Windows: mwccarm.exe and mwldarm.exe run natively. | kept: BUILD.md 'Platform notes' and 'Per-OS prerequisites'. |
| `CLAUDE.md:206-207` | get_platform.py was patched 2026-04-20 to return Darwin as macos and arm64 as arm64. | retired: a history note about a template patch. |
| `CLAUDE.md:211-224` | Reference projects: dqix is the template (baserom at orig/, SHA-1 at configure time, C default); SonicRushAdventure-Decomp is reference only. | kept: BUILD.md 'Reference projects'. |

## docs/project-rules.md (old, at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `project-rules.md:3-8` | If anything here appears to authorize a different merge path, branch namespace or provider-bound role, AGENTS.md and CONSTITUTION win: say so and stop. | covered by the framework: Precedence section and Worker card Start step 3 (conflict: stop and explain). |
| `project-rules.md:20-24` | Scaffolder may open unbriefed: new scripts in tools/, analyzer improvements, CI changes, PR reviews, docs restructuring. | retired: the Scaffolder lane and unbriefed autonomous work are retired (owner decision 4); a Worker's scope is its brief. |
| `project-rules.md:23-25` | Anything under libs/nitro/ or libs/runtime/ requires a brief first. | covered by the framework: every Worker change needs a brief (Worker card 'Never' expand scope). |
| `project-rules.md:26-29` | When unsure, open the PR with a 'Brain please confirm scope' flag and do not request merge; Brain does not merge without the owner's approval. | covered by the framework: Worker card (stop and report; never merge) and the merge rule. |
| `project-rules.md:33-38` | The verify controls are paste-the-output requirements, not rules to remember; 3-region ninja sha1 PASS is the floor. | covered by the framework: rule 7 (Verified means shown) and AGENTS.md Evidence. |
| `project-rules.md:40-44` | Control 1: a PR's PASS line must paste the literal terminal tail from this session of the reconfigure command, all three ninja sha1 lines and check_match_invariants plus the test exit. | kept, changed: AGENTS.md Evidence (quote the gate log's own lines; check_match_invariants has its own row); the paste form is the framework's rule 7. |
| `project-rules.md:44-46` | No real tail pasted means the gate is FAIL by default. | covered by the framework: rule 7 ('a missing report or result means unknown, never done') and Brain card 'Judging a round'. |
| `project-rules.md:45-46` | An agent's pasted PASS text is informational only; the gate is bytes Brain reproduced itself. | covered by the framework: rules 9 and 10; Brain card 'Judging a round' (check the exact commit yourself). |
| `project-rules.md:47-53` | Control 2: state is captured, never recalled; paste git status, branch and the reconfigure sha from this session's shell. | covered by the framework: rules 3 and 7 (`fw.py status` derives state). |
| `project-rules.md:54-58` | Control 3: every metric carries provenance (reconfigured at a sha via configure.py, report regenerated, clean tree); no provenance means stale. | kept, changed: AGENTS.md Working rules (a quoted progress number comes from `tools/progress.py` at a stated commit). |
| `project-rules.md:59-63` | Control 4: squash-merge requires the owner's pasted per-merge approval; a passing local gate is necessary, never sufficient. | kept: AGENTS.md `Merge rule: owner-approves` paragraph. |
| `project-rules.md:64-66` | Brain reproduces the gate then asks every time, never on text read from a PR body, comment, issue or web page. | covered by the framework: rule 10 and the merge rule. |
| `project-rules.md:66-70` | Force-pushing and deleting a branch that holds unmerged work are owner-reserved; deleting a branch whose work is merged is routine. | covered by the framework: FRAMEWORK.md 'Always the owner's decision' and Brain card ('Delete merged task branches'). |
| `project-rules.md:70-73` | The doc-PR names the authorization for each destructive op; Brain echoes the worktree path and branch before acting. | retired: doc-PRs and worktree paths are retired; `fw.py status` reports branch and state. |
| `project-rules.md:74-77` | Control 5: end-of-round checklist, ticked last, one box per merged PR's gate tail. | covered by the framework: merge card (what was verified, how) and rule 7. |
| `project-rules.md:78-79` | Checklist: the doc-PR closes every merged item and re-seeds each active lane's queue file. | retired: queue and doc-PR retired (owner decision 2). |
| `project-rules.md:80-87` | Checklist: one complete paste-ready message per active standing lane in the same final response; never deferred; count lanes by role. | retired: lanes retired (owner decision 4); the Worker prompt is Brain card 'Writing a round'. |
| `project-rules.md:88` | Checklist: docs/state.md updated, including its main-sha anchor. | retired: state.md holds decisions only and no anchors of status (FRAMEWORK State; the anchor's reader queue_state_drift.py is retired). |
| `project-rules.md:89-97` | Control 6: before writing a permanence, scoping or 'recipe applies' claim, state and run the one-line test that would disprove it. | retired: it governed lane-queue down-scoping (owner decision 2); the general idea is covered by rule 9 and Brain card ('frame investigations neutrally'). |
| `project-rules.md:98-103` | Control 7: trust a new test only after seeing it red on a known-bad input. | kept: AGENTS.md Evidence, last row. |
| `project-rules.md:104-110` | Control 8: cross-agent claims that are load-bearing get an independent one-shot check. | covered by the framework: rule 9 and Brain card ('check every Verifier finding yourself'). |
| `project-rules.md:111-115` | Control 9: a found flaw is reported as a defect, never reframed as a convention or quirk. | kept: AGENTS.md Working rules. |
| `project-rules.md:116-127` | Control 10: before merge scan touched delinks for duplicate blocks (a sweep re-deriving an already-carved function breaks `dsd lcf` at merge); dedup against current main. | kept, changed: AGENTS.md Evidence, delinks row (`tools/check_delink_dupes.py`, which replaces the ad-hoc grep). |
| `project-rules.md:128-136` | Control 11a: avoid queuing two same-tool briefs in one round; reconcile shared-tool conflicts at the integration tree; asm_escape.py is not a build input. | retired: concurrent lanes are retired. The asm_escape fact (not a build input) stays true and is visible in `docs/tools-index.md`; tools cut is round B. |
| `project-rules.md:137-143` | Control 11b: a gate at 0 objects built and 0% CPU for minutes is hung on a stale wineserver; `pkill -9 wineserver` and relaunch with default parallelism. | kept: AGENTS.md Working rules. |
| `project-rules.md:144-157` | Control 12 preamble and order: runs first; enumerate every dispatched lane on any harness; read the worker's final message and enough transcript; reconcile against the branch, PR, diff; never infer an outcome from title, branch state or absence of commits. | covered by the framework: reports are committed files (rules 2, 5, 6) and rule 7 ('a missing report means unknown'); Brain card 'Judging a round'. Transcript reading is retired. |
| `project-rules.md:158` | Read all dispatched lanes, not only ones that look failed. | covered by the framework: `fw.py delivery` and Brain card ('read the reports'). |
| `project-rules.md:159-167` | The transcript mechanism is a per-vendor adapter; a lane satisfies it with its pasted final report; known adapters Claude session tooling and Codex rollout files. | retired: the report is now a committed file (`fw.py report`), so no adapter is needed. |
| `project-rules.md:168-170` | If a session cannot be found or read, say so explicitly; never silently infer. | covered by the framework: rule 7 (unknown is unknown). |
| `project-rules.md:171-185` | If the harness transcript is unreachable, declare the audit unavailable every round and run four compensating controls: re-derive numeric claims, mutation-test new suites, verify one claim against primary sources, try to reproduce a headline measurement. | covered by the framework: rule 9 and Brain card 'Judging a round' (re-derive a load-bearing claim; check whether new tests could fail). |
| `project-rules.md:186-189` | Worker messages are evidence, not ground truth; repository state and gates remain authoritative. | covered by the framework: rule 10. |
| `project-rules.md:190-191` | Read visible messages, tool output and reported conclusions only; do not read or reproduce hidden chain-of-thought. | retired: transcripts are no longer read; reports are the evidence. |
| `project-rules.md:192-195` | Record a compact transcript audit per lane in the review summary. | retired: replaced by the committed reports and the merge card. |
| `project-rules.md:199-207` | Since brief 180 briefs are inline in the kickoff message; every kickoff is self-contained (role, worktree, branch, reading, five-bullet brief, closer). | covered by the framework: briefs are `docs/rounds/<id>/brief.md`; the prompt shape is Brain card 'Writing a round'. |
| `project-rules.md:209-224` | Provider mechanics live only in an optional adapter block, never the core kickoff; it may add launch mechanics and must never redefine role, authority, queue, branch or gate. | covered by the framework: Precedence section (tool-specific files only point at AGENTS.md). |
| `project-rules.md:218-219` | Claude Code only: tell the receiving session to fully exit its previous session, since settings are read once per session. | retired: it existed because of the hooks, which are retired; round C's new settings will need the same note. |
| `project-rules.md:221-222` | Codex CLI only: the combined-instructions budget is about 32 KB; keep the brief inside it. | retired: Codex seats removed; `docs/agents/FRAMEWORK.md` and the role cards are far shorter. |
| `project-rules.md:224` | If the receiving tool is unknown, send the core kickoff with no adapter. | covered by the framework: Brain card prompt template is tool-neutral. |
| `project-rules.md:228-233` | Success is the artifact, not the proxy: name the functions and require 3-region PASS plus the objdiff 100% line, never 'raises complete_units by N'; do not pick functions by what maximizes the metric. | kept: AGENTS.md Working rules, first bullet. |
| `project-rules.md:233` | Take the assigned cohort in order and report failures as P-N candidates. | retired: the P-N wall catalogue belongs to the research corpus (round B) and the attempts ledger records parks; 'in order' is dropped with the lane queue. |
| `project-rules.md:234-241` | Ask each lane, neutrally, to summarize what it did including what did not land; never relabel a wall or fabricate a pass. | covered by the framework: Worker card report sections 'Not verified' and 'Open questions' and 'Never present something unchecked as verified'. |
| `project-rules.md:245-250` | Run the ship step: your last actions are git add, commit, push, `gh pr create`, reply with the PR URL; Brain checks git status on every 'done'. | covered by the framework: rule 6 (report on every exit, `fw.py report --push`) and Brain card ('fw.py delivery'); the PR is opened by Brain under the merge rule. |
| `project-rules.md:251-256` | Decomper kickoffs: hoist mid-block declarations before each compile, call the divmod helper explicitly, and keep a never-overwritten base_n.c of the closest partial match. | deferred: round E (the factory's matching loop and its prompt); these are matching techniques, not process rules. |
| `project-rules.md:257-259` | Each kickoff names an explicit STOP condition (target count or N consecutive walls). | covered by the framework: Brain card brief template ('Acceptance criteria'); the factory's stop rules are round E. |
| `project-rules.md:263-265` | Agent-facing commands use plain `python`, the Windows interpreter; on Mac use `python3.13`. | kept: AGENTS.md Working rules. |
| `project-rules.md:267-271` | Each of decomper, scaffolder and verifier needs all three baseroms linked into its own orig/ with tools/link_baseroms.py to run the gate. | kept: AGENTS.md Working rules (a checkout needs all three baseroms) and `docs/machine-setup.md` step 2. |

## .claude/agents/{brain,worker,verifier}.md (the 2.x versions, at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `brain.md:8-13` | Read the role contract docs/agents/roles/brain.md in full, then AGENTS.md and the project specification it names. | covered by the framework: the 3.0.0 `.claude/agents/brain.md` (installed by the adopter) and Brain card 'Every session'. |
| `brain.md:17-20` | This seat is normally the primary interactive session; the frontmatter lets it be dispatched for a narrow planning sub-task. | retired: the installed 3.0.0 seat file is a bare pointer and says nothing about it; any tool may hold any seat (FRAMEWORK.md 'Moving between machines and tools'). |
| `brain.md:21` | Work from the primary checkout; other concurrently active seats have their own. | kept: AGENTS.md Roles ('Two seats never share a checkout'). |
| `brain.md:22` | `/status` runs the contract's rehydration sequence. | covered by the framework: the installed 3.0.0 `.claude/commands/status.md`. |
| `brain.md:23` | No model is pinned; the seat inherits what was launched. | retired: a fact, not a rule; the 3.0.0 seat file pins no model and does not mention it. |
| `brain.md:24-25` | The shared inbox may hold other seats' reports, but a missing or stale file means unknown. | retired: the inbox is retired (owner decision 2); reports are committed files and unknown is unknown (rule 7). |
| `worker.md:8-13` | Read the worker contract in full, then AGENTS.md and your brief. | covered by the framework: the installed 3.0.0 worker.md pointer and Worker card 'Start'. |
| `worker.md:17-19` | Run in this seat's own checkout, never the coordinating session's; sharing a directory stacks unrelated commits. | kept: AGENTS.md Roles ('Two seats never share a checkout'). |
| `worker.md:20-22` | Start from the brief and contract in fresh context; a session carrying earlier context is no longer independent. | kept: AGENTS.md Roles (the Worker row). The 3.0.0 worker card does not state it, so it is kept here. |
| `worker.md:23-25` | No model is pinned; specialist executor names all use this same file, the specialism being the scope in AGENTS.md. | retired: specialist names are retired (owner decision 4) and the 3.0.0 seat file does not mention a model. |
| `verifier.md:9-14` | Read the verifier contract in full, then AGENTS.md. | covered by the framework: installed 3.0.0 verifier.md and Verifier card 'Start'. |
| `verifier.md:18` | Work in this seat's own checkout, detached at the exact head SHA under review. | covered by the framework: `fw.py start --role verifier` puts the seat at the reviewed commit (Verifier card 'Start'). |
| `verifier.md:19-24` | The `tools:` frontmatter applies only when loaded as a dispatched subagent; otherwise read-only discipline is the role's own; Bash is listed because reproducing evidence is the job. | covered by the framework: Verifier card 'Never' (write nothing except your report). The 3.0.0 seat file has no `tools:` line. |
| `verifier.md:25-27` | This seat is most likely on a different tool, so its contract must be self-contained; nothing depends on the adapter. | covered by the framework: FRAMEWORK.md 'Moving between machines and tools'. |

## .claude/README.md (at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `.claude/README.md:3-8` | A link in an installed document is a claim about what the project has; only installed documents may be linked. | retired: it described the framework repository's adapter conventions; the file is removed and the 3.0.0 adapter installs its own pointers. |
| `.claude/README.md:10-13` | This is an example adapter; nothing in the framework depends on it; a project with no adapter works via the universal launch procedure. | covered by the framework: adapters only point (FRAMEWORK.md Precedence). |
| `.claude/README.md:15-26` | Install with `--adapter claude-code`; its destination `.claude/` is declared in adapter.json, not derived from its name. | retired: an installation note for the framework's adopter, not a project rule. |
| `.claude/README.md:32-38` | The adapter installs exactly three seat files, one command, run_python.sh, save_agent_reply.py and settings.json. | kept, changed: the 3.0.0 adapter installs the seat files and /status; the hook files and settings are retired (owner decision 2, brief). |
| `.claude/README.md:40-56` | A specialist executor shares the generic worker seat; no per-name seat file is generated. | retired: specialist names retired (owner decision 4). |
| `.claude/README.md:58-62` | The adapter provides no authority statement, role definitions, branch convention, queue or gate; a test enforces it. | covered by the framework: Precedence section; the enforcing test is retired with the old adapter tests. |
| `.claude/README.md:64-72` | The inbox is not load-bearing; a missing or stale file means unknown, never that the task did not happen. | covered by the framework: rule 7; the inbox is retired. |
| `.claude/README.md:74-106` | settings.json invokes run_python.sh with the script as an argument; the wrapper tries python3, `py -3`, python for real, never one hardcoded name. | retired: the hooks and wrapper are removed; round C's new settings will need a portable interpreter rule (deferred: round C, Claude Code and Codex settings). |
| `.claude/README.md:108-123` | Three kinds of evidence (a report found, nothing in the inbox, a fresh health file) must not be conflated; a health file means the adapter is misconfigured. | retired: the inbox and health file are removed with the hooks. |

## .claude/settings.json (at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `.claude/settings.json:3` | Keep the settings in sync with docs/decomp-workflow.md 'Local setup extras'; the Stop hook is a convenience, not a control, and its absence means unknown. | retired: the settings file is deleted; the 'Local setup extras' section is removed from decomp-workflow.md; unknown is unknown is rule 7. |
| `.claude/settings.json:5-15` | PostToolUse on Edit, Write or MultiEdit runs `.claude/hooks/post_edit.py` through run_python.sh. | retired: owner decision (retire hooks); the behaviour is in the post_edit.py rows below. New settings are deferred to round C. |
| `.claude/settings.json:16-26` | PreToolUse on Bash runs `.claude/hooks/pre_bash.py` through run_python.sh. | retired: see the pre_bash.py rows below; deferred to round C. |
| `.claude/settings.json:27-37` | Stop runs `.claude/hooks/save_agent_reply.py` through run_python.sh. | retired: the Stop hook is retired by framework 3.0.0 (reports are committed by the seat itself). |

## .claude/hooks/* (at the tag commit; the .codex/hooks copies are byte-identical for post_edit.py and pre_bash.py)

| Source | Rule | Disposition |
|---|---|---|
| `post_edit.py:8-11` | After an edit to a Python file under tools/ or tests/, run `ruff check` on it and show errors (non-blocking). | kept, changed: AGENTS.md Evidence ('ruff check .' clean); the in-loop hook is retired and round C decides new settings. |
| `post_edit.py:13-16` | After an edit under tools/ or tests/, run the full unittest suite and surface failures (non-blocking). | kept, changed: AGENTS.md Evidence (unittest and pytest green); the in-loop hook is retired. |
| `post_edit.py:17-27` | After an edit to a game source file (src/**/*.c, .cpp, .s), run a per-TU ninja compile and a one-unit objdiff to report the match percentage; silently skip when unconfigured or the wrong region. | deferred: round E (the factory's matching loop needs in-loop match feedback); the hook itself is retired. |
| `post_edit.py:29-30` | Stay silent on non-Python, non-game-source edits. | retired with the hook. |
| `post_edit.py:71-76` | Hard timeouts (8 s compile, 5 s objdiff) so the hook can never block an edit. | deferred: round E, with the in-loop feedback above. |
| `pre_bash.py:6-9` | Before a Bash `git push`, run `tools/check_match_invariants.py --version eur` and block the push if it reports errors. | kept, changed: AGENTS.md Evidence (`check_match_invariants.py --version eur` reports no errors for src/ or config/ changes); the blocking is deferred to round C (settings). |
| `pre_bash.py:22-23` | Bypass once with SKIP_INVARIANTS_HOOK=1 or by removing the hook. | retired with the hook. |
| `pre_bash.py:41-43` | Do not match `git push --no-verify`; if the user went out of their way to bypass hooks, do not second-guess. | retired with the hook. |
| `pre_bash.py:106-108` | Block only on errors (exit code 2); warnings and the ~300 placeholder warnings pass. | kept: AGENTS.md Evidence ('exit 2 means errors'). |
| `pre_bash.py:60-75` | Filter the complete_tu_rename backlog section out of the shown output. | retired with the hook. |
| `run_python.sh:39-42` | With no script argument, print a message and exit 0. | retired with the hook. |
| `run_python.sh:44-57` | Try python3, then `py -3`, then python, each for real, so a name that resolves to a non-Python-3 falls through. | deferred: round C (new Claude Code and Codex settings need a portable interpreter). |
| `run_python.sh:59-67` | If none completes, append a health note to the inbox. | retired: the inbox is retired. |
| `run_python.sh:36-37` | Every path ends in exit 0: a session must never fail to end over the hook. | retired with the hook. |
| `save_agent_reply.py:1-16` | Mirror a session's final reply to the shared inbox through tools/report.py. | retired: framework 3.0.0 retires the Stop hook; the seat commits its own report with `fw.py report`. |
| `save_agent_reply.py:18-29` | It fires only on this tool; a missing or stale file means unknown, never that the task did not happen. | covered by the framework: rule 7. |
| `save_agent_reply.py:31-40` | Tag the report by session id, and never overwrite a report the agent wrote itself at the current head. | retired with the hook. |
| `save_agent_reply.py:45-51` | Non-blocking: any error exits 0, including a missing tools/report.py. | retired with the hook. |

## .codex/agents/{brain,decomper,scaffolder}.toml, .codex/hooks.json, .codex/hooks/* (at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `brain.toml:5-8` | Read the role contract in full and follow it; this file does not restate it. | covered by the framework: role cards and the installed seat files; Codex seats retired (the brief). |
| `brain.toml:10-11` | Then read AGENTS.md and the project specification it names (CLAUDE.md). | covered by the framework: Brain card 'Every session'. |
| `brain.toml:15-17` | Work from the primary checkout, per git-and-isolation.md. | retired: git-and-isolation.md is retired; AGENTS.md Roles ('Two seats never share a checkout'). |
| `brain.toml:18` | No model is pinned; the seat inherits what was launched. | retired with the file. |
| `brain.toml:19-21` | The completion-report inbox may hold reports from any tool that followed its contract. | retired: the inbox is retired. |
| `decomper.toml:5-8` | Read the worker contract in full; this file does not restate it. | covered by the framework: Worker card. |
| `decomper.toml:10-14` | Addressed as Decomper: the worker contract plus the decomper scope (src/, symbol renames, assets/), the same authority and no self-acceptance. | retired: Decomper name and path-scope retired (owner decision 4); no self-acceptance is Worker card 'Never'. |
| `decomper.toml:16-17` | Then read AGENTS.md, your brief and CLAUDE.md for build and matching specifics. | covered by the framework: Worker card 'Start' (BUILD.md now holds the specifics). |
| `decomper.toml:21-22` | Work in this seat's own checkout, never the coordinating session's. | kept: AGENTS.md Roles. |
| `decomper.toml:23-24` | No model is pinned; if Codex is unavailable another tool takes the seat and nothing about role, scope or gate changes. | covered by the framework: any tool may hold any seat. |
| `scaffolder.toml:5-8` | Read the worker contract in full; this file does not restate it. | covered by the framework: Worker card. |
| `scaffolder.toml:10-15` | Addressed as Scaffolder: worker contract plus the scaffolder scope (tools/, libs/, include/); never merges, including in a production-fire emergency. | retired: Scaffolder name and scope retired; never merging is Worker card 'Never' and FRAMEWORK rules 1 and 11. |
| `scaffolder.toml:17-18` | Then read AGENTS.md, your brief and CLAUDE.md. | covered by the framework: Worker card 'Start'. |
| `scaffolder.toml:22-25` | Work in this seat's own checkout; no model is pinned; another tool may take the seat. | kept: AGENTS.md Roles. |
| `.codex/hooks.json:3-13` | PreToolUse on Bash runs `python3 .codex/hooks/pre_bash.py`. | retired: `.codex/` is removed; Codex settings are deferred to round C. |
| `.codex/hooks.json:14-24` | PostToolUse on Edit, Write or MultiEdit runs `python3 .codex/hooks/post_edit.py`. | retired: `.codex/` is removed; Codex settings are deferred to round C. |
| `.codex/hooks/post_edit.py` | Byte-identical to .claude/hooks/post_edit.py (ruff, unittest and in-loop per-TU objdiff after an edit). | see the .claude/hooks/post_edit.py rows: kept (ruff and unittest evidence in AGENTS.md), deferred to round E (in-loop match feedback), otherwise retired. `test_routing_suffixes.py` asserted the two copies stay identical and is edited accordingly. |
| `.codex/hooks/pre_bash.py` | Byte-identical to .claude/hooks/pre_bash.py (block `git push` when the invariants check reports errors). | see the .claude/hooks/pre_bash.py rows: kept as evidence in AGENTS.md; blocking deferred to round C. |

## .githooks/pre-push (at the tag commit)

| Source | Rule | Disposition |
|---|---|---|
| `.githooks/pre-push:2-3` | Run `tools/check_match_invariants.py` before a push and block on errors (exit code 2). | kept, changed: AGENTS.md Evidence (invariants row); blocking is deferred to round C. |
| `.githooks/pre-push:6-8` | Block on errors only; warnings (exit 1, the complete_tu_rename backlog) are allowed. | kept: AGENTS.md Evidence ('exit 2 means errors'). |
| `.githooks/pre-push:10-12` | Install with install_git_hooks.py; bypass once with `git push --no-verify`; skip permanently by unsetting core.hooksPath. | retired: the hook and installer are removed. |
| `.githooks/pre-push:21-27,63-73` | Skip the check unless the pushed diff touches config/, src/ or tools/check_match_invariants.py. | kept in substance: AGENTS.md Evidence (the invariants row applies to src/ and config/ changes). |
| `.githooks/pre-push:41-59` | On a new branch diff against the merge base with origin/main; if no base resolves, run the check conservatively; use `rev-parse --verify`. | retired with the hook. |
| `.githooks/pre-push:75-117` | Locate Python with a version gate (3.11+); honour an explicit PYTHON override; with no supported Python, warn loudly that invariants were not checked and allow the push. | kept in substance: AGENTS.md Working rules (use `python3.13`); the discovery logic is deferred to round C. |
| `.githooks/pre-push:119-131` | Run the check with `--version eur` hardcoded, capturing the status with `\|\| rc=$?` (not `if ! cmd`). | retired with the hook; the lesson (a guard must be tested by running it) is the AGENTS.md Evidence rule that a new test is shown red. |
| `.githooks/pre-push:133-151` | On exit code 2, print the error section (without complete_tu_rename) and exit 1; on exit code 1 (warnings) let the push through. | retired with the hook. |

Total: 199 rows.
