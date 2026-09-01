# Guard coverage review

Audit baseline: `ceefe98c1` (2026-08-01). The scope is tests that assert a
property of the committed repository tree or its generated/invariant metadata,
not tests that merely use a real address as a fixture for a tool algorithm.
Every listed violation was supplied through a temporary fixture, a patched
constant, or an existing negative test; no audit mutation was left in the
checkout.

| Guard | Violation exercised | Result |
|---|---|---|
| `test_work_queue.py` real queue headings | Heading with no recognized status | FIRES-CORRECTLY |
| `test_parser_ownership.py` | Local scrubber plus ARM-only `_INSN` duplicate | FIRES-CORRECTLY |
| `test_generate_tool_index.py` | Stale index and missing index | FIRES-CORRECTLY; missing-artifact skip removed |
| `test_generate_briefs_index.py` | Stale index, missing index, and empty source set | FIRES-CORRECTLY; all skip paths removed |
| `test_generate_research_index.py` committed index | Stale index, missing index, and empty source set | FIRES-CORRECTLY; all skip paths removed |
| `test_generate_research_index.py` structure | Flat scan, unresolved link, leaked `INDEX.md`/`README.md` | FIRES-CORRECTLY |
| `test_generate_state_table.py` | Appended stale line | FIRES-CORRECTLY (existing negative test) |
| `test_check_ci_contract.py` | Paths-filtered required check and empty contract | FIRES-CORRECTLY (existing negative tests) |
| `test_docs_links.py` | Markdown link to a missing file | FIRES-CORRECTLY |
| `test_codex_agents_current.py` | Removed `gate3` and reintroduced stale toolchain wording | FIRES-CORRECTLY |
| `test_claude_slash_commands.py` | Removed `$ARGUMENTS` from a command | FIRES-CORRECTLY |
| `test_routing_suffixes.py` hook mirror | Diverged `.claude`/`.codex` hook copies | FIRES-CORRECTLY |
| `test_audit_callsite_arity.py` committed provenance | Missing provenance artifact | FIRES-CORRECTLY; missing-artifact skip removed |
| `test_permute_batch.py` committed worklist | Missing real target worklist | FIRES-CORRECTLY; missing-artifact skip removed |
| `test_scaffold_batch.py` live EUR config | Missing `config/eur/arm9` | FIRES-CORRECTLY; missing-config skip removed |
| `test_install_git_hooks.py` pre-push mode | Non-executable temp file | INSTALLER-ONLY |

The six changes that remove skips are deliberate fail-closed fixes: these
artifacts are committed inputs in this repository, so their absence must not
turn an invariant test into a pass. Build-artifact and extract-dependent tests
remain intentionally skipped because those inputs are untracked environment
prerequisites rather than committed repository invariants.

After the audit, the clean tree is re-run through the full suite and Ruff.

This table records whether a guard is INSTALLED, not whether it FIRES.
A row here cannot be cited as evidence that a guard catches anything.
Only a behavioural canary — the guard shown green on a known-bad input,
then red on the same input after a fix — is that evidence.
