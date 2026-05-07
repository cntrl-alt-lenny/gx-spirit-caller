### cloud/markdownlint-cleanup

**Goal:** Fix the seven pre-existing markdown-lint failures so the
`Markdown (markdownlint-cli2)` CI check stops reporting red on every
PR. None are in active-edit files; this is a one-off docs cleanup.

**Context:**

The `Lint` workflow has been failing on `main` for at least the
last 3 commits (#283, #284, #285) and bleeds red status onto every
new PR (#291, #292, #293). All seven errors come from three files:

- `docs/briefs/016-cluster-prop-ov000.md:51` — MD031
  blanks-around-fences
- `docs/briefs/016-cluster-prop-ov000.md:56` — MD031
- `docs/briefs/017-cluster-prop-020085d4.md:61` — MD031
- `docs/briefs/017-cluster-prop-020085d4.md:66` — MD031
- `docs/tools-index.md:14:3` — MD051 invalid link fragment
  `[Analysis / worklist](#analysis)`
- `docs/tools-index.md:17:3` — MD051 invalid link fragment
  `[Hygiene / invariants](#invariants)`
- `docs/tools-index.md:19:3` — MD051 invalid link fragment
  `[Infrastructure / build-patching](#infrastructure)`

The link-fragment errors are because the linked headings have the
slug-incompatible characters (e.g. `## Analysis` doesn't anchor at
`#analysis` if the heading was originally `## Analysis / worklist`).
Adjust the heading slugs or the link fragments — either direction
works as long as the linker validates.

**Scope:**

- `docs/briefs/016-cluster-prop-ov000.md` — wrap the fenced code
  blocks at lines 51/56 with blank lines (PR #291 fixed similar
  cases in `docs/briefs/019-configure-mwasmarm-output.md` for
  reference; same MD031 error class).
- `docs/briefs/017-cluster-prop-020085d4.md` — same MD031 fix at
  lines 61/66.
- `docs/tools-index.md` — repair the three section-link fragments.
  Easiest path: regenerate via `python tools/generate_tool_index.py`
  if it's auto-generated; otherwise hand-fix the three links to
  match the headings' actual slug-cased form.

**Non-scope:**

- ❌ Adjusting the markdownlint config (`.markdownlint.json` /
  `.markdownlint.yaml` / equivalent) to suppress these errors —
  fix the content, not the rule.
- ❌ Other `MD0xx` errors in `briefs/016` or `briefs/017` if any
  surface in passing — only the seven listed.
- ❌ Anything outside `docs/`.
- ❌ Editing `docs/state.md` or `AGENTS.md` (brain territory).

**Success:**

- The `Lint` workflow goes green on the cloud PR's branch.
- A spot-check on `main` after merge: `gh run list
  --workflow=lint.yml --branch=main --limit=1` reports
  `conclusion: success`.
- No content meaning changed; only formatting / link-target
  adjustments.

**Branch:** `cloud/markdownlint-cleanup`

**Smoke test:**

```bash
npx markdownlint-cli2 'docs/**/*.md' '!docs/research/**'
```

(Or whatever local invocation matches the CI workflow.) Expect zero
errors.
