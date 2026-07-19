[//]: # (markdownlint-disable MD013 MD041)

# Brief 619 — tools/cmatch_loop.py, the production loop (r7-2)

**Asked:** the retriever (`retrieval_eval.py`), the RESOLVED `fastmatch.py`,
and `batch_sha1.py` all exist but nothing chains them into one loop.
Build `tools/cmatch_loop.py`: per candidate, build a dossier
(matched-sibling `.c` via the retriever + struct decls + `suggest_
coercion` tier + m2c skeleton), run one serialized compile+fastmatch
sweep, classify accept/iterate/park, hand accepts to `batch_sha1` for
the real gate. Do not auto-ship (r7-26: two gate gaps survive fastmatch-
RESOLVED). Persistence lives in the loop, not a prompt. Mandatory
CANARY: prove the composition by reproducing a known match on 3-5
already-matched functions.

**Short answer: built, wired, and CANARY-verified — 5/5 already-matched
functions across two modules (main, ov002) reproduce their 100.00% match
through the full pipeline, and the tree is byte-identical before and
after every run.** Three real, non-hypothetical bugs were found and
fixed while getting there (§4) — this is reported as a feature of the
build-test-iterate process the brief asked for, not a footnote: each was
caught by running the real tool against the real toolchain, not by
inspection. The loop never auto-ships: `--gate` (opt-in, off by default)
is the only path to `batch_sha1.py`, which itself never touches git.

## 1. The pipeline

```
queue (func names) ──► build_dossier() ──► stage_source() ──► fastmatch.match_one()
                        (retriever +          (write to the     (ONE serialized
                         struct decls +        canonical src/    compile, then
                         m2c skeleton)          path, reconfigure  RESOLVED byte
                                                if new)             compare)
                                                                      │
                                                                      ▼
                                                                 classify()
                                                              accept / iterate / park
                                                                      │
                                              ┌───────────────────────┼──────────────┐
                                              ▼                       ▼              ▼
                                    enrich_with_coercion()      state["candidates"]  --gate?
                                    (needs the .o compile        [func] updated       │
                                     just produced — see §3)     (persisted to disk)  ▼
                                                                              invoke_batch_sha1()
                                                                              (opt-in; batch_sha1.py
                                                                               itself never commits)
```

Every candidate gets exactly one `ninja <target>.o` + one RESOLVED
fastmatch comparison per loop invocation — no parallel wine calls from
this tool (the brief's "ONE serialized...sweep"), even though per-
worktree `WINEPREFIX` (brief 608/614) now lets *separate* worktrees
compile concurrently; that's an orchestration-level concern above this
tool, not something `cmatch_loop.py` does internally.

## 2. The CANARY

```
$ python3.13 tools/cmatch_loop.py --canary eur \
    func_0201b6c4 func_0201ada0 func_020215d8 func_02022260 func_ov002_0220448c \
    --state build/cmatch_loop/final_canary_state.json

cmatch_loop — region eur
  [   ACCEPT] func_0201b6c4            match= 100.00%
  [   ACCEPT] func_0201ada0            match= 100.00%
  [   ACCEPT] func_020215d8            match= 100.00%
  [   ACCEPT] func_02022260            match= 100.00%
  [   ACCEPT] func_ov002_0220448c      match= 100.00%
  accepts: 5 -> ['func_0201b6c4', 'func_0201ada0', 'func_020215d8', 'func_02022260', 'func_ov002_0220448c']
```

`git status --short` is empty for `config/` and `src/` immediately
before and after this run — no working-tree diff survives.

**Why this is non-trivial to run at all**, and the mechanism that makes
it possible: `fastmatch.py` and `m2c_feed.py`'s object-discovery both
need a `_dsd_gap@...` object to compare/disassemble against, and dsd
only synthesizes one for byte ranges **no TU header claims at all**.
An already-matched function's delinks.txt entry claims its range and is
stamped `complete` — dsd's normal delink pass never produces a gap
object for it (confirmed directly: `fastmatch.py` returns
`status: "not_in_gap"` for an as-shipped matched function). Two things
were tried before finding the one that works:

1. Removing just the `complete` marker, leaving the TU header + its
   `.text` range in delinks.txt, then `ninja delink` — **no gap object
   appears.** dsd's gap detection is keyed on unclaimed byte ranges, not
   the `complete` flag (that flag is bookkeeping for `progress.py`-style
   tools, not dsd's own delink pass).
2. Removing the **entire TU block** (header + status + section lines)
   for the candidate, then `ninja delink` — **`_dsd_gap@main_201.o`
   appears**, and `fastmatch.py` reports `100.0%` against the function's
   own unmodified, already-shipped `.c` source.

`cmatch_loop.py --canary` automates exactly step 2, generalized to
multiple functions across multiple modules in one call (`TemporaryGap`,
§3), always inside a `try/finally`-equivalent context manager that
restores every touched `delinks.txt` and re-runs `ninja delink` on exit
— success or exception — so a canary run can never leave the tree in a
half-reverted state.

## 3. Design decisions and why

**`suggest_coercion` runs after the compile, not before, despite being
listed under "dossier" (step 1).** Reading `suggest_coercion.py`
directly (not assuming from its name) shows its entry point
(`parse_objdiff_json` → `suggest`) needs objdiff JSON diffing the
candidate's **own already-compiled** `.o` against the gap object —
`_find_object_files` globs `build/<region>/src/**/{symbol}.o`. It
cannot run before a compile exists, no matter how the brief's own
step-1/step-2 prose is read. `enrich_with_coercion()` runs it right
after `compile_and_fastmatch()`, using the `.o` that call just produced,
and folds the hits back into the same `Dossier` object — the *final*
dossier a human/agent reads still has all four r7-6 components; only
the internal build order differs from a literal reading, for a reason
grounded in the dependency, not convenience.

**Persistence is a JSON state file, not batch_carve.py's git-log-as-
database pattern — deliberately, not by oversight.** Read directly:
`batch_carve.py` keeps **no separate state file at all** — "pending" is
re-derived every run from `symbols.txt` minus `delinks.txt`-claimed
ranges, "done" is a git commit (it auto-commits on every green gate),
and "parked" is a flat, append-only skip-list text file. That works
*because* batch_carve auto-commits, so git itself is the durable ledger.
`cmatch_loop.py` explicitly never commits (r7-26) — it has no git-based
"done" to derive state from, so it tracks its own: `{func: {status,
attempts, history}}` at `--state` (default `build/cmatch_loop/state.json`,
gitignored-by-convention scratch, not a committed durable record like
batch_carve's skip-lists — a real production deployment sharing this
across sessions would want a committed path instead; this brief's scope
is the mechanism, not picking that path). "Queue re-injection" needs no
special code: an `iterate`-status candidate simply isn't `accepted` or
`parked`, so a plain re-run with the same candidate list reprocesses it
automatically (`TestQueueReinjection` in the test suite pins the skip-
if-resolved half of this).

**`--gate` is opt-in and off by default; `batch_sha1.py` itself never
commits either.** Confirmed by reading it: zero `git` occurrences.
Getting from "accepted" to "shipped" needs a human/brain-triggered
`batch_sha1.py` run (this loop can invoke it for you with `--gate`, but
won't unless asked) followed by a real `ninja sha1` and a commit —
matching `docs/research/tool-scout-swarm-2026-06-19.md`'s "the gate gap
is load-bearing" finding: objdiff/fastmatch-100% is necessary, never
sufficient. `--gate` defaults to `batch_sha1.py --dry-run` (real flag,
mutates nothing) unless `--gate-real` is also passed — tested directly
against the canary's own accepts: `batch_sha1.py` correctly *refuses*
("Already applied") since those functions are already `.c`-routed,
demonstrating its own safety net still holds even when handed
technically-valid-but-inapplicable input.

## 4. Three bugs found and fixed while building this

Per the brief's "genuine build-test-iterate — take the time": every one
of these was caught by running the actual tool against the actual
toolchain, not by review.

1. **`retrieve_fewshot`'s `obj` parameter is a caller-supplied object
   PATH, not something it resolves itself** — confirmed by reading its
   body (`subprocess.run([objdump, "-d", obj], ...)`). An early
   `build_dossier()` passed `obj=""`, so every dossier silently reported
   "no siblings retrieved" for every candidate. Caught by directly
   printing a real dossier and noticing an empty retrieval for a
   function whose disassembly plainly exists (verified: plain
   `objdump -d` on its real gap object shows 6 real instructions). Root
   cause was `retrieve_fewshot` raising `FeedError: ... disassembled to
   zero instructions` on an empty path, silently swallowed by a
   too-broad `except Exception: dossier.fewshot = []`. Fixed by
   resolving the object path once (`m2c_feed.find_object`) and sharing
   it between the retriever and m2c-skeleton steps, and by recording a
   genuine failure in a new `fewshot_error` field instead of masking it
   as an empty, legitimate-looking result.
2. **`stage_source`/`unstage_source` would silently destroy a
   pre-existing file's real content.** The original `unstage_source`
   unconditionally `unlink()`ed whatever it staged. That's correct only
   when the file didn't exist before staging; if a candidate's target
   path *already held content* (a real, already-matched file queued by
   mistake; a prior `--keep-drafts` attempt being retried) and got
   overwritten, deleting it on cleanup would permanently lose the
   original — not restore it. Caught while testing the iterate/park
   path: fed a deliberately-wrong draft for an already-matched canary
   function, and only checking whether the real file survived the round
   trip surfaced it (it initially did not, when tested with the wrong
   `reuse_existing` flag combination). Fixed by having `stage_source`
   capture and return any pre-existing content, and `unstage_source`
   *restore* it instead of deleting when `previous_content is not None`
   — restore-vs-delete is now a real branch, not an assumption. Pinned
   by `TestStageUnstageSafety` and by an assertion inside
   `TestWrongSourceIteratesThenParks` that checks the real file's
   content after **every** attempt, not just at the end.
3. **`TemporaryGap` assumed one hard-coded `delinks.txt` path.** main
   and every overlay have separate `delinks.txt` files
   (`config/<region>/arm9/delinks.txt` vs.
   `config/<region>/arm9/overlays/ov002/delinks.txt`); a mixed-module
   canary set (`func_0201b6c4` + `func_ov002_0220448c`) raised
   `ValueError: no TU header ... found` against the wrong file on the
   first attempt. Fixed with `delinks_path_for_module()` (mirrors
   `progress.py`'s own `_discover_module_delinks` convention) and
   reworked `TemporaryGap`/`run_canary` to group candidates by their
   actual delinks.txt path, restoring each file independently.

## 5. Tests

```
$ python3.13 -m pytest tests/test_cmatch_loop.py -q
........................................                                 [100%]
40 passed in 99.10s (0:01:39)
```

40 tests, two tiers: pure-logic tests (path derivation, `classify()`,
delinks.txt TU-block surgery incl. a snippet copied verbatim from the
real `config/eur/arm9/delinks.txt`, state-file I/O, queue re-injection
skip logic, dossier rendering) run unconditionally; real-toolchain
integration tests (the canary round-trip incl. the multi-module case,
the wrong-source iterate→park path, the stage/unstage safety regression,
the retrieve_fewshot regression) are guarded by
`@unittest.skipUnless(...)` on a configured EUR build + vendored m2c +
`arm-none-eabi-objdump`, matching `tests/test_m2c_feed.py`'s established
pattern — green here (this worktree has the toolchain), skip cleanly
elsewhere. The ~99s runtime is real compiles + real `ninja delink`
cycles, not mocked — slower than a typical unit suite by design, since
the whole point of this brief was proving the composition against the
real pipeline.

Full suite: `python3.13 -m pytest tests/ -q` — all green (one
pre-existing, unrelated `docs/tools-index.md`-staleness failure was
fixed by regenerating it to include `cmatch_loop.py`, same mechanical
step every prior tool-adding brief has needed).

## 6. Honest limitations

- The CANARY proves the **composition** is wired correctly — a known
  match reproduces as `ACCEPT` at 100.00% through dossier-build, stage,
  compile, fastmatch, and classify. It does not, and cannot, prove the
  **drafting** step (m2c skeleton) reliably produces byte-matching code
  for genuinely unmatched functions — r7-6's own finding stands: m2c
  alone mis-resolves pool literals and is "near-useless" without the
  dossier context around it, and even with that context (see the real
  `func_ov002_0220448c` skeleton in this brief's dev log:
  `if (f() != 0) { return 2; } return 0;` vs. the true
  `return f() ? 2 : 0;`) a first draft is a recognizable starting point,
  not a guaranteed match.
- r9's caution stands as designed, not just as a comment: `classify()`
  never reads `dossier.fewshot` or any retrieval confidence — only
  `fastmatch`'s real compiled `match_percent`. The retriever's honest
  family-hit@5 = 53.5% (brief 611) never enters the accept/iterate/park
  decision.
- `ATTEMPT_CAP = 3` (r7-10) is a fixed constant, not per-candidate
  tunable yet — a genuinely promising near-miss (e.g. 99%+) parks at
  the same rate as a 10% miss. A future iteration could weight the cap
  by how close the best attempt got.
- The state file's default path (`build/cmatch_loop/state.json`) is
  gitignored scratch, matching this brief's mechanism-focused scope —
  a real steady-state deployment sharing the queue across the "3
  wine-free agents + dossier builder + Luna playlists" roster r7-2/r7-6
  describe would want a committed path (mirroring batch_carve's
  skip-lists) instead.

## 7. No auto-ship, restated

Nothing in this brief's testing wrote a git commit, flipped a real
delinks.txt entry for a genuinely new candidate, or ran a real `ninja
sha1`. The one `batch_sha1.py` invocation exercised (§3) was
`--dry-run` against already-matched canary functions specifically
because that combination is guaranteed side-effect-free. Shipping a
real accept remains, as the brief specifies, a deliberate step for the
brain — not something this tool or this brief performs on its own.
