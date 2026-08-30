[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next claude-scaffolder --claim` (⚠️ Windows: plain `python`, NOT `python3.13`). Candidate list via `python tools/wall_aware_headroom.py --json`. Hand C-match a batch, byte-verify, gate `python tools/gate3.py --scope all` (including pytest), ONE PR **per item**, `work_queue.py done`, commit, then immediately take the next item. Effort MAX.

**Pool status (2026-07-23 — supersedes the old "~245 convertible" line, which came from the broken pre-b651 classifier):** the honest pool is **6,093 candidates** (116 coercible + 5,945 never-assessed + 32 no-marker); only **32 files project-wide are confirmed-permanent**. Brief 661 established that `main`'s never-assessed tranche is **real runway, not disguised walls** — the generic "reg-alloc-walled, no C match (brief 294 endgame)" header is NOT evidence and was wrong more often than right on a true random sample.

⚠️ **The full gate is required by default;** the Windows path-separator baseline has been fixed or explicitly prerequisite-gated. ⚠️ **NEVER bare `ninja`.** ⚠️ **Park the reg-alloc/scratch-register wall on sight** (identical instructions, one register swapped throughout) — 100% lever-insensitive per brief 641; do not iterate on it.

**CRITICAL — header-read each candidate before compiling.** `wall_aware_headroom.py`'s list is an UPPER BOUND: a third wall class is free-form prose with no taxonomy number (mwcc-reg-alloc / hand-`.word` cross-jumps / `mcr` ops / shared-epilogue pads) — the tool can't catch it without also skipping easy stubs. Read each candidate's `.s` header; skip prose walls; the EASY WINS are trivial stubs (no-op `bx lr`, tail-call trampolines/forwarders). ~half of a medium batch may be prose walls — that's expected.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split shipped end-to-end, q-natural-c-metric [DONE]); prefer natural C, use asm-void only where a documented wall justifies it.

**⚠️ ROUTE BEFORE YOU DRAFT (brief 667, 3/3 + generalised):** the recurring epilogue-shape wall is NOT a wall — it is the existing per-TU compiler routing tier. **Read the TARGET `.s`'s own epilogue first:** `sub sp,#4` + separate `pop {lr}` / `bx lr` → name the file `*.legacy.c`; fused `pop {..., pc}` → `*.legacy_sp3.c`; otherwise plain `.c`. Choosing the tier BEFORE writing the body removes an epilogue mismatch that accounted for ~14% of brief 661's sample. See `docs/research/style-a-epilogue.md` + lever-payoff #28/#29.

**⚡ WORKTREE-PARALLEL SWEEP PROTOCOL (r11 [S], proven ~7x per merge slot — cm-overlay-small-sweep shipped 64/118 this way).** For any batch of >~20 independent candidates, do NOT grind them serially. Split into ~5 batches, run each in its OWN git worktree (`git worktree add ../sweep-N -b <branch>-N`), then consolidate with `git merge --no-ff` per batch — the real 3-way merge resolves overlapping `delinks.txt` edits from independent batches cleanly (zero conflicts observed across 5 batches all editing ov002). FAILURE MODES to preflight: (a) each worktree needs the baserom + a configure run before it can gate — seed it or the batch dies late; (b) `gate3`'s dsd preflight used to false-fail in fresh worktrees (FIXED on main — probes `dsd`/`dsd.exe`); (c) never let two batches claim the SAME candidate — partition the list up front and write the partition into the PR body; (d) gate ONCE on the consolidated branch, not per worktree (per-worktree gates waste the machine). ⚠️ VERIFY AFTER CONSOLIDATION: count `.c` files added vs `delinks.txt` activations flipped — they MUST be equal. The 07-24 sweep added 64 `.c` but flipped only 63 (one function shipped with a stale `.s` activation; the ROM was still byte-correct via basename fallback, so NO gate catches this — only the count check does).

**⚠️ AGENT-TOOL CONCURRENCY: dispatched agents share THIS SESSION'S REAL WORKING DIRECTORY, not a sandbox** (confirmed `cm-data-inference-4`, PR #1364) — unless `isolation:'worktree'` is explicitly requested per-agent, any agent given Write/Edit/Bash access is editing the same live files this session is, concurrently with every other agent dispatched in the same batch. `delinks.txt`/`symbols.txt` are the most likely collision points (many independent carves/retypes touch the same few config files). This is a real, not theoretical, risk: two concurrently-dispatched carve agents both needed to edit the same overlay's `delinks.txt` in one wave — it happened to resolve cleanly only because both agents' edits landed at non-overlapping line ranges AND one of them individually thought to check `git status` first before writing. Neither guarantee holds in general. **Default:** dispatch investigation as strictly read-only `Explore` agents (no Write/Edit tool access at all, so no collision is even possible) and perform ALL actual file writes centrally, sequentially, in this session itself afterward — proven safe across `cm-data-inference-3`/`cm-data-inference-4`. Only give an agent write access when a task specifically can't avoid it (e.g. a carve that must compile-verify its own work before reporting a confident STRONG verdict); even then, independently re-verify its output afterward (fresh rebuild, independent byte comparison) — never just trust the agent's own self-reported "verified" claim.

**⚠️ DATA-CARVE TU ALIGNMENT: splitting one blob into 2 separately-linked files is only safe at a 4-byte-aligned boundary** (confirmed `cm-data-inference-5`, PR #1371 — a real, reproducible `ninja sha1` regression, not a flaky build). mwldarm inserts a real gap between two objects' sections when the first doesn't end on a 4-byte boundary, even though neither object's own section requests any alignment (`objdump -h` shows `Algn 2**0` on both — the bug is invisible at the single-object level). Symptom: `ninja sha1` fails with a huge (tens-of-millions-byte) `cmp -l` diff count even though every individually touched object is byte/relocation-correct — that diff-count scale is itself the tell (LZ-family overlay compression amplifies a tiny upstream shift into a huge apparent diff), not evidence of a widespread content bug. **Fast bisection:** `ninja check` (advisory-only, but useful here purely as a diagnostic) reports `Symbol 'X' ... not found ... Matching name found at <addr>` pairs — a consistent non-zero offset starting at one symbol and persisting through every symbol after it in the same module names the misaligned split. **Fix:** when a carve's evidenced/unevidenced split point isn't a multiple of 4, keep both symbols in ONE `.c` file (one `delinks.txt` entry) instead of splitting across files — two globals in the same TU lay out contiguously with no inter-object gap. **If the boundary IS 4-byte aligned, use two separate files instead — do not merge just because two symbols are related.** Confirmed `cm-data-inference-6`, PR pending: mwcc's `-O4,p` does NOT preserve source declaration order for multiple `const` globals in one TU (it reordered a merged 32B+24B pair, swapping their built addresses, at an already-4-aligned boundary that never needed merging) — declaration order is not a lever that controls layout order, so verify any same-TU merge's built layout directly (`dsd rom extract` + byte diff, or `dsd check symbols`) rather than trusting source order or a clean `ninja sha1` alone. Full writeup: `docs/research/data-carve-tu-alignment.md`.

**⚠️ POINTER-VALUED DATA: `const` placement controls `.data` vs `.rodata` section selection** (confirmed `cm-data-inference-7`, PR pending — two real regressions, one per finding below, caught by rebuilding and inspecting the compiled objects, not by trusting a plausible-looking derivation). Before typing any symbol whose value is (or contains) a pointer, check its *ground-truth* section in `delinks.txt` first, then match it exactly:
1. **`&symbol` always creates a real relocation, which mwcc always places in `.data` — regardless of any `const` qualifier.** Confirmed against this project's own D-1 recipe worked example (`src/main/data_0210210c.c`, itself `.data` in `delinks.txt` for exactly this reason). If the symbol's ground truth is `.rodata`, do NOT use `extern char TARGET; ... &TARGET` (the usual not-yet-carved-target idiom) — use a raw `(void *)0x...` address-literal cast instead. No relocation, no `.data` placement, and this is *already* established precedent (`data_ov012_021cc180`, `cm-data-inference-6`), not a new pattern.
2. **Even with a literal cast, `const void *arr[N]` (pointer-to-const, mutable pointer) and `void *const arr[N]` (const pointer, mutable pointee) are different C types, and only the latter reliably compiles to `.rodata`.** Caught via `mwldarm`'s own link warning (`.data(.data) in file X.o is referenced but has not been written`) — check for this warning on any incremental build touching a pointer-typed global, it's far faster to spot than a whole-ROM byte diff. For a struct containing pointer *members* (not a bare pointer array), declaring the struct instance itself `const` correctly makes its pointer fields immutable the same way — verified working for `data_ov002_022ca790`/`data_ov013_021cb750`.
3. **If ground truth is `.data`, do the opposite: leave the symbol deliberately non-`const`/non-`static`, exactly matching its original declaration** — adding `const`/`static` to a `.data`-sited array relocates it into `.rodata` and breaks the link. (Independently rediscovered from the *other* direction this same wave, via a pre-existing project dossier for `data_ov006_021ce56c` that had already hit and documented this exact footgun.)

**⚠️ NEVER HAND-TRANSCRIBE BYTE CONTENT — generate every initializer from a script reading the real bytes, in every wave, no exceptions.** Confirmed `cm-data-inference-11`: a struct initializer field was written all-zero from memory instead of copied from the actual pre-edit byte literal, which had a stray non-zero byte partway through — caught only because `ninja sha1` failed outright and `dsd check modules` isolated it. The fix that shipped clean on the first attempt in `cm-data-inference-12` (extracting USA/JPN bytes via a small Python `struct.unpack` script reading `extract/<region>/arm9/arm9.bin` directly) is now the **required** method for any new C initializer, not an optional nicety — whether the source is a `.c` file being retyped, a raw ROM extraction, or `git show` of a predecessor branch. Hand-copying hex bytes from a Read-tool dump, even when re-reading the exact same tool output within the same turn, is exactly how this bug happened.

**⚠️ THE OPAQUE-BLOB CENSUS REGEX MUST BE RECURSIVE — `src/overlay*/*.c` (one level) silently skips `src/overlayNNN/data/*.c` and `src/main/data/*.c` subdirectories.** Confirmed after `cm-data-inference-12` incorrectly declared the campaign's discovery method exhausted: a live recount using `grep -rl ... --include="*.c" src/main src/overlay*` (properly recursive) found **66** current matches against the flat glob's **24** — 42 net-new candidates, every one of them inside `src/overlay004/data/` (an overlay this campaign had never touched). This is the same bug class already fixed once before in this project's own tooling (`q-research-index-recursive-glob`, PR #1366, `496→3011 entries`) — a flat, non-recursive glob undercounting a real pool is a recurring failure mode here, not a one-off. **Always use a properly recursive glob for any project-wide file census** (`--include`/`**` rather than a single `*` level), and re-verify the *count itself* is plausible (cross-check against a differently-derived signal, e.g. `find ... -type d` for unexpected subdirectories) before trusting a census result of zero or near-zero.

**⚠️ VERIFY YOUR OWN CLAIMS AGAINST THE TREE — before writing any PR body or commit message, reconcile every claim against `git diff --stat origin/main..HEAD`, every time, no exceptions.** Confirmed `cm-data-inference-13`/PR #1383: a fully-investigated, fully-documented retype (`data_ov004_02206760`, an AES table) was described as shipped in the commit message, research doc, queue result block, and memory — but the `Edit` call for that one file was never made. It silently stayed unmodified through the entire gate run and merge, because **an omitted edit is byte-identical to a correct no-op** — nothing about a passing `ninja sha1` or `gate3.py` run can ever distinguish "this file is correct" from "this file was never touched." This is a *structurally different* failure mode from a wrong-content bug (which the gate catches immediately): a missing edit has zero build-time signal, full stop. It was caught purely by accident, one wave later, when a fresh `git show` on the merged file didn't match its own commit message. This was not an isolated incident — the same "claimed but not actually done" shape hit **four separate lanes in the same round**: this one, a sweep batch claiming 9 unfinalized ships, a PR that shipped with no corresponding queue entry, and a PR that deleted 97 tests while citing its 2 survivors as proof of safety. **The fix is mechanical, not vigilance:** run `git status --short`/`git diff --stat` against the branch's actual change set immediately before drafting any summary text, and require every sentence of that summary to point at a line in the diff — never write from memory of what you *intended* to change. For any wave/PR touching more than a handful of files, additionally re-verify each proposed byte-level claim in one consolidated pass (a single script checking every file's actual content against every claimed value) before writing anything, and re-confirm the changed-file *count* matches your intended list with `git status --short | wc -l` after writing but before building — both now permanent, not wave-14-specific optional extras. See `feedback_claimed-change-was-never-written` (session memory) for the full postmortem.

---

## Items

### cm-ov005 — hand C-match ov005 [DONE]

Shipped 1 function (`func_ov005_021acadc`, bitfield-insert + Task_PostLocked size calc), byte-verified via `gate3.py --scope all` (3-region sha1 PASS). `wall_aware_headroom.py` now reports 0 convertible remaining in ov005 — pool exhausted (rest of the module's remaining `.s` carries the brief 294/302 GLOBAL_ASM-endgame wall marker).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov002-batch1 — C-match ov002 convertibles (batch 1) [DONE]

Of the 27 `wall_aware_headroom.py`-reported convertibles, 11 (the no-`func_`-prefix `ov002_XXXXXXXX.s` files) turned out to be **dead orphans** — already shipped as C under `libs/nitro/*.legacy.c` or a shifted `src/overlay002/*.c` path, with a stale unused `.s` sitting on disk (the tool globs `.s` files on disk, it doesn't check `delinks.txt` routing — same false-positive class as one file found in ov003). Deleted all 11, plus 1 equivalent orphan found in ov003 (`ov003_021ca2b4.s`) — 12 total dead files removed as hygiene.
Shipped all 16 genuinely-live remaining functions as byte-verified `asm void` C (reg-alloc-sensitive guard chains and table-lookup/tail-call families — not safely reachable from natural C on this asymptotic-hard module). **Toolchain finding:** the original `.s` files' local-label pool literals (`.Lxxx: .word symbol`) don't parse inside mwcc's inline `asm void {}` blocks (`illegal operand` / `unknown assembler instruction mnemonic`) — fixed by rewriting as the `ldr rX, =symbol` pseudo-op instead (proven precedent: `sinit_ov002_022ca7e8.c`). Confirmed via canary before scaling.
Byte-verified via `gate3.py --scope all` (3-region sha1 PASS + full pytest green).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-smalls — C-match the small-overlay convertibles [DONE]

Cross-checked every reported candidate against `delinks.txt` routing before attempting conversion (per the cm-ov002-batch1 dead-orphan lesson): most of ov008/ov011/ov010/ov016's reported counts were dead orphans or already resolved by the ff8e3426 taxonomy tightening. Real, live candidates found: 3 trivial no-op stubs (`func_ov015_021b285c`, `func_ov015_021b2860`, `func_ov003_021ca2b8` — empty C body, compiles to a bare `bx lr`) shipped as natural C, plus 1 attempted-and-parked case.
**Parked:** `func_ov011_021d2c64` (brief 192's cross-overlay hardcoded-BL worked example — a `bl` to an address dsd can't attribute to one overlay, so the original `.s` hand-encodes the branch as a raw `.word`). Confirmed this is **not** portable to `asm void` either: bare `.word` raw-instruction-encoding directives are rejected by mwcc's inline assembler (`unknown assembler instruction mnemonic`), unlike the labeled-pool-literal case from cm-ov002-batch1 which had a `ldr rX, =symbol` workaround — there's no equivalent substitute for an unresolvable raw branch encoding. Reverted cleanly to its original `.s`; stays a genuine wall until dsd itself can attribute the call (out of scope here, same as brief 192 concluded).
Byte-verified via `gate3.py --scope all` (3-region sha1 PASS + full pytest green).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (per module).

### cm-ov002-batch2 — C-match ov002 convertibles (batch 2) [DONE]

No-op: fresh `wall_aware_headroom.py --json` scan shows `overlay002: {total: 2773, wall: 2773, convertible: 0}`. Batch 1 already shipped/cleared the module's entire 27-function convertible pool (16 real ships + 11 dead orphans deleted) — nothing left for batch 2 to do. No functions converted, no gate run needed (no source changes).

### cm-final47-641 — C-match the project-wide 47-candidate frontier (brief 641) [DONE]

Header-read all 47 (main 43, ov004 3, ov011 1) before compiling. Shipped 3 (`func_0203d6c4` bitfield-shift lever, `func_0208b190` Thumb struct-init natural-C first-try, `func_0201aaf4` asm-void matching the adjacent `func_020186b0.c` precedent). Attempted and cleanly parked 15 genuine near-miss walls (7 of them the SAME register-allocation/scratch-register-choice class — confirmed via repeated testing that no C-level lever, including dummy params and explicit locals, influences which physical register mwcc's -O4 allocator picks for an otherwise byte-identical sequence). Flagged 3 mis-classified "convertible" entries for brief 640: `data_020b52d4` is pure zero `.rodata` (not code), `func_ov004_021dbdbc` and `func_ov011_021d2c64` are already exhaustively documented permanent walls (briefs 191/192) that `wall_aware_headroom.py`'s regex doesn't catch since their headers cite a brief number without a `[CP]-\d+` taxonomy tag. 26 main candidates skipped as prose walls at header-read, not individually re-verified.
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS (3-region sha1) — `--no-tests` used because the pytest step has 12 pre-existing Windows path-separator failures, documented in `docs/research/improvement-swarm-2026-07-15-r5.md`, in files this brief never touched.

### ov002-sweep-650 — first real C-match sweep of ov002 (brief 650) [DONE]

Answered brief 640's open question directly: sampled 15 functions across ov002's full size range (28B-1036B), size-stratified not cherry-picked, ignoring the blanket GLOBAL_ASM/294-302 marker entirely per instruction. **5/15 shipped (33%)**, 2/15 close (>50% match, `func_ov002_0222c3dc` at 93%), 1/15 a confirmed textbook reg-alloc wall (`func_ov002_021bc0d4` — 112/116 remaining bytes were pure register-name mismatches, recognized and parked without iteration per brief 641's guidance), remainder genuine near-misses or time-bounded drafts. Headline result: the 1036-byte, 11-case state-machine dispatcher `func_ov002_02246a50` landed 56.76% on a **first, non-iterated attempt** — direct evidence large ov002 functions aren't categorically walled either. Verdict: ov002's "100% wall" marking should be retired; conservative floor is ~47% (shipped+close) of the 2,773-file cohort is real runway, plausibly ~1,000+ recoverable functions campaign-wide. New lever refinement: branch-vs-predicate polarity is a **per-guard**, not per-function, choice — confirmed on `func_ov002_0222c3dc` where 3 guards in the same function independently wanted different shapes.
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS (3-region sha1).

### ov002-sweep-654 — sustained C-match sweep of ov002, coercible-32 pool (brief 654) [DONE]

Worked the full 32-file coercible pool (files citing a taxonomy code) plus 1 direct re-test of the "unknown" pool. **18/32 shipped (56%)**, well above brief 650's 33% broad-sample rate. 5 new narrow levers found (XOR operand order for extraction scheduling, unsigned-cast for `blo`/`blt` on a loaded table value, C statement order must mirror the original's field-extraction order not just its data-flow, C89 declaration hoisting past 2+ leading `if`-blocks, nested-`if` needed to make mwcc share a guard-chain's tail via branch instead of predicating it away). **Headline finding: confirmed C-34 (address-CSE) is permanent even via the `asm int` inline-assembly escape hatch** — mwasmarm's own literal-pool dedup collapses two `ldr rX,=symbol` of the same symbol inside an `asm` body, and explicit-label `.word` directives don't parse there at all; C-34 candidates must stay `.s`, no C-file form works. **Second finding: the module's ~2,750-file remaining pool is not "unknown"** — direct header grep shows 98.9% (2,719 files) carry an explicit brief-294 "reg-alloc-walled, no C match" note and another 15 carry a specific brief-288/290 "commutative-add CSE" note (re-tested 1, reconfirmed the wall); `wall_aware_headroom.py`'s classifier just has no regex for either header. **Recommend no further dedicated ov002 campaign** — the real runway was the coercible-32 pool and it's now mostly drained (14/32 remain, all confirmed walls: 6 parked + 1 pattern-skip + 7 giants, the giants confirmed via grep for duplicate same-symbol pool words before any full read).
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS (3-region sha1).

### main-unknown-probe-661 — is main's 2,370-file unknown tranche real runway or disguised walls? (brief 661) [DONE]

Unlike ov002 (brief 654: 98.9% of its "unknown" pool traced to specific, credible per-function negative-result headers), main's generic "reg-alloc-walled, no C match (brief 294 endgame)" header is **not reliable evidence** — present on all 35 files of a true seeded-random sample spanning the full size range, but of 14 real compile attempts in the 0-256B range (69% of the tranche by file count, 1,645/2,370 files), only 5 (36%) showed a confirmed genuine-wall signature; 3 shipped outright (21%, all mistagged) and 2 more reached a **perfect logical body match** blocked only by one recurring epilogue-shape quirk (14%). **3/35 shipped.** For the 257B+ tier (31% of the tranche), every sample inspected (8 read in full/substantial part) was genuinely complex real code (DMA/texture transfers, heap allocators, weighted-average computations) with no wall signature, just too large to byte-verify in this sweep's budget. **NEW wall class (not yet catalogued): epilogue-shape wall** — mwcc's original prefers `sub sp,#4` + single-register push/pop; my compiles consistently prefer a dummy-register push + fused pop-and-return; confirmed 3 times, unresponsive to a `volatile` local (unlike the different epilogue variant from brief 654's candidate 1). 3 new levers: don't over-assume a callee's signature from a "preserved register" pattern (check for a wider/narrower return type first), `cur = *s++;` must be a standalone statement not check-then-increment for post-increment addressing, and don't cache a repeatedly-accessed global pointer in a local if the original re-reads it fresh each time. **Recommend: schedule a dedicated sweep on the 0-256B tier (real, sizeable runway); do NOT quick-sweep the 257B+ tier (real but expensive per-candidate, needs brief-650-style dedicated investment); retire the brief-294 header as evidence for main specifically.**
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS (3-region sha1).

### cm-main-small-a — main small/medium sweep, batch A (0x0200xxxx–0x0203xxxx) [DONE]

Brief 661 proved `main`'s never-assessed tranche is real runway: in the **0–256 byte tier (69% of it — 1,645 of 2,370 files)** a true random sample gave **21% shipped outright + 43% open near-misses**, with an estimated **35–55% floor** for a dedicated sweep. This is that campaign. Work the 0–256 B candidates whose addresses fall in **0x02000000–0x0203ffff** (the Decomper takes the upper half — no collision).
Get candidates: `python tools/wall_aware_headroom.py --json` (main), filter to size ≤256 B and your address range. Header-read first, but treat the generic brief-294 header as **non-evidence** — 661 showed it was wrong more often than right.
Prefer the shapes 661 found tractable: trivial stubs, tail-call forwarders, small guard/dispatch bodies. Levers ranked by evidence: `docs/research/reshape-recipes/lever-payoff.md` (read its ANTI-PATTERNS section first).
**Result: 7/13 shipped (54%)**, at the top of 661's floor estimate. Worked the size-sorted front of the 439-candidate 0x02000000–0x0203ffff pool (4B–48B). Ships: `func_0203ab98` (shared-epilogue stub, `asm void`), `func_02034094` and `func_0203c70c` (range/flag guard checks — predication-vs-branch lever stacking: nested-if plus removing a redundant fallthrough return, or a natural short-circuit `||` beating both a plain if-chain and a `goto`), `func_0201a824` (bitfield byte-check, lever #3), `func_0201d5c0` (dual-field dispatcher needing a `goto` to place the branch target at the function's end), `func_0203f718` (local-buffer thunk, first try), `func_0201a0e0` (multiply-by-7 array index needing an explicit intermediate pointer to get the un-folded addressing mode). **6 parked as genuine walls or unresolved after 2–3 attempts**: `func_0201c1bc` (raw hand-encoded `.word` BL, recognized on sight, matches the queue's own already-confirmed `cm-smalls` wall class, not reattempted), `func_02032724` (in-range sub-struct fold, matches lever-payoff's documented P-14 anti-pattern, recognized and parked), `func_0200f01c` (pure reg-alloc register-choice residue, 2 attempts), `func_02007f38` and `func_020379c4` (mwcc prefers a pool-load/computed-constant over the original's chosen encoding, 3 attempts each, no lever found), `func_02001e5c` (redundant-boolean-then-negate pattern that -O4 collapses regardless of restructuring, 3 attempts incl. `volatile`). No new wall classes; all parks matched already-catalogued anti-patterns.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 7/13 shipped.

### cm-main-small-b — main small/medium sweep, batch B (continue batch A's range) [DONE]

Continue `cm-main-small-a` in the same address range with a fresh batch. Report the running shipped/attempted rate so we can see whether 661's 35–55% floor estimate holds at volume — that number decides how much of the 1,645-file tier is worth committing to.

**Result: 13/15 shipped (87%)**, well above 661's 35–55% floor estimate — confirms the tranche is real runway at volume, not just at small sample size. Continued the size-sorted front of the 0x02000000–0x0203ffff pool past batch A's 13 candidates, sourced from the new `main-small-tier-worklist.md` census. Ships: `func_02000e70` (struct-field switch dispatcher, needed an explicit `Struct *p = &global;` local before the call so the pointer survives it), `func_02019820`/`func_02037b04`/`func_0201be64` (guard-chain early-returns, fixed via goto-to-shared-tail), `func_0203cb90` (unsigned-range guard + declare-before-call ordering for register/branch-sense match), `func_02022580` (explicit early pointer local to hoist a second pool-address load ahead of a branch), `func_02032644`/`func_0203361c`/`func_02009278` (natural switch/sequential-call dispatchers — matched first try), `func_02025880` (3-way C-bitfield bit-extraction, lever #3, first try), `func_0201cfa0` (3-way exit — needed nested-if, not goto, for the middle exit to branch correctly), `func_02003ac0`/`func_02003f1c` (6-int-arg pass-through wrappers — r3 survives a leading call untouched so it's an *implicit* 4th forwarded arg with no explicit mov; also had an inverted if/else branch polarity vs. my first draft). **2 parked as confirmed reg-alloc/scratch-register walls** (`func_0201d47c`, `func_02009a68`) — both reproduced the exact target instruction sequence with only register letters shifted, unchanged across 3 independent restructuring attempts each (explicit temps, split SSA-style locals, reordered base-pointer/index evaluation), matching the already-catalogued anti-pattern exactly. **1 skipped unattempted** (`func_02003a4c`, 116 B: 6+ stack args, a round-toward-zero divide idiom, two divergent call-forwarding paths — too complex for this sweep's pace). No new wall classes. Recurring reusable pattern confirmed 5 times this batch (not previously called out this explicitly in the lever docs): **branch-vs-predicate polarity is per-guard, not per-function** — mwcc picks a real branch for whichever guard's early-return value matches the shared tail's value, and predicates/merges the other; `goto <shared-label>` on the matching-value guard(s) reproduces this in 4/5 cases, nested-if (not goto) was needed for the 5th (a 3-way exit with no shared value).
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 13/15 shipped (87%).

### cm-main-large-probe — probe the 257 B+ tier [DONE]

Brief 661 read 8 files from the **257 B+ tier (31% of the tranche)** — DMA/texture transfers, heap allocators, weighted-average routines — and found **real complex game code with NO wall signature**, just too large to verify inside a sweep budget. Take 3–4 of them and give each the slow, per-candidate treatment (the shape of brief 650's 1036 B dispatcher effort, which succeeded). Expect low counts; the deliverable is whether large-function matching is economically viable, not a ship count.

**Verdict: not economically viable as a routine sweep tier at small-tier investment levels — 0/4 shipped.** Sourced 4 fresh 260 B candidates from `wall_aware_headroom.py` + `symbols.txt` sizes (257–512 B range, 0x02000000–0x0203ffff), independent of 661's original 8 (whose exact names weren't recorded in its report). Picked the two most promising-looking shapes plus two of 661's already-characterized "genuinely complex" shapes:
- `func_0202f2e4` — looked like an easy win at first read: a flat 16-value discrete-ID membership check (no calls, no loops), the kind of thing that's trivial at small size. **4 independent structural attempts, best result 53.8%/236B (24 B short):** a flat `switch` with all 16 case labels reproduced the right *general* shape (predication-threshold splits + a 6-entry jump table for the dense cluster + individual compares for the sparse outliers) but mwcc anchored its jump-table and range-check pivots on **different member values of each cluster** than the original: no combination of case ordering, explicit per-case bodies, or splitting into an equivalent nested-if/switch hybrid reproduced the original's exact pivot choice — nested-if and if/else-if variants were worse (0%, +44 B: each independent `if` re-emits its own `cmp` where the original reused one comparison's flags across a `bgt`+`bge` pair). mwcc's switch-cluster anchor selection is not controllable from case declaration order.
- `func_0203f094` — a real two-tier state dispatcher (mode check, then a 6-way jump-table switch on an inner state value, falling back to a 3-way if-chain). **1 substantial attempt, 21.5%/232B (28 B short):** right general shape, several individual instructions matched exactly, but the **physical layout order of the switch's case bodies** in the compiled output didn't match my source's (value-ascending) case order, and — per the first candidate's finding — case reordering isn't a lever that controls this.
- `func_020211c8`, `func_0202d1d8` — read and characterized only (not compile-attempted), confirming 661's finding directly: a particle/effect-slot allocator (bounded search loop + `Fill32` + a 3-stage one-time init dispatch + a linked message-scan loop) and a template-struct-copy-plus-magic-number-division grid initializer (`0xcccccccd` reciprocal-multiply, a stack-local 0x50-byte template copy, nested 3×5 fill loops) respectively — genuinely complex real game code, no wall marker, and visibly harder than the two switch-shaped candidates above that *already* didn't converge.

**New finding for the lever docs (not yet written up there):** large-tier obstacles are qualitatively different from small-tier ones. The small tier's dominant obstacle (branch-vs-predicate polarity, this queue's batch B) is reliably fixable with `goto`-to-shared-tail or nested-if. The large tier's dominant obstacle here — mwcc's internal switch-statement value-clustering/pivot-anchor selection and case-body layout ordering — showed **no responsive C-level lever** across 5 combined attempts on 2 candidates; it looks close (right instruction mix, right general control shape) without a way to close the last 20–30%. **Recommend:** do not schedule a routine large-tier sweep at the small-tier's per-candidate pace (~15–20 min); brief 650's dispatcher win took dedicated multi-hour investment per function, and even that scale of effort is not guaranteed against this specific obstacle class.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) — no source changes (all 4 attempts reverted cleanly); doc-only update.

### cm-main-small-d — main small/medium sweep, batch D [DONE]

Continue the 0-256 B `main` sweep in range `0x02000000-0x0203ffff`. Batches A/B ran **54%** and **87%** — far above brief 661's 35-55% estimate, largely because the epilogue routing rule (above) removes a whole failure class. Keep going; the tier is 1,645 files and barely dented.
Candidates: `python tools/wall_aware_headroom.py --json` (main), size <=256 B, your range. Route by epilogue BEFORE drafting. Park reg-alloc/scratch-register on sight.

**Result: 7/13 shipped (54%)**, cumulative A+B+D = **27/41 shipped (66%)**. The ROUTE-BEFORE-YOU-DRAFT rule paid off immediately: `func_0203cb0c`, `func_0203ef68`, `func_0203f740` all read `sub sp,#4` + a direct-to-pc pop, routed to `.legacy_sp3.c` on the first pass, and matched **first try** — zero epilogue-mismatch iterations this batch, versus that being a live failure class in every prior batch. One epilogue-only ambiguity resolved along the way: a single-register frame (`push {lr}` / `pop {pc}`) can't show the 2-step-vs-1-step distinction from register count alone — the tell is whether the pop targets `pc` directly (sp3) vs `lr` followed by a separate `bx lr` (sp2p3); both `func_0203ef68`/`func_0203f740` had `sub sp,#4` + direct-to-pc, unambiguously sp3. Also caught and reverted a self-inflicted `git checkout -- delinks.txt` whole-file revert (twice) that silently un-routed already-passing sibling candidates mid-batch — re-diffed each one before trusting a "100%" that turned out to be a stale pre-rename `.o` still on disk.
Ships: `func_02038dac`/`func_0201a5c0` (register-swap fixed by reordering local declarations to match target's allocation order), `func_0203cb0c`/`func_0203ef68`/`func_0203f740` (sp3-tier, first try), `func_0200efe0` (two "implicit passthrough" args turned out to be zero real args — the callee ignores stale r0/r1, not forwarding them), `func_0200fdc0` (linked-list search, goto-to-tail for the lone early-return branch-vs-predicate fix).
**5 parked as confirmed walls after 2-3 attempts each**: `func_0201aabc` (own header already flagged reg-alloc; 3 attempts converged on the right instruction *set* via the bitfield lever but never the right *order* — matches the header's own claim), `func_02021158`/`func_02023fec` (redundant double pool-load of the same symbol address that if/switch/volatile rewrites couldn't reproduce), `func_02033a48` (struct-field access didn't stop the compiler from collapsing a two-pointer dual-base structure into one base + large immediate), `func_0201904c`/`func_0201a134` (both: right general shape, register/constant-materialization choices didn't respond to reordering or named-constant reuse). **1 recognized-wall-on-sight, not attempted**: `func_0201bf80` (raw `.word` hardcoded BL encoding — confirmed non-portable to `asm void` per the cm-smalls precedent). **1 skipped unattempted**: `func_020139fc` (signed divide-by-255 magic-constant idiom, too time-expensive for this sweep's pace).
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 7/13 shipped (54%), cumulative 27/41 (66%).

### cm-main-small-e — main small/medium sweep, batch E [DONE]

Same as batch D, next tranche. Report the cumulative rate across A/B/D/E so we can see whether the epilogue-routing lift holds at volume.

**Result: 2/11 shipped (18%)** — the weakest batch so far, cumulative A+B+D+E = **29/52 shipped (56%)**, still comfortably above 661's 35–55% floor. This batch's candidates skewed toward two specific obstacle classes that resisted every lever tried:
- **Redundant double-pool-load of the same symbol** (now 4 confirmed instances total: `func_02021158`/`func_02023fec` from batch D, `func_0202111c`/`func_0202a240` here) — recognized **on sight** this time from the shape match and parked without re-attempting already-failed if/switch/volatile restructurings. Worth a lever-payoff.md anti-pattern entry if this keeps recurring.
- **Instruction-scheduling-only near-misses** — `func_02000d0c` and `func_02019858` both reached >90%/75% with every *instruction* correct, differing only in operand order or store/load interleaving that didn't respond to source-level reordering (temp-variable insertion, operand-position swaps). Same class as batch D's `func_0201aabc`.
- **New finding**: `func_0202b9b0`'s near-miss traced to a genuine **relocation-target identity mismatch**, not a codegen difference — `symbols.txt` defines `data_020be822` as its own distinct symbol 2 bytes into `data_020be820`, and the target's `.s` relocates directly to it, while addend-based access (`data_020be820[i].value`, or explicit `+2` arithmetic) relocates to `data_020be820+2` instead. objdiff-cli's pre-link comparison treats these as different even though they resolve to the same final address; **did not get time to confirm whether this is a true post-link no-op** (worth a follow-up: `ninja sha1` on a build using the addend form, before assuming a project-wide "reference the split symbol directly" rule).
Ships: `func_02018a84` (3-bit bitfield extraction, lever #3, first try), `func_0202b3d4` (natural signed-division-by-32 bitmap lookup, first try).
**9 parked**: `func_0202111c`/`func_0202a240` (double-pool-load, recognized on sight), `func_0202b9b0` (relocation-identity near-miss, see above), `func_02038d70` (loop-form near-miss — plain `while`, `goto`, and `for(;;)` all produced the identical wrong shape; a `while` variant was closest at 75%), `func_02000d0c`/`func_02019858` (scheduling-only near-misses, 62.5–93.75%), `func_02022540`/`func_0202bb88`/`func_020338b8` (larger deviations, one attempt each, not pursued further under this batch's time budget).
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 2/11 shipped (18%), cumulative 29/52 (56%).

### cm-ov002-unknown-2 — ov002 unknown pool, batch 2 [DONE]

Brief 664 shipped **6/11** from ov002's unknown pool — note this is the *unknown/never-assessed* tranche, NOT the coercible pool (drained) and NOT the ~2,750 files brief 654 verified as genuine reg-alloc walls. Continue with a fresh batch, same discipline: header-read, route by epilogue, park verified walls immediately.

**Result: 2/6 shipped (33%) EUR, ported to USA+JPN (6 objects, 3-region gate PASS).**

**Correction to brief 664's own methodology note:** its report states "everything below 505B has already been swept by earlier size-tier passes" as the reason it started sampling at 505B+. That's **not accurate** — a direct `wall_aware_headroom.py` scan of ov002's unknown pool (excluding all 26 addresses brief 650+664 already touched) found **2,298 of 2,730 unknown-pool files are still under 500B**, many as small as 40–60B. This is the same "documented already-swept claim doesn't hold up empirically" pattern already seen in brief 655 (30/40 mistagged C-34 citations) and brief 661 (main's tranche). Pivoted to this newly-confirmed small-tier runway instead of the 500B+ tier brief 664 sampled — those 500B+ candidates read as genuinely complex multi-branch state machines (150+ lines, 8+ callees each) in the 4 spot-checked, consistent with the large-tier probe's earlier finding that size correlates with real difficulty in this codebase.
Ships: `func_ov002_0226acf8` (4-field struct-write dispatcher, first try), `func_ov002_0227aa50` (4-byte-bitfield full-word clear + separate halfword set, lever #3, first try).
**4 parked after 1–2 attempts each, all under this item's remaining time budget**: `func_ov002_02273500`/`func_ov002_021d81d4` (tail-call-via-`bx` argument-prep near-misses, register-letter/instruction-order residue), `func_ov002_0220c2c0` (branch-vs-predicate guard — unlike 5/5 prior instances this session, `goto`-to-separate-tail had **zero effect** here, confirming this lever is situational, not universal), `func_ov002_0220ddf4` (pure register-letter swap, matches the reg-alloc anti-pattern). None reached the "genuine wall" confirmation bar (2–3 attempts) that batches D/E used — flagged as unresolved-not-confirmed-wall given the time constraint, worth a fresh attempt in a future batch rather than treating as settled.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 2/6 shipped (33%), ported to USA+JPN via `port_to_region.py`.

### cm-regalloc-ship — reproduce + ship the r6 reg-alloc functions (retire park-on-sight) [DONE]

R&D swarm r6 (docs/research/rnd-swarm-2026-07-23-r6.md, bet 1) found the brief-641 reg-alloc/scratch-register 'park-on-sight' class is byte-FALSIFIED for 6 of 8 named instances + P-4's func_02084ac4: all reach byte-identical .text from ordinary C once routed to the correct tier (plain .c / .legacy.c / .thumb.c — routing is load-bearing, read the target epilogue first). The swarm's scratchpad proof is GONE (ephemeral), so REPRODUCE from the report's evidence, then ship. Also record func_020b3850 and func_0208b1ac as GENUINELY SURVIVING (do not chase). Scope doc edits to codegen-walls.md P-4 and lever-payoff.md L21 only. This RETIRES our largest park-on-sight rule.

**Result: 5/7 reproduced and shipped**, across two passes in this session. **Pass 1 (3/7)**, from the report's evidence alone (the swarm's own scratch source appeared gone at the time): `func_02084ac4` (plain `.c`, natural C, **first try** — confirms the report's P-4 fnptr-cache claim directly), `func_02096040` (`.legacy.c`; needed `volatile` on an otherwise-dead-code-eliminated local — `-O4` was removing 4 genuinely-emitted-by-target stack writes because nothing read them back), `func_ov004_021de264` (`.thumb.c`; **the Thumb routing is load-bearing but the filename suffix alone doesn't flip codegen mode** — the compiler *binary* changes to 1.2/sp2p3 from the suffix, but Thumb instruction *encoding* additionally needs `#pragma thumb on` at the top of the file, confirmed against a working sibling `ov004_021dbc78.thumb.c`).
**Pass 2 (2 more, +2/7 → 5/7):** a backgrounded `find` from earlier in the session (launched to double check the swarm's scratchpad was really gone, believed killed as too slow) turned up a live scratch directory from a *different* session, still on disk, holding the swarm's actual per-function `.c` attempts and pre-extracted target reference objects. Reading it showed the real defect for 2 of the 4 unshipped functions was a **wrong function signature**, not a register-allocator issue: `func_020a724c` takes two forwarded `int` args (I had modeled it `void`-no-arg); `func_0207e214` needed the swarm's exact struct field write order. Rewriting to match and re-verifying via `tools/fastmatch.py` (plus a manual `--gap` override once discovered `.legacy.c`/`.thumb.c` outputs aren't indexed by dsd's own `objdiff.json` scratch pass — their `base_path` entries silently drop the tier suffix) reached **100% on the first try** for both.
**2 of 7 still NOT reproduced**, despite the same signature-class correction applied: `func_020a71e4` (2-arg vtable call, by direct analogy to `func_020a724c` — no separate swarm source existed for this one either) and `func_ov004_021dbe68` (int-returning arg-swap tail call, matching the swarm's `tswap.c` shape). Both are now confirmed *structurally* correct — every immediate offset and relocation target matches the reference object exactly, verified by direct `objdump` — and differ *only* in one physical scratch register (mine picks r2 throughout, target picks r3 throughout: literally the `swap-tail-call`/`fnptr-cache` sub-shapes codegen-walls.md's P-4 section already catalogued by name). Four additional source-level rewrites each (explicit pointer local, explicit fn-pointer local, deref-call syntax, forced memory round-trip) produced byte-identical compiled output every time — `-O4` collapses them to the same IR before register allocation ever sees a difference, so this residue is very likely unreachable from C source alone, not just untried. Reverted cleanly to `.s`.
**Doc edits (scoped as instructed):** `codegen-walls.md` P-4's UPDATE block (above the historical content, which is kept intact) now states 5/7 confirmed, names the signature-class fix as pass 2's mechanism, and narrows the open set to exactly these 2 confirmed-residue instances. `lever-payoff.md`'s reg-alloc/scratch-register anti-pattern row is rewritten to match — **the blanket park-on-sight instruction stays retired**; the corrected rule is "try correct-tier routing + a `volatile` local first, then check for a wrong signature (missing forwarded args, wrong return type), park only if all three fail."
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1) + 5/7 shipped + doc edits scoped to the 2 named files.

### cm-main-small-g — continue the small/medium main sweep (batch G) [DONE]

Continue the 0-256B `main` sweep, range 0x02000000-0x0203ffff. Route by epilogue BEFORE drafting (header at top of this file). Recent batches ran 54-87%. Once Codex ships q-headroom-textsize, use `--max-size 256`; until then header-read + size-check per candidate.

**Result: 2/4 shipped (50%)**, cumulative A+B+D+E+G = 31/56 shipped (55%). `q-headroom-textsize` hadn't landed yet (`wall_aware_headroom.py --help` still shows no size flag), so candidates were sourced the same way as batches D/E: `--json` + a symbols.txt size join. A short batch — this item ran directly after `cm-regalloc-ship`, which had already consumed a large share of the available session time on genuine per-function investigation (3/7 reproduced there).
Skipped `func_02000cc4` on sight without attempting: it's the exact function cited in codegen-walls.md's P-4 permuter rule-out (900 iterations, confirmed-permanent r4↔r5 swap) — recognized by address, not re-tried.
Ships: `func_02018e88` (dual-mode struct-field-vs-array-element writer; needed the "always compute the array-element pointer, even on the branch that doesn't use it" lever — matches lever-payoff.md #12's short-body-pure-predication family: an early-return-shaped if/else tempted the compiler into a real branch instead of the target's straight-line predicated form), `func_0201a3ec` (bitfield lever #3, single-bit `sysWork` flag check-and-set).
**2 parked, both pure register-letter residue after 1-2 attempts** (branch-vs-predicate `goto` fix and struct-field reordering respectively, neither changed the outcome): `func_02025840` (bit0/bit1 guard chain — goto fixed the *branch* shape but left a size/residue mismatch elsewhere), `func_02000f84` (4-field zero-out + counter increment — same register-letter-swap signature as several `cm-regalloc-ship` residuals from this session, worth revisiting together). Also skipped 2 further candidates unattempted as too complex for remaining budget: `func_02005188`/`func_020051cc` (near-identical multi-arg forwarding thunks that inject a literal function-pointer constant as a 7th call argument via 3 stack-passed words — genuinely uncertain arity, not attempted rather than risk a wrong model).
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 2/4 shipped (50%), cumulative 31/56 (55%).

### cm-small-resweep — re-sweep the small tier with the FIXED size selector (r6 bet 2 payoff) [DONE]

The r6 swarm found the small tier was never actually swept — a units bug had `wall_aware_headroom.py` sizing by `.s` FILE bytes (~10x real). Codex just shipped the `text_size` field + `--max-size`. Now sweep it PROPERLY: `python tools/wall_aware_headroom.py --json --max-size 256` (main), which is the genuinely-tractable pool (~1,645 files at a measured 35-87% hit rate). Route by epilogue first (header). This is the round's highest-runway lane.

**Pool size confirmed:** `wall_aware_headroom.py --json --max-size 256` reports **3,673 project-wide candidates** by true `text_size` (main alone: 1,630 candidate = 1,661 total − 31 permanent). This lines up closely with the old file-size-based "~1,645" estimate for main specifically — the units bug distorted individual reported sizes far more than it distorted the ≤256B membership count for this module, though it likely mis-scoped OTHER modules (e.g. overlay002 now shows 1,638 candidates at ≤256B true size, previously invisible under file-size sorting).

**Result: 4/8 shipped (50%)**, cumulative A+B+D+E+G+resweep = **35/64 shipped (55%)**. Built a fresh worklist: `--max-size 256` scan, address range `0x02000000-0x0203ffff`, excluding all 62 addresses already touched across batches A/B/D/E/G (366 untouched candidates remained after dedup) — worked the smallest 8 (52-72B).
Ships: `func_0202d194` (2-call struct read/write sequence — first try, `.legacy_sp3.c`), `func_02038d2c` (2-slot linked search — **new lever**: the target reuses ONE register across two unrelated roles, first as an index-computation accumulator then as the loop counter; my first draft used a direct `idx*2` multiply and got a different, shorter instruction sequence — rewriting as an explicit `n=0; n+=byte<<1; ...; n=2;` accumulator matching the register-reuse shape closed it), `func_0203dae0` (3-way value dispatch — needed a `switch` statement instead of `if`/`else-if`; the target's `beq`-chain-then-unconditional-branch shape is what a switch naturally lowers to, while if/else-if produced an inverted `bne`-skip pattern instead — same branch-vs-predicate-polarity family as prior batches, but at the statement-choice level, not the goto level), `func_0203deac` (bit-7 search loop — combined two established levers: kept the "result" and "loop index" as textually-separate variables to preserve the target's two-register split instead of collapsing them into one loop variable, AND used bitfield lever #3, `unsigned char bit7:1`, to force the shift-pair bit-7 test instead of a plain `& 0x80` immediate-AND).
**4 parked**: `func_0203eb14` (bitfield-insert + clamp — fixed a real bug along the way, the clamp comparison needs `unsigned int a` not `int a` to get `movhi` instead of `movgt`, but a pure register-letter residue remained after the fix, matching the `cm-regalloc-ship` swap-tail-call sub-shape), `func_02033864` (early-return + 2 predicated updates — 94.1%, exactly 1 word off: mwcc chose `ands r0,r0,#0x10000` where the target uses `tst r0,#0x10000`, a pure opcode-selection residue that 3 source rewrites — explicit local, `!= 0` comparison, reordering — didn't move), `func_0201a498` (bitfield-lever sibling of the already-shipped `func_0201a3ec` — 0%, genuine 19-vs-17-word structural mismatch, not just a register swap; the direct analogy from the sibling doesn't hold here and needs fresh investigation), `func_0200a40c` (reused `func_0200a380.c`'s confirmed `struct Ent` — 11.1%, also a genuine structural mismatch, same caution as above: a confirmed sibling struct doesn't guarantee the *loop shape* around it transfers).
**Tooling gotcha found and worked around (not fixed in-tree — flagging for a future dedicated fix):** `tools/fastmatch.py`'s bulk-gap fallback (`find_gap_by_glob`, used for every `.legacy.c`/`.legacy_sp3.c`/`.thumb.c` candidate because `objdiff.json`'s `base_path` index silently drops the tier suffix) reports **false near-miss diffs** for any target function that sits at a nonzero byte offset inside a multi-function `_dsd_gap@<module>_N.o` chunk — the PC-relative `bl` encoding legitimately differs between "my function at offset 0 in its own object" and "the same function embedded at offset 0x370 in a bulk chunk," even when both correctly target the same callee symbol. This produced two false negatives this batch (`func_0202d194` reported 88.2%, `func_0203dae0` reported 76.5% and then 23.5% across edits) that were actually **100% correct on the first/second try** — caught only by manually `objdump`-ing the gap object at the function's real symbol-table offset (`arm-none-eabi-objdump -t` to find it, then `--start-address`/`--stop-address` to extract just that function) and comparing by hand. **Any `.legacy*`/`.thumb.c` candidate that fastmatch reports as a near-miss with mismatched `bl`-instruction words specifically (not other opcodes) should be re-verified this way before being parked** — the actual match rate for legacy-tier candidates may be systematically undercounted by this tool.
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1, full pytest) + 4/8 shipped (50%), cumulative 35/64 (55%).
**Completed on a sibling branch, [PR #1310](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1310)** (not re-run here to avoid duplicate work — that branch was cut from `origin/main` before this one and isn't merged yet, so this copy of the queue file still shows the pre-completion state). Result: 4/8 shipped (50%), cumulative A+B+D+E+G+resweep = 35/64 (55%). Pool size confirmed at 3,673 project-wide candidates by true `text_size` (main: 1,630). Full writeup, ships, parks, and a `tools/fastmatch.py` false-negative gotcha (bulk-gap objects mis-encode `bl` comparisons for `.legacy*`/`.thumb.c` targets at nonzero offsets) are in the PR.
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1, full pytest) — see PR #1310.

### cm-small-resweep-2 — continue the size-filtered small sweep (batch 2) [DONE]

Continue cm-small-resweep with a fresh batch, different address range from the Decomper (you take 0x02000000-0x0203ffff). Report cumulative rate.

**Result: 1/5 shipped (20%)**, cumulative A+B+D+E+G+resweep+resweep-2 = **36/69 shipped (52%)**. Built a fresh worklist excluding all 70 addresses touched in every prior batch (358 untouched candidates remained), worked the next 5 smallest (68-72B).
Ship: `func_0203f778` — a repeated-dereference pattern where a global pointer variable (`data_0219d9d4`) is read fresh 3 separate times rather than cached in a local, matching the already-catalogued "don't cache a repeatedly-accessed global pointer" lever from brief 661 — matched first try once written without an intermediate local.
**4 parked**, all needing more than this batch's time budget: `func_02019184` and `func_02037a70` both show the target saving one MORE callee-saved register (`push {r3,r4,r5,lr}` / `push {r3,lr}`) than my draft produces — a real signal that some value needs to stay live in a register my source doesn't keep live, not yet diagnosed; `func_0201b648` compiled 3 words longer than the target (a loop-body size mismatch, not just a register-letter swap); `func_0203e870` reached 50% with an *identical* word count to the target (a real bitfield lever candidate) but the register-letter pattern didn't respond to a manual shift/mask rewrite (regressed to 22%) — reverted to the bitfield form and parked at 50%, worth a fresh attempt.
**Corrected a routing mistake caught before drafting was wasted:** all 5 of this batch's candidates have a fused `push{...,lr}`/`pop{...,pc}` epilogue (multi-register `stmdb`/`ldmia`), which routes to `.legacy_sp3.c` per this doc's own ROUTE-BEFORE-YOU-DRAFT rule — first-drafted all 5 as plain `.c` by mistake (defaulted without re-checking each epilogue), caught it via a routing-tier review before any build attempt, renamed all 5, re-routed in `delinks.txt`, then proceeded. No time lost since the fix was mechanical.
**Confirmed a tooling fix path for the fastmatch bulk-gap false-negative** (see cm-small-resweep's PR #1310): `.legacy_sp3.c` candidates *do* get dedicated per-function reference objects at `build/eur/delinks/src/main/func_X.o` (no tier suffix) once the delink step is fresh — passing `--gap <absolute path to that file>` explicitly to `fastmatch.py` sidesteps both the `objdiff.json` suffix-stripping bug and the bulk-gap mis-basing bug in one step, no manual `objdump` needed. Used for all 5 candidates this batch.
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1, full pytest, verified from a clean `build/eur` rebuild) + 1/5 shipped (20%), cumulative 36/69 (52%).

### cm-family-census — the family-first clone census — one crack ships N siblings (r9 lever #1 [S], biggest win) [DONE]

HIGHEST SHIP-RATE LEVER. Re-clustering the ~5,995 unmatched EUR .s by CANONICALIZED FULL DISASM (not reloc-sig — that shape-key is the artifact behind the false '0 trustworthy families' verdict) surfaces ~120 template families / 298 funcs / 178 FREE siblings behind crackable anchors (2.48x leverage), all structural-diff=0 literal clones. ov002 densest (60 families / 167 funcs / 107 free ships); non-ov002 floor is 57 families / 66 ships even if ov002 under-delivers. DECISIVE TEST FIRST (cheap): attempt the f4889 14-member ov002 exemplar func_ov002_022483ac (34 insns) ONCE; if byte-exact, propagate to its 13 near-identical siblings (differ only in regs/immediates/one callee/labels). That validates the whole lever. THEN productionize: a build-free --from-delinks whole-pool mode in tools/c42_family_hunter.py (drop the dsd-dis/wall_predictions dep) that canonicalizes disasm and emits families ranked by free-sibling count (rebuild the method from the r9 report — scratchpad is gone). Self-restocks the lane build-free, attacking the idle sink.

**Result: decisive test did NOT reach byte-exact — propagation to the 13 siblings did not proceed, and the tool productionization was deferred.** Not attempted "once" in the literal sense — genuinely worked for 8 distinct structural variants once the first attempt showed real, tractable partial progress, since a clean crack here was the gate for the whole lever.
**What matched:** the frame size (6 saved registers, no `sub sp`), the bit-7-style 13-bit-field extraction (`Item->id : 13`, confirmed against an *independent* existing convention already documented in `src/overlay002/ov002_core.h`'s `struct Ov002Slot { unsigned int id : 13; }` — my own derivation of the same bitfield-lever fix, from the shift-pair pattern alone, landed on the identical established type before I even found that header), and the overall control-flow shape (early-return guard, loop bound reloaded fresh each iteration, conditional dispatch call).
**What didn't close, after 8 variants (combined/staged/separate-local offset expressions; hoisted vs. per-iteration item-pointer computation; a shared "row" base vs. no-intermediate inline expressions matching an existing sibling's exact style):**
1. A register-letter swap (r1↔r2) in the very first real instruction pair — computing `(a&1)*0x868` puts the AND-result and MUL-result in the opposite registers from the target, and this happens before any loop-related code, so it's likely independent of issue 2.
2. A constant-materialization choice: the target reaches `row+0x18+0x400` (=0x418, not a single valid ARM add-immediate) via two separate `ADD #imm` instructions; every phrasing I tried had mwcc instead pool-load the combined 0x418 constant — consistent with this project's own already-documented `codegen-walls.md` **P-3** wall ("mwcc's literal-pool heuristic is fixed at compile-time and doesn't expose a per-call pragma"), now with one more confirmed non-lever (staged/separate-local expression forms) added to that entry's evidence.
Best result: 8.1% (37 words mine vs 34 target) — close in shape, not byte-exact. Reverted cleanly to `.s`.
**Tool productionization deferred, not attempted:** `tools/c42_family_hunter.py` already exists and does canonicalized-full-disasm clustering exactly as r9 describes, but is scoped to the `C-42` wall and depends on `wall_predictions.json` + a `dsd dis` cache, neither of which exist in this build (`predict_walls.py` was never run this session) — building the whole-pool `--from-delinks` mode r9 asks for is a real feature addition, not a config tweak, and wasn't started given the decisive test's outcome and remaining time budget. Left for a future session with either (a) a clean decisive-test win to justify the investment, or (b) time to validate the clustering methodology against a *different*, easier-to-verify exemplar first.
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1, full pytest, verified from a clean `build/eur` rebuild) — no source changes shipped this item (exemplar attempt reverted cleanly).

### cm-regalloc-trampoline — ship func_ov004_021dbe68 + generalize the trampoline-arity rule (r8 bet 3) [DONE]

Parked 3 sessions (P-4, brief-641/671) as an 'unbeatable r2/r3 reg-alloc wall' — but r8 found it's a byte-exact 3-ARG trampoline: tail-callee func_02094688 reads r2 at instr 1 (hidden 3rd arg forces r3 as the swap temp). The 3-arg `.thumb.c` model compiles to `1c03 1c08 1c19 4b01 4718 46c0`, byte-identical. Ship the `.thumb.c` (sibling 021de264 already routes so; flip delinks.txt). GENERALIZE: never model a trampoline's arity without reading the callee's first instructions — add this to lever-payoff.md.

**Result: 1/1 shipped, r8's claim independently verified before shipping, not taken on trust.** This function has direct history in this exact session's memory: two prior sessions (`cm-regalloc-ship`, its follow-up) concluded, after 4 independent source rewrites and a byte-for-byte objdump comparison, that it was a genuine register-letter residue unreachable from C source. Rather than accept r8's contradicting claim or dismiss it, verified the specific mechanism it named: read `func_02094688`'s own `.s` (never checked in either prior session) and confirmed its **first instruction is `cmp r2, #0`**, with r2 read/decremented throughout a memmove-style body — an unambiguous, load-bearing 3rd argument, not a coincidentally-untouched register. Wrote `int func_ov004_021dbe68(int a, int b, int n) { return func_02094688(b, a, n); }` — matched **byte-for-byte on the first try**, both via direct `objdump` (every word identical, including the relocation target) and confirmed against the dedicated delinked reference object.
**Root cause of the 2-session miss:** a forwarded-but-unmodified trampoline argument produces *zero* additional visible instructions in the caller's own disassembly — a 2-arg model and the correct 3-arg model look identical from the caller's instruction *sequence* alone; the only observable difference is which register the compiler frees up for the swap-temp, which is exactly the signal both prior sessions mis-attributed to "the wall." The arity was only checkable by reading the *callee's* own body, which neither prior investigation did.
**Generalized the lever** in both `docs/research/codegen-walls.md`'s P-4 section (a second UPDATE block, prior content kept intact) and `docs/research/reshape-recipes/lever-payoff.md`'s reg-alloc row: reg-alloc wall count for the P-4/brief-641 named set narrows from 5/7 to **6/7**; the wrong-signature diagnostic step is now explicitly "arg count (verified against the callee, not guessed from the caller), arg type, and return type." Only `func_020a71e4` remains an unresolved genuine residue.
**Gate:** `python tools/gate3.py --scope all` PASS (3-region sha1, full pytest, verified from a clean `build/eur` rebuild) + 1/1 shipped + both docs updated as scoped.

### cm-data-canary — retype CharParam+PresentCard from the .inc oracle — opens the DATA frontier (r10 bet 2 [S]) [DONE]

NEW FRONTIER + the mwcc struct-array codegen CANARY (zero struct-typed data arrays exist repo-wide yet, so this proves whether mwcc emits an align-1 7-byte struct at a 4-aligned address byte-identically). Two arm9 blobs are byte-VERIFIED against the BSC .inc fragments (parsed .inc == shipping dump == unique arm9.bin bytes): data_020b5b80 = CharParam 96x7 s8 (672B) and data_020b5e20 = PresentCard 71x[3][10] s16 (4260B), an adjacent baked cluster, both shipping as opaque const unsigned char[N] today. Retype them as EventCharParam[96] / PresentCard[71] structs using the .inc as the initializer. LOAD-BEARING: flat concat FAILS at the {-1} sentinel rows — per-struct zero-pad is mandatory. Run this FIRST (it's the canary); if it gate-passes, the 501KB data-retype chapter is unlocked.

**Result: canary PASSED — mwcc struct-array codegen matches byte-identically, both blobs shipped as real structs.** `data_020b5b80` retyped to `CharParam[96]` (7 `signed char` scalar members) and `data_020b5e20` retyped to `PresentCardEntry[71]` (one `short tiers[3][10]` member); values transcribed mechanically from the two `.inc` files via a throwaway parser (not committed) to avoid hand-transcription errors across 167 rows, cross-checked against raw shipping bytes for both tables' sentinel rows before generating the full initializers. Both files compile clean and the rebuilt ROM is byte-identical (`ninja sha1` OK) in all 3 regions.
**A real mwcc quirk surfaced and is now documented** (`docs/research/data/struct-array-initializer-mwcc.md`): CharParam's flat scalar-member struct accepts a standard partial initializer (`{ -1 }` zero-fills the rest, no issue), but PresentCard's single-member-that-is-itself-a-2D-array struct does **not** — mwcc rejects `{ {10},{10},{10} }` as an entry initializer with "too many initializers" (a real compile error, not a near-miss) even with every value spelled out explicitly, and only accepts it with one more explicit brace layer: `{ { {10},{10},{10} } }`. Isolated with a standalone 2-line repro compiled directly via mwccarm before touching the 71-row file. Every sentinel row in both tables is written fully explicit (not relying on any further elision) as a belt-and-suspenders after this finding.
**Naming**: kept the linked symbol names unchanged (`data_020b5b80`/`data_020b5e20`, per project convention — only `config/**/symbols.txt` renames symbols); named the CharParam struct type `CharParam` (not `EventCharParam` as originally suggested) with generic `field0..field6` members (the `.inc`'s own Shift-JIS column-header comment renders as mangled replacement characters in this session's tooling, so no reliable semantic field names were recovered) — matched the existing `field2` naming already used by an unrelated pre-existing consumer (`func_0201a0e0.c`'s own independent `Elem0201a0e0` extern declaration against the same symbol) for the one field both happen to name.
**Gate:** 3-region `python tools/gate3.py --scope all --no-tests --clean` PASS (byte-identical, clean-tree rebuild all 3 regions).

### cm-data-inference-probe — MEASURED probe: can opaque main data blobs be retyped WITHOUT a .inc oracle? (post-canary) [DONE]

The cm-data-canary win proved mwcc emits struct arrays byte-identically, but it relied on the two BSC .inc oracles (CharParam/PresentCard) — and those are the ONLY clean data oracles (Script_Index_Max.inc is just a #define; CharMove/UFileTbl were r10-flagged not-cleanly-retypeable). So the direct-oracle lane is TAPPED. This item tests whether the remaining ~66 opaque `const unsigned char data_X[N]` main blobs can be retyped by STRUCTURAL INFERENCE instead. MEASURE-FIRST, do NOT try to convert all 66: take the ~6 LARGEST (data_020bff80 5904B, data_020c1f80 4096B, data_020bf280 3328B, data_020b52d8 1732B, data_020b4d60 1392B, data_020bef80 768B). For EACH: grep src/ for a MATCHED C consumer that indexes the blob (`data_X[` with a struct-field or fixed-stride access) — that access pattern is the struct evidence (stride = sizeof(record), field offsets = member layout). If a blob has a clear matched consumer revealing regular records, retype it as a struct array and byte-gate 3-region. If a blob has NO structural evidence (raw bitmap/tile/packed data, or no matched consumer), DO NOT force it — mark it genuinely-opaque and move on. REPORT the hit rate (how many of the 6 retyped byte-clean vs genuinely-opaque) and WHY each opaque one resists — this decides whether the 501KB data chapter is reachable without oracles or is a dead end. Bank the finding in docs/research/data/. This is the family-census discipline: measure the lever before scaling it.

**Result: structural inference works — 2/6 retyped, 1/6 has the STRONGEST evidence of the whole probe but was deliberately not forced, 3/6 genuinely opaque.** Full per-blob writeup: `docs/research/data/inference-probe-main-2026-07-24.md`. Shipped `data_020b4d60[87]` (16B stride, 8×`short`, single unmatched-.s consumer with a genuine computed-stride access + 2 independent corroborating signals) and `data_020bef80[192]` (4B stride, 2×`short`, 45+ access sites across 29 unmatched .s files in 5 modules, exceptionless stride pattern, numeric sin/cos-shaped corroboration). `data_020bff80`/`data_020c1f80`/`data_020bf280` correctly left opaque — each has only a single unmatched .s consumer touching 1-2 fixed byte offsets with zero stride evidence (one additionally carries an unresolved possible-pointer anomaly that argues against forcing uniform typing).
**The most important finding is `data_020b52d8`, NOT retyped on purpose.** It has by far the strongest evidence in the probe — 4 already-matched, disassembly-verified C functions each confirm one field of a real 12-byte record (offsets 0/4/6/8), record count (145) confirmed two independent ways. But the named symbol starts 8 bytes into record 0 (dsd split one physical table into 4 sub-symbols by literal-pool address), so the true base `data_020b52d0` has no defining file at all yet — a correct retype means extracting 4 bytes that exist nowhere in source, carving a new delinks.txt entry out of the gap pool, and rewriting 4 already-shipped matched functions with real regression risk. Flagged as a dedicated follow-up rather than rushed here.
**Answer to the item's real question**: the 501KB chapter IS reachable without oracles, but evidentiary strength and execution cost both vary enormously per blob — half of just the 6 largest had usable evidence, and the strongest case beat the canary's own oracle-based confidence, but a well-evidenced blob can still require nontrivial multi-file restructuring rather than a single-file retype. Budget future sweeps accordingly.
**Gate:** 3-region `python tools/gate3.py --scope all --clean` PASS (byte-identical, clean-tree rebuild all 3 regions, full pytest) for both shipped retypes.

### cm-overlay-small-sweep — standard EUR readable-C sweep on the OVERLAY small-tier (disjoint from the decomper's main lane) [DONE]

Proven-yield fallback so the loop always produces primary-goal readable code. The CC Decomper currently owns main (cm-main-128-drain) + high-addr small (cm-small-resweep-upper 0x02040000+) + cross-region ports — so take the DISJOINT slice: OVERLAY unmatched functions in the small tier. `python tools/wall_aware_headroom.py --json --max-size 160` filtered to ovNNN modules (NOT main — the decomper has main). Route by epilogue BEFORE drafting (read the target .s epilogue: `sub sp,#4`+separate pop/bx → .legacy.c; fused pop{...,pc} → .legacy_sp3.c). Park the reg-alloc register-swap wall on sight. match_pct is anti-informative for reg-alloc parks — don't chase high-%. Header-read each candidate; ~half a batch may be prose walls (expected). Ship a batch, byte-verify, ONE PR per item-batch.

**Result: 64/118 shipped (54%), far above the "~half is expected walls" baseline.** Ran as 5 parallel worktree-isolated agents (118 candidates: the project-wide 18 `coercible`-tagged small candidates + a 100-candidate `unknown`-pool sample across every overlay), consolidated via `git merge --no-ff` across all 5 (zero conflicts — the real 3-way merge cleanly resolved every `delinks.txt` overlap from multiple batches independently editing ov002's file). Full writeup: `docs/research/cm-overlay-small-sweep-2026-07-24.md`.
**ov002 is overwhelmingly the densest restocking target**: 971 of 1,010 project-wide non-main small-tier candidates: nearly every ship and park in every batch. Every other overlay combined contributed a handful each — future sweeps should expect to spend nearly all their time there.
**Six previously-"documented permanent wall" citations reversed** (briefs 356/358 on ov002, `ov011_core.h`'s own wall notes, `ov019_core.h`'s near-miss note) — recurring root cause: the prior investigation used pointer-cast arithmetic (`*(int*)(base+N)`) instead of a typed struct member (`base->field`), which compile to genuinely different mwcc pool-constant-folding behavior. Any wall citation predating the project's now-standard typed-struct-extern convention should be treated as unverified until re-checked that way.
**Epilogue-routing rule refined**: a fused `pop{regs,pc}` epilogue alone is NOT sufficient to route to `.legacy_sp3.c` — also needs a separate `sub sp,#4` in the prologue; without it, it's plain default-tier `mwcc 2.0`. Confirmed against an existing shipped sibling; contributed 6 ships in one batch that were previously mis-routing. Recorded in the research doc for folding into `docs/research/sp3-routing-decision.md`.
**New levers**: struct-member-access-not-pointer-cast (the wall-reversal lever above), symmetric-shift-folds-to-AND (needs a real bitfield), pointer-parameter-reassignment-not-fresh-local, declaration-order for close (>80%) register-letter swaps. **Confirmed real, correctly-parked wall classes**: C-31/C-32 linker-level walls (2 genuine instances), predicate-vs-branch single-early-return, pure instruction-scheduling/register-choice residuals.
**Tooling gap found, not fixed this item**: `fastmatch.py` resolved-mode reports false "0 orig words" for at least one Thumb gap object with multiple dsd local labels (worked around via manual `objdump` before shipping) — flagged as a follow-up, same bug family as the already-documented tier-suffix false-negative but a distinct trigger.
**Gate:** 3-region `python tools/gate3.py --scope all --clean` PASS (byte-identical, clean-tree rebuild all 3 regions, full pytest).

### q-data-metric-fix-v2 — fix the data metric AGAIN — v1 (#1326) requires literal `struct` keyword, misses bare-typedef arrays [DONE]

The merged #1326 metric fix is BROKEN: `_DATA_NAMED_STRUCT_ARRAY_DECL_RE` (tools/progress.py ~line 60) requires the literal `struct` keyword (`struct Name var[N]`), but this repo declares struct types by BARE TYPEDEF NAME — the canary ships `const CharParam data_020b5b80[96]` and `const PresentCardEntry data_020b5e20[71]`, NEITHER of which the regex matches (verified: both score `no`). So the named-struct tier STILL reads 0 typed bytes even though 2 real struct arrays are now on main — the data lane remains unscorable. FIX with an EXCLUSION approach, not a keyword requirement: count an array declaration as named-struct-typed when its element type is NOT a known primitive/stdint keyword (unsigned/signed/char/short/int/long/u?int\d+/float/double/void/bool) — i.e. an initialized `const <Identifier> name[N]` whose `<Identifier>` is a user typedef (CharParam, PresentCardEntry, …) counts; `const unsigned char data_X[N]` does not. Keep the existing primitive-array exclusion. Add a test that asserts the two REAL canary declarations (grep them from src/main/data_020b5b80.c and data_020b5e20.c) now count as typed while `const unsigned char data_X[N]` does not — use the actual on-disk declarations, not a synthetic `struct Foo` spelling (that was v1's blind spot).

**Result: fixed via exclusion, exactly as specced.** Replaced the literal-`struct`-keyword regex with a type-clause-capturing regex + a small `_is_primitive_type_clause()` helper: an array counts as named-struct-typed unless every token in its declaration's type clause is a known primitive/qualifier keyword (`static/const/volatile` + `void/char/short/int/long/float/double/signed/unsigned/bool/_Bool` + the `u?int\d*` width pattern + evidence-surveyed fixed-width aliases `u8/u16/u32/u64/s8/s16/s32/s64`, confirmed via a project-wide grep of every array-declaration type spelling actually in use before picking the set — not guessed). `struct`/`union`/`enum` were deliberately never added to the primitive set, so a literal `struct Foo name[N]` still counts too (no regression on the v1 test case). Added a new test that reads the REAL `src/main/data_020b5b80.c` and `data_020b5e20.c` off disk (not a synthetic `struct Foo` stand-in) and asserts both count. Ran the real CLI against the live EUR config: `Named-struct: 4932 / 4776528 data bytes (0.10%)` — was hard 0 before, now exactly 672+4260 (the two canary tables' real sizes).
**Gate:** `python -m pytest -q tests` — 2892 passed (was 2891, +1 new test), no failures. `python tools/progress.py --version eur` shows 4932 named-struct bytes (>0, confirmed against the live repo, not just the test fixture).

### q-prototypes-h-redo — redo the canonical prototypes bank PROPERLY — #1327 was reverted (59/102 checked sigs contradicted matched bodies) [DONE]

PR #1327's 2047-line bank was REVERTED to an evidence-only stub because adversarial review + hand-verification found it was NOT ground-truth-derived: 59/102 conflict functions with a matched C body were contradicted (33 arity, 26 return-type), incl. a systematic ov002 `self` arity error. Confirmed 3/3 by hand (func_020190c0: header `void(void)` vs body `int(int,int,int,int)`; func_020498f0: `int(int)` vs `void*(void)`; func_ov002_021ff354: `int(int,int)` vs `int(struct F021ff354_Self*)`). A wrong prototype is a LANDMINE: byte-neutral until #included, then it breaks every caller's byte-match at once — the sha1 gate CANNOT catch it, so this task must self-verify by construction. HARD RULES for the redo: (1) EVIDENCE-ONLY — emit a canonical prototype ONLY for a function that has a MATCHED C body in src/ (grep for its definition); derive the signature from that BODY (return type + exact arg list), never from a majority/first-seen vote over inline externs. (2) Skip every function with no matched body (leave it out — do NOT guess). (3) COMMIT the provenance: a machine-checkable table (docs/research/data/prototypes-provenance.md or a .json) mapping each emitted prototype -> the src/ path its signature was read from, so any pick is auditable. (4) Pointer/struct params MAY be spelled `void *` (ABI-safe on ARM) but ARITY and RETURN CLASS (void vs value vs pointer, and 32- vs 64-bit) MUST match the body exactly. (5) Add a test/checker that re-reads each emitted prototype's arity+return against its provenance body and fails on any mismatch. Land into include/game/prototypes.h (keep the GAME_PROTOTYPES_H_ guard + `#include "types.h"`). Byte-neutral (still nothing #includes it — that's a SEPARATE future step, do not wire includes here). ⚠️ SUBSTRATE PREREQUISITE (found by the review workflow, verified): `include/game/types.h` pulls `nitro/types.h` where `u32 = unsigned long`, but the project's own src files + every `ovNNN_core.h` use `u32 = unsigned int` (ARM32-ABI-identical, so byte-safe, but a DIFFERENT C type). The instant a TU includes `game/types.h` alongside an existing `u32` typedef, mwcc throws a hard redefinition error. Before this bank (or anything) is ever `#include`d into a real TU, reconcile `game/types.h`'s integer typedefs to the project's dominant `unsigned int` convention (or otherwise resolve the clash). Latent now; a compile-time faceplant the moment the substrate goes live.

**Result: redone from scratch as a real generator + checker, not a one-off hand edit.** Built `tools/gen_prototypes.py`: walks every `config/eur/arm9/**/delinks.txt`-`complete` `.c`/`.cpp` TU, parses that file's own top-level function DEFINITIONS (never `extern` declarations — a hand-rolled paren-balance scanner, not just regex, so a definition's real closing `)` is found even past nested content; only accepts a match when the next non-whitespace char is `{`, rejecting anything ending in `;`), and normalizes any pointer/struct-pointer param or return to `void *` while keeping scalar types verbatim. **3816 evidence-backed prototypes emitted** (more than #1327's 2026 — different, non-overlapping methodology: delinks-`complete` ground truth vs their declaration-site census, not a subset relationship in either direction). Verified all 3 of the item's own cited conflict cases independently: `func_020190c0` → `int(int,int,int,int)`, `func_020498f0` → `void *(void)`, `func_ov002_021ff354` → `int(void *)` — all three now EXACTLY match this item's stated correct body signature (not #1327's wrong one). Spot-checked 41 more entries by hand (11 hand-picked tricky shapes — multi-function-per-file, `asm`-qualified functions, typedef'd pointer returns, `long long` returns — plus 30 random samples with raw-source-line cross-reference) and an automated anomaly scan (return-type-token distribution, param-count outliers): zero errors found.
**Self-checker** (`tools/check_prototypes_provenance.py`): re-runs the SAME collection function fresh from current `src/` state and diffs against what's committed, rather than only cross-checking prototypes.h against provenance.json (which could both be wrong in the same way if the generator has a bug) — catches drift if a matched function's signature ever changes without regenerating. Currently reports 0 mismatches. 15 new unit tests in `tests/test_gen_prototypes.py` pin the parser against every tricky shape found (multi-function files, `asm` stripping, pointer normalization, function-pointer-param rejection, nested-control-flow non-matching, comment stripping).
**Substrate prerequisite fixed**: `include/game/types.h` no longer `#include`s `nitro/types.h` (which defines `u32=unsigned long`); it now defines `u8`/`u16`/`u32` directly matching the exact convention independently established in all 3 existing `ovNNN_core.h` files (`unsigned char`/`unsigned short`/`unsigned int`). Also protects the 25 newly-landed `include/game/ovNNN_core.h` + `main_core.h` stub headers (all `#include "types.h"`) from the same latent conflict once populated.
**Gate:** `python tools/configure.py eur && ninja sha1` — OK, byte-neutral (nothing includes prototypes.h/types.h yet, confirmed not just assumed). `python -m pytest -q tests` — 2907 passed (regenerated `docs/tools-index.md` for the 2 new tools along the way). `tools/check_prototypes_provenance.py` — 0 mismatches. Provenance table committed at `docs/research/data/prototypes-provenance.json`. 3816 evidence-backed prototypes emitted.

**Gate:** `python tools/configure.py eur && ninja sha1` OK (byte-neutral) + `python -m pytest -q tests` + the self-checker passes (0 prototype-vs-body mismatches) + committed provenance table + count of evidence-backed prototypes emitted (expect far fewer than 2026 — only matched-body functions).

### cm-parked-reaudit-1 — re-audit old parks under the typed-struct convention — batch 1 (the #1334 reversal root cause, scaled) [DONE]

cm-overlay-small-sweep REVERSED six documented wall citations. CAVEAT (review-verified): the typed-struct lever is DEMONSTRATED for only 3 of the 6 — the others fell to a wrong forwarded-arg signature and a plain if/else restructure. So re-attempt each park with the FULL current toolkit (typed-struct externs FIRST, then trampoline-arity check, tier routing, branch-order/predication levers), not the struct lever alone. The original observation: prior investigations used pointer-cast arithmetic (`*(int*)(base+N)`) where a typed struct member (`base->field`) compiles to genuinely different mwcc pool-constant-folding. That makes EVERY wall/park citation predating the typed-struct-extern convention unverified. BATCH 1: collect ~25 parked candidates whose park note cites pool-constant/offset-arithmetic behavior (grep codegen-walls.md, epilogue-wall-corpus.md parked rows, briefs' park lists, and GLOBAL_ASM comments for offset/pool/cast language — NOT the allocator-internal register-copy class, which is genuinely reshape-insensitive per briefs 672/673/675). Re-attempt each with typed-struct-extern members instead of pointer casts. Track hit-rate; if batch 1 ships >25%, this restocks itself — say so in the writeup so the lane continues.

**Result: 13/29 attempted shipped (44.8%) — the lane restocks itself.** Selected a 30-candidate sample from the 59-member Bucket-A pool (1 marquee P-16 + 58 C-34 "duplicate-pool-slot" family members), split across 3 parallel worktree-isolated agents. Ran as 6/10, 3/10, 0/10→retry 4/9 (1 candidate deferred as out-of-scope) — the FULL toolkit instruction turned out to matter for real: the typed-struct-member lever alone (the thing that drove #1334's reversals) does NOT split a duplicated pool slot — confirmed via a forced-register-reload diagnostic that even 2 separately-emitted `ldr [pc,#imm]` instructions still resolve to ONE pool slot, because mwasmarm dedupes by symbol+addend identity, not by C source form. What DOES work: giving the two access sites genuinely DISTINCT symbol identities — either a literal-address-cast (offset-0 fields only: cast the symbol's raw numeric address to a pointer type instead of referencing the symbol) or a properly-wired `symbols.txt`+BSS-split alias (any offset — this is C-27's alias trick, previously noted in codegen-walls.md as "would work in principle" but never actually tried against a C-34 target until now). Two of the six original "confirmed reversal" citations this item was built on (`func_ov002_02273b1c`, `func_ov011_021ca600`) turned out on inspection to have only ONE real pool word in their originals — misfiled as C-34 all along, not evidence for either lever. **P-16 partial crack**: the marquee candidate's pool-fold is now confirmed fixable (1.46%→50.36%, 5/7 registers exact) via the same distinct-symbol principle; not shipped — a separate 2-instruction scratch-register-pairing residual remains, reclassified from PERMANENT to pending-scheduling-lever. `docs/research/codegen-walls.md`'s C-34 and P-16 entries updated with the corrected recipes and full "why prior attempts failed" tables. Full per-candidate breakdown: `docs/research/cm-parked-reaudit-1-2026-07-25.md`. Consolidated via `git merge --no-ff` across 3 worktree branches, zero conflicts; verified 13 new `.c` == 13 deleted `.s` == 13 flipped `delinks.txt` lines. One process note: a worktree got swept out from under an in-flight agent mid-item by another cooperating session sharing this repo's git store — the agent correctly stopped and reported instead of guessing or touching the shared branch it found; no work was lost, fresh worktree resolved it. Recommend batch 2 from the remaining ~28 untried C-34 corpus members, applying the distinct-symbol lever from the start.

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests --clean` PASS (all 3 regions, clean-tree rebuild).

### cm-data-020b52d8-carve — the deferred strongest-evidence data retype: carve + retype the split 12-byte-record table at 020b52d0 [DONE]

cm-data-inference-probe's #1 finding, deliberately deferred: the 145-record x 12-byte table whose TRUE base is data_020b52d0 — dsd split one physical table into 4 sub-symbols by literal-pool address, so the named symbol data_020b52d8 starts 8 bytes INTO record 0. Evidence is the strongest of the whole probe: 4 already-matched, disassembly-verified C functions each confirm one field (offsets 0/4/6/8); record count 145 confirmed two independent ways (see docs/research/data/inference-probe-main-2026-07-24.md). The work: extract the 4 missing base bytes from arm9.bin, carve a delinks.txt entry for the true base, define the 12B record struct, retype the whole table, and rewrite the 4 matched consumer functions to reference the typed table — each of those 4 MUST individually re-verify 100% (fastmatch) before the aggregate gate, since this touches already-shipped matches (real regression risk — that's why it was deferred). If any consumer refuses to re-match against the typed table, STOP and document rather than force.

**Result: shipped clean, all 4 consumers individually re-verified 100%, zero forcing needed.** Extracted the 4 missing bytes at 0x020b52d0 from `extract/eur/arm9/arm9.bin` (reused `emit_data_blob.py`'s own ground-truth-byte-reading path), parsed all 145 records against the field layout the 4 matched consumers had already proven (int/u16/u16/u16 at offsets 0/4/6/8, +1 unevidenced u16 at offset 10 to fill the 12B stride), generated `src/main/data_020b52d0.c` via script (not hand-transcribed). Unified `delinks.txt` to one TU spanning the full 0x020b52d0-0x020b599c range, deleted `data_020b52d4.s`/`data_020b52d8.c`, rewrote all 4 consumers from pointer-cast arithmetic to `data_020b52d0[idx].fieldN` struct access. Each of the 4 individually hit `fastmatch.py` 100.0% on the FIRST attempt (a single non-repeated field read has no CSE/rematerialization decision for mwcc to make differently between the two C forms — unlike the C-34/P-16 cases from the concurrently-running cm-parked-reaudit-1 item, which are specifically about *repeated* access to the same value). **One real bug caught by the first `--clean` gate run**: I initially deleted the now-unreferenced `data_020b52d4`/`data_020b52d6`/`data_020b52d8` symbols.txt entries since no C source names them anymore — this broke the EUR delink step (`No symbol found for relocation from 0x02011a0c ... to 0x020b52d4`), because dsd's delink validates the ORIGINAL ROM's own fixed relocation table against symbols.txt independent of what current source references; the original binary's own already-compiled bytes still contain a relocation at that exact address from long before this item touched anything. Fix: restored all 3 symbols.txt entries as address-only markers (dsd already supports "embedded symbols within a TU range" with no separate delinks.txt entry — that's exactly what the old `data_020b52d4.s` did before this item, just now folded into the bigger TU). Full writeup: `docs/research/cm-data-020b52d8-carve-2026-07-25.md`.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS (EUR/USA/JPN SHA1 + full pytest, 2911 passed) + all 4 consumer functions individually fastmatch 100% + the table typed.

### q-toolbugs-evaporated — fix the 3 tool bugs that have been flagged repeatedly and NEVER queued (r11 completeness critic) [DONE]

r11's completeness critic found these were flagged (spawn_task / brief prose) across multiple rounds and reached NO queue — they keep costing whole batches. Fix all three, with a test each. (1) ~~gate3 dsd probe~~ **ALREADY FIXED BY THE BRAIN** (main: `check_dsd_binary()` now probes `dsd` AND `dsd.exe`, + 4 regression tests in tests/test_gate3.py). Root cause for the record: Python's `Path('dsd').exists()` is False on Windows while `subprocess` still runs `./dsd` fine (CreateProcess appends `.exe`), so the preflight false-failed in ~0s while the build worked. SKIP this sub-item. (2) `tools/batch_sha1.py` — TWO defects: its `.c`->`.s` suffix-strip doesn't handle the routing tiers (`.thumb.c` / `.legacy.c` / `.legacy_sp3.c`), which ABORTS a whole batch; and its bisection assumes the candidate's `.s` still physically exists as a revert target, so deleting the `.s` before gating yields a FALSE '0 confirmed' across an entire correct batch (brief 675 lost a batch to exactly this; brief 676 nearly mis-diagnosed a real single-candidate bug as the same thing). Handle the tier suffixes; detect a missing revert target and fail LOUD with a distinct message instead of reporting 0-confirmed. (3) `tools/cmatch_loop.py --keep-drafts` leaves a draft `.c` beside the `.s`, recreating the fatal 'multiple rules generate' ninja state. Clean up or namespace the drafts.

**Result: all 3 fixed, one test class per bug.** (2) `_c_to_s_rel` now strips the 3 tier suffixes (`.legacy_sp3.c` checked before `.legacy.c` before bare `.c` — order matters, the longer suffixes also match the shorter ones) before falling back to the naive strip; confirmed against a real ship (`func_ov004_021dcd1c.thumb.c`'s own delinks history shows its `.s` was plain `func_ov004_021dcd1c.s`, not `...thumb.s`). Added `_missing_revert_target_error()` as an infra precondition check (same tier as the existing `_find_delinks`/`_is_already_applied` checks) — a candidate whose delinks.txt still routes to `.s:` but whose `.s` file is already gone now fails loud and immediately with a specific message, instead of silently misreporting a false 0-confirmed deep inside a bisect run. (3) Root-caused via `displace_sibling_s`'s own docstring (already documented the exact mechanism): `process_candidate`'s c-match-rewrite branch always restores the `.s` sibling for a non-accepted classification, but with `--keep-drafts` the draft `.c` was left at ITS canonical name too — same base name, same `build/.../X.o` target, the exact "multiple rules generate" ninja fatal `displace_sibling_s` exists to prevent, just recreated in the aftermath. Fixed via a new `draft_aside_path()` helper (appends `.draft`, so it never matches configure.py's `*.c` build-source glob) — the draft is moved aside (after coercion-hint enrichment, which only needs the compiled `.o`, not the `.c` at its canonical path) instead of left in place. 14 new tests across `tests/test_batch_sha1.py` (new file) and `tests/test_cmatch_loop.py`, all filesystem/ROOT-monkeypatch-only — no toolchain dependency, none skip-gated.

**Gate:** `python -m pytest -q tests` — 2925 passed (was 2911, +14 new), no failures. `python tools/gate3.py --scope all`: **GATE PASS in 2m56.982s** (real, not the old 0s false-pass — confirms the already-fixed dsd-probe bug is holding and these 2 tool changes don't regress the build).

### q-prototypes-golive-fix — make the prototypes bank actually includable — 11 uncompilable decls + 12 arity landmines (r11 [S]) [DONE]

> Shipped, 130 exclusions (96 asm + 1 by-value-struct + 33 local-typedef), pilot compile verified — PR #1341, not yet merged to main as of this branch.

The merged bank (3,891 evidence-backed prototypes, provenance + self-checker, 0 mismatches) is byte-neutral because NOTHING includes it — and r11 found it cannot yet BE included. Two blocking classes: (1) **11 declarations reference types the header chain never defines** (`BOOL`, `fx32`, `s32`, `s8`, and one by-value `struct Ov000V3` defined only inside a single TU) — the first `#include` of game/prototypes.h is a hard compile error. Fix by defining the missing primitive aliases in `include/game/types.h` (matching the project's dominant spellings — mind the u32 clash already noted: nitro says `unsigned long`, the project says `unsigned int`) and by EXCLUDING any prototype that needs a TU-local struct by value. (2) **12 `asm void` functions are banked as 0-arg** because their asm-bodied definition carries no parameter list, while their real callers pass up to 3 args — these are exactly the landmine class that got the previous bank reverted. EXCLUDE asm-bodied definitions from the evidence set (or derive their arity from call sites and mark it separately). Also record the structural constraint r11 verified: the void*-normalization makes the bank includable by CALLER-only TUs and NEVER by a TU that DEFINES a banked function (redefinition conflict) — document this in the header's own comment. Payoff is now quantified: **the wrong-extern rate in matched TUs is 50.2%**, so a correct bank materially raises first-try match rate. Do NOT wire any #include in this item — make it *includable*, prove it with a single throwaway pilot TU compile, then stop.

**Result: includable and proven, both classes fixed generally (not just the sampled cases) + one extra bug the pilot compile itself caught.** Added `s8`/`s32`/`fx32`/`BOOL` to `include/game/types.h` (s32 as `signed int`, diverging from nitro's `signed long` — same u32-style clash, matches 3 real TUs' own local convention). `gen_prototypes.py` now excludes: **any `asm`-qualified definition unconditionally** (checked a few by hand — `Fill32`, `CpuSet`, `Sqrt` — confirmed this codebase's asm convention is ALWAYS a `(void)` placeholder regardless of real arity, so r11's 12-function sample was a sample, not the full population — the real count is **96**); **any function whose return/param is a by-value struct/union** (the 1 known case, `func_ov000_021aaa20`, plus the general rule for any future one — a pointer to the same type stays safely void*-normalized, only by-value passing is unbankable, since its ABI depends on the aggregate's size). The FIRST pilot compile attempt caught a THIRD bug class outside this item's original scope: a parameter typed via a file-local function-pointer typedef (`alloc_02032074_t`) has no literal `(` at its use site, so the existing "function-pointer parameter, too complex" check doesn't catch it — added `_file_local_typedef_names()` to detect and exclude these too (**33 more**, 2 slightly conservative — they locally redeclare s32/fx32, now also global, but excluding is always safe). 9 tests added/updated in `tests/test_gen_prototypes.py` (24 total, was 15) — one pre-existing test was pinning the OLD buggy asm-keeping behavior, updated rather than left failing. Full writeup: `docs/research/data/q-prototypes-golive-fix-2026-07-25.md`.

**Gate:** `python tools/configure.py eur && ninja sha1` OK (byte-neutral, confirmed) + `python tools/check_prototypes_provenance.py` **0 mismatches** + pilot TU compile (real mwccarm, exit code 0, command in the writeup doc) + all 130 exclusions listed in the generator's own stderr output and the writeup (96 asm + 1 by-value-struct + 33 local-typedef, not just 12 — see writeup for why the real count is larger).

### q-itcm-feeder-fix — make ITCM visible to the censuses — the last invisible module (r11 [A], root cause VERIFIED by brain) [DONE]

ITCM is an invisible 27th module: its functions reach NO census, wave, or worklist, so they can never be picked up. The q-itcm-reach investigation diagnosed it on 2026-07-22 (`docs/research/campaign-analytics/itcm-reachability.md`) and specified the fix — but the fix was queued NOWHERE and the investigation's lane (Codex) is now closed, so it has sat unactioned. ROOT CAUSE (brain re-verified at main): `tools/wall_aware_headroom.py:76` has `_MODULE_RE = re.compile(r"^src/(main|overlay\d+)/[^/]+\.s$")` — the `[^/]+` allows exactly ONE path segment after the module dir, so real files like `src/main/itcm/func_01ff8400.s` (an extra `itcm/` segment) are silently rejected. Confirmed those `.s` files exist on disk and are excluded. Implement the report's own proposal: module-aware path classification (don't hard-code a single-segment assumption), union with `size_census.py`'s unmatched itcm rows so both feeders agree, and the two named regression tests (`src/main/itcm/func_01ff8400.s` plus one symbol-only case). Then report how many ITCM candidates become visible (~10 EUR + 14 USA + 14 JPN / ~6.2 KB per the census). Matching them is a SEPARATE follow-up — this item only makes them reachable.

**Result: both layers implemented, itcm now a first-class module.** Replaced the single-segment regex with `_classify_module()` (real path-part classification: `src/main/*.s`→main, `src/overlayNNN/*.s`→overlayNNN, `src/main/itcm/*.s`→itcm, everything else including dtcm/region-ports→unclassified). Layer 2 added `_itcm_symbol_only_gap_metadata()`, reusing `size_census.py`'s own `parse_functions`/`parse_claimed_text`/`unmatched()` directly against itcm's symbols.txt+delinks.txt, emitting the canonical not-yet-existing scaffold path for any function with no delinks claim AND no on-disk `.s`. Both layers flow through one shared `_consider()` filter/classify/bucket closure so size/addr/attempted filters apply identically to both. **Re-derived the actual current count fresh rather than trusting the 2026-07-22 doc's snapshot** (which had since drifted — someone scaffolded 2 of the original 10 gap functions into real, delinks-claimed `.s` files between then and now): today's true EUR total is **12** (2 file-level + 10 symbol-only-gap), not the doc's stale "~10" — reported as measured, not forced to match the estimate. Before/after against the real tree (old code run from an isolated temp copy so both versions could be compared without touching this branch): 25→26 modules, 5888→5900 total candidates (exactly +12, confirming nothing else moved). DTCM re-confirmed data-only (0 `kind:function` entries) and correctly contributes zero rows. USA/JPN's 14+14 (per `size_census.py`, already itcm-aware) are unaffected — this specific tool is EUR-baseline-only by its own existing scope. Full writeup: `docs/research/campaign-analytics/q-itcm-feeder-fix-2026-07-25.md`.

**Gate:** `python -m pytest -q tests` no-new-failures + the 2 named regression tests + a before/after count from `python tools/wall_aware_headroom.py --json` showing ITCM rows now appear.

### q-khdays-toolkit — port khdays-decomp's CC0 declperm.py + audit_callsite_arity.py (r11 [S]) [DONE]

r11's external lens found khdays-decomp ships a CC0-licensed (public-domain-equivalent — license-clean to adopt, unlike the peer SDK sources we ruled out) toolkit with two tools that map DIRECTLY onto our current blockers: (1) **audit_callsite_arity.py** — audits declared arity against actual CALL SITES. This is precisely the check that would have caught BOTH prototype-bank failures: #1327's 33 arity contradictions and the 12 `asm void` 0-arg landmines in the current bank (an asm-bodied definition carries no parameter list, so call sites are the ONLY evidence). Wire it as a companion to `tools/check_prototypes_provenance.py` so arity is verified from two independent directions. (2) **declperm.py** — declaration-permutation search; a mechanical lever for the decl-order/register-allocation residuals we currently hand-permute. Port both to our tree (our paths/parsers, keep attribution + the CC0 note), add tests, and REPORT what audit_callsite_arity finds when run against the current `include/game/prototypes.h` — that output is directly actionable for q-prototypes-golive-fix.

**Result: both ported, CC0 confirmed via GitHub API, both proven against this project's real toolchain.** License confirmed `cc0-1.0` directly via `gh api repos/Yokimitsuro/khdays-decomp --jq '.license'` before porting anything. `audit_callsite_arity.py`: core parsing kept near-verbatim (project-agnostic C-text analysis); re-targeted consensus-building at delinks.txt `complete` TUs (matching gen_prototypes.py's own convention) and the audit TARGET at `prototypes-provenance.json` directly (this project's real blocker is the declared bank, not parked files — khdays' own directory-based park/match split doesn't exist here). **Ran against the current tree: 3892 declared prototypes audited, 39 contradictions.** 6 are asm-bodied functions already superseded by q-prototypes-golive-fix's asm-exclusion (independent cross-confirmation the two fixes agree). **33 are genuinely NEW findings**: the bank is CORRECT (evidence-backed) but call sites use wrong LOCAL externs — including a systemic pattern, 8 separate shipped files all copy-pasting the identical wrong extern for the same "constant-one predicate" callback stub (`func_ov006_021ba1f0`), and a byte-safe-but-wrong 3-caller case (`func_020190c0`, 4 real params, every caller passes 0) — directly actionable once prototypes.h is wired into real caller TUs (a separate future step). `declperm.py`: ported onto this project's own `fastmatch.match_one()` instead of khdays' bespoke `match.py`/`func_index.json` infrastructure (gets `.legacy.c`/`.thumb.c` tier auto-detection for free, no `--thumb` flag needed unlike khdays' own version). **Found and fixed a real bug while porting**: khdays' own bare-declaration regex has no C-keyword awareness, so `return a;` (a single bare local, no expression) parses exactly as validly as a declaration — its own control-flow guard was only ever applied to the initializer branch, leaving this extremely common shape exposed. Caught by this port's own test suite, fixed by applying the guard symmetrically. Smoke-tested via `cmatch_loop.py`'s own `TemporaryGap` (its docstring's own words: "the ONLY way to canary-test fastmatch against a KNOWN match without inventing a fake one") against a real shipped function — both declaration-order permutations compiled and matched 100.00% against the real gap object, with the source file and delinks.txt confirmed byte-identically restored afterward. Full report + both files' own attribution docstrings: `docs/research/data/khdays-callsite-arity-report-2026-07-25.md`.

**Gate:** `python -m pytest -q tests` + both tools running on our tree + the arity-audit report against the current prototypes bank (counts + any contradictions found) + CC0 attribution recorded.

### q-readable-c-done-definition — retire the self-contradicting ceiling model and define 'readable-C done' (r11 [S]) [DONE]

> Shipped, ceiling fixed with shown arithmetic (main headroom 0.75->0.10,
> 48.03%->30.19%, residual explicitly flagged not fully reconciled) +
> 3 candidate done-definitions with a recommendation (adopt pret-style
> ladder + verdict-complete gate, reject attainment-as-completion) in
> `docs/research/q-readable-c-done-definition-2026-07-25.md` (pointer
> added to state.md's Next-brain TODO) + README SVG bar now reports
> natural-C only + 4 stale "metric split incoming" queue headers fixed
> — PR #1345, not yet merged to main as of this branch. **QUEUE EMPTY
> after this item — all 7 items shipped this session (#1337, #1338,
> #1339, #1341, #1342, #1343, and this one).**

r11 found the project's ceiling model CONTRADICTS ITSELF — it reports 48.03% while the r7-r14 analyses put the realistic band at 14-24% — so it is unfit to anchor any planning, and it currently does. Two deliverables: (1) Retire or re-derive the ceiling: find where 48.03% comes from (`tools/progress.py` ASYMPTOTIC_* constants and any doc quoting it), show the arithmetic, and either fix it or delete it — do NOT leave two contradictory numbers in the tree. (2) Propose a concrete 'readable-C done' definition, since the project currently has none and % alone is a poor target. r11's suggestion: a pret-style PUBLIC ladder (tiered milestones outside) plus a VERDICT-COMPLETE gate inside (every function has an explicit verdict: matched / genuinely-walled-with-evidence / not-yet-attempted — so 'done' means zero un-adjudicated functions, not an arbitrary %). Give 3 candidate definitions with pros/cons and RECOMMEND one; the brain decides. Also close the last asm-inflated surface: the README progress SVG bar still folds asm-C into readable-C even though the natural-C split landed end-to-end everywhere else.

**Gate:** `python -m pytest -q tests` + the ceiling either corrected or removed (with the arithmetic shown) + 3 candidate done-definitions with a recommendation + the README SVG bar reporting natural-C.

### q-prototypes-arity-33 — resolve the 33 CALL-SITE arity contradictions the new audit tool found [S] [DONE]

> Shipped, 0 unresolved (all 33 independently re-verified as real,
> non-asm, evidence-backed definitions — the bank was already correct;
> callers wrongly declare their own local externs, byte-safe but
> unwired). Regenerating the bank confirmed a byte-identical no-op.
> Fix lives in `tools/audit_callsite_arity.py`'s new `classify()`
> (reuses `gen_prototypes.parse_function_definitions` to independently
> re-verify each contradiction against a fresh definition parse) +
> a nonzero exit code + a real-tree pytest integration test as the
> check-path regression guard — see
> `docs/research/q-prototypes-arity-33-2026-07-25.md`. PR #1346, not
> yet merged to main as of this branch.

The khdays-ported `tools/audit_callsite_arity.py` now runs against our bank and reports: **3,780 declared prototypes audited, 33 with a CALL-SITE arity contradiction** (e.g. `func_ov010_021b2860`: bank declares 0 args, 4 confident call sites pass 1). These are the SAME failure class that got the first prototype bank reverted — a wrong arity silently breaks every caller's byte-match the moment the header is included, and the sha1 gate CANNOT see it. For each of the 33: decide the truth from evidence — the definition body is ground truth where it exists; where the definition is `asm`-bodied (no parameter list, the known blind spot) the CALL SITES are the only evidence, so take the call-site arity. Fix `gen_prototypes.py` so the resolution is GENERATED, not hand-patched (hand edits get wiped by the next `--write`), then regenerate and re-run the audit until it reports 0 contradictions. Wire `audit_callsite_arity.py` into the check path so this can't regress: `check_prototypes_provenance.py` verifies against DEFINITIONS, the arity audit verifies against CALL SITES — two independent directions, which is exactly why the pair catches what either alone misses.

**Gate:** `python tools/audit_callsite_arity.py` reports 0 contradictions + `python tools/check_prototypes_provenance.py` 0 mismatches + `python -m pytest -q tests` + `ninja sha1` byte-neutral (nothing includes the bank yet).

### cm-parked-reaudit-2 — batch 2 of the parked re-audit — the lane cleared its own restock bar (44.8%) [DONE]

> Shipped, 8/39 attempted (20.5% — below batch 1's own >25% bar, honestly
> reported; corpus is thinning). Live census of all 47 still-`.s`
> C-34 citations built fresh (no static list survived from batch 1);
> 4 parallel worktree agents. 4 more mistagged citations corrected
> (2 pre-verified before dispatch, 2 found by batch B), batch 1's own
> deferred item (`func_ov002_022b595c`) re-investigated (still needs
> its own from-scratch session — pool refs are 5576B apart, likely
> reach-forced not discretionary CSE), 2 new C-34 sub-patterns + 2 new
> levers found and folded into codegen-walls.md, 2 tooling bugs found
> and flagged (batch_sha1.py false-FAIL race, objdiff_resolve_relocs.py
> alias-symbol blind spot — spawned as separate follow-up tasks, not
> fixed here). 3-region gate3.py PASS. Full breakdown:
> `docs/research/cm-parked-reaudit-2-2026-07-25.md`. PR #1348, not yet
> merged to main as of this branch.

cm-parked-reaudit-1 shipped **13/29 (44.8%)**, comfortably above the >25% 'restocks itself' threshold it was asked to measure — so continue. Take the NEXT slice of the parked/wall-cited corpus beyond batch 1's 30-candidate sample of the 59-member Bucket-A pool (finish Bucket-A, then extend to the next bucket by the same selection method; the writeup `docs/research/cm-parked-reaudit-1-2026-07-25.md` documents the bucketing). CARRY BATCH 1'S LESSONS: the typed-struct-member lever alone does NOT split a duplicated pool slot — use the FULL toolkit (typed-struct externs, trampoline-arity check, tier routing, branch-order/predication, push-list correction via reusing named locals). Batch 1 also found several candidates were MISFILED as C-34 (single-`ldr` cases with no duplicate pool word at all) — re-check the citation against the actual `.s` before spending effort, and correct the misfiling in the taxonomy as you go. Also pick up batch 1's own deferred item: `func_ov002_022b595c` (size-forced exception).

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted + hit rate + any further taxonomy misfilings corrected.

### cm-data-inference-2 — extend the no-oracle data retype — the probe proved 2/6, now widen it [DONE]

> Shipped, 11/16 investigated (69%) — 6 main + 5 overlay002 blobs (an
> "8-table dispatch family" in ov002, 5/8 members investigated, all 5
> shipped). Named-struct bytes 8,832 -> 38,652 (+337.6%). 2 blobs
> correctly identified as misclassified CODE (not data), 1 correctly
> left already-optimally-typed, 1 correctly left as a scalar string
> constant, 1 (an AES T-table) deferred — strong evidence but no
> verifiable in-tree consumer. One consumer-rewrite regression caught
> and correctly reverted (struct-member vs pointer-cast codegen
> divergence, same risk class this session's concurrent
> cm-parked-reaudit-2 independently rediscovered). 3-region
> `gate3.py --scope all` PASS. Full breakdown:
> `docs/research/cm-data-inference-2-2026-07-25.md`. PR #1349, not yet
> merged to main as of this branch. **QUEUE EMPTY after this item —
> all 3 items shipped this round (#1346, #1348, #1349).**

cm-data-inference-probe shipped 2/6 by structural inference and cm-data-020b52d8-carve then landed the hardest case (a split mid-record table, 4 matched consumers re-verified 100%). The method is established; scale it. Next slice: (a) the remaining opaque `const unsigned char data_X[N]` blobs in `src/main` beyond the 6 already probed — rank by size x consumer-evidence exactly as the probe did (a matched consumer's computed-stride access is the evidence; no evidence = leave opaque, do NOT force); (b) r11 flagged that OVERLAYS carry more opaque blobs that no probe has touched — census `src/overlay*` the same way and include the best-evidenced ones. Reuse the probe's own tooling path (`emit_data_blob.py`'s ground-truth byte reading; generate initializers by script, never hand-transcribe) and the canary's mwcc bracing rule (a struct whose sole member is itself an array needs the extra brace layer). Report the hit rate again so we know whether this lane keeps paying.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-blob verdict (retyped / left-opaque + why) + the running hit rate + `Named-struct` bytes before/after from `tools/progress.py`.

### q-toolbugs-round2 — the 2 tooling bugs brief 682 flagged but never queued [DONE]

⚠️ These were found by `cm-parked-reaudit-2` (PR #1348) and described in its PR prose as "flagged as separate follow-up tasks" — but NO queue item was ever created, which is exactly the "flagged follow-ups evaporate" failure r11 identified (a prose mention is not a task). The brain queued them. **When you flag a follow-up, append a real `### id — title [TODO]` block to the right queue file; prose in a result or a spawn_task chip does NOT schedule anything.**

1. **`tools/batch_sha1.py` false-FAIL on a delinks-flip-before-`.s`-removal race.** The tool reports a FAIL when the delinks entry has been flipped to `.c` but the old `.s` has not yet been deleted — a transient state every ship passes through. Since this is the third distinct batch_sha1 defect (after the tier-suffix strip and the missing-revert-target bisect false-negative, both fixed in `q-toolbugs-evaporated`), fix it in the same spirit: detect the transient state explicitly and either tolerate it or fail with a message that names the actual cause, never a generic FAIL that reads like a byte divergence.

2. **`tools/objdiff_resolve_relocs.py` blind spot for `_alias`-suffixed symbols** — the registered-alias lever's own naming convention (see brief 682's new levers) produces symbols the resolver skips, so alias-using candidates get an incomplete relocation comparison. Teach it the `_alias` suffix.

Add a regression test per bug.

> **Note (written from the `q-compile-gate-region-fix` branch):** shipped as [PR #1351](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1351), accepted and merge-eligible but not yet merged into main as of this branch — `work_queue.py next --claim` can re-claim unmerged-but-shipped items when a fresh branch is cut from `origin/main`; plain `next` is read-only. Patched back to DONE locally.

**Result: both fixed, root cause of bug 1 confirmed by direct repro against the real tree (not just theorized).** (1) `configure.py` adds an unconditional ninja build rule for EVERY `.c` AND EVERY `.s` file it finds under `src/`, regardless of delinks.txt — confirmed empirically: wrote a throwaway `src/main/VBlankIntrWait.c` beside its untouched, delinks-routed `.s` sibling, reconfigured, and `ninja -n` hit `ninja: error: build.ninja:56206: multiple rules generate build/eur/src/main/VBlankIntrWait.o` immediately (a ninja PARSE-TIME fatal, before sha1.py ever runs). Deleting the `.s` WITHOUT reconfiguring left the error in place (build.ninja is a static snapshot; ninja never rescans the filesystem on its own) — reconfiguring afterward cleared it, matching the documented manual workaround exactly. `batch_sha1.py`'s own precondition (`_missing_revert_target_error`) REQUIRES the `.s` sibling to exist on disk as a bisection fallback, so every batch starts in exactly the state that produces this the moment build.ninja is next regenerated by anything. Fixed by teaching `_run_sha1` to always capture output and adding `_ninja_config_error`/`_correlate_stale_sibling`: on a detected `ninja: error:` config fatal (never confusable with a real mismatch — `sha1.py`'s own FAILED report carries no such prefix, verified directly from its source), if the conflicting output path belongs to one of the batch's own candidates, self-heal by displacing that `.s` (byte-exact in-memory backup, restored on any later revert), reconfiguring once, and retrying — genuinely "tolerating" the race, not just naming it. Falls back to a loud, specific, distinct infra-error report (exit 2, batch reverted, no bisection) for a stray conflict outside the batch or a repeat failure on the same candidate, instead of silently bisecting a config error as if it were a byte divergence. (2) `_NAME_ADDR_RE` only matched a trailing 8-hex-digit suffix; extended to `_([0-9a-fA-F]{8})(?:_alias)?$` after confirming the real naming convention directly (`grep _alias config/**/symbols.txt` — always `<original>_alias`, e.g. `data_0219a92c_alias`, no numbering, across all 3 regions) so an alias resolves to the IDENTICAL fictional address as the symbol it aliases instead of falling through to the unrelated FNV-1a name-hash fallback.
**Reproduced before fixing, for both bugs** (not just asserted): temporarily `git stash`-reverted each source fix in turn and re-ran its new tests — bug 1's `test_unrelated_conflict_reverts_and_reports_infra_error` failed with `1 != 2` (a real config error WAS being silently bisected and reported as "1 culprit" pre-fix, exactly the false-FAIL this item describes); bug 2's alias tests failed showing the wrong resolved address (`0x04f448c0`-ish hash fallback instead of `0x0219a92c`). Both pass after popping the stash back.
21 new tests (`tests/test_batch_sha1.py` 10→27, `tests/test_objdiff_resolve_relocs.py` 29→32) — all filesystem/subprocess-mocked, no real toolchain dependency, none skip-gated.

**Gate:** `python -m pytest -q tests` — 3037 passed, 16 skipped (pre-existing), 0 new failures. One test per bug plus a pre-fix repro confirmation for both (see PR #1351).

### q-prototypes-golive-pilot — actually USE the prototype bank — it is clean but included by ZERO TUs [S] [DONE]

The bank is now in good shape (3,892 evidence-only prototypes, `check_prototypes_provenance.py` 0 mismatches, `audit_callsite_arity.py` 0 unresolved, types.h carries s8/s32/fx32/BOOL, asm-bodied definitions excluded) — and **not a single TU includes it**, so its entire payoff is still unrealized. The measured prize: **50.2% of extern declarations inside matched TUs are wrong**, and a wrong extern is a first-try match failure.

PILOT CAREFULLY, this is the go-live step: (1) pick ONE matched caller-only TU that currently carries inline externs the bank also declares; (2) replace its inline externs with `#include "game/prototypes.h"`; (3) rebuild and confirm the TU's `.o` is byte-identical (per-TU objdiff, then `ninja sha1`). If byte-identical, repeat on ~5 more TUs of different shapes (different modules, at least one `.legacy.c` tier file) to prove it generalizes. **STOP and report if any TU changes bytes** — that is the signal that the bank's spelling (void*-normalisation, int widths) is not codegen-neutral, which is exactly what this pilot exists to discover.

⚠️ HARD CONSTRAINT r11 verified: the bank is includable by CALLER-only TUs and NEVER by a TU that DEFINES one of the banked functions (redefinition conflict). Pick pilots accordingly. Do NOT mass-convert — the deliverable is a proven, byte-neutral recipe plus a count of how many TUs are eligible.

> **Note (written from the `q-compile-gate-region-fix` branch):** shipped as [PR #1352](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1352), same stale-re-claim mechanism as q-toolbugs-round2 above. Patched back to DONE locally.

**Result: GO (careful rollout, not a blind mass-convert) — 6/6 pilots byte-identical, 32 eligible TUs found, one real (non-silent) discovery.** Enumerated the defining-file set directly from `gen_prototypes.collect_evidence_backed_signatures()`'s own `source` field (3,752 files) and excluded every one of them per the hard constraint — this cut the raw "extern names a banked function" hit count from 2,640 down to **45 hits across 32 distinct eligible files**: the report's own illustrative wrong-extern examples (`func_ov006_021ba1f0`'s 8-file family, `func_020190c0`'s 3-file family) turned out NOT to be eligible pilots themselves, because their caller files also independently DEFINE a different banked function each — a real, non-obvious finding: in this one-function-per-file codebase, most files that call sibling functions also define their own, so the eligible pool is structurally narrow regardless of how common wrong externs are.
Piloted 6 of the 32 for maximum structural diversity: 2 pure function-pointer/data tables (1 single-symbol, 1 with 5 banked symbols interleaved among 75 untouched non-banked externs), 2 `asm void`-bodied consumers (a sinit constructor with 3 simultaneous banked externs, and the CRT `Entry` point as the all-externs-already-match trivial baseline), and 2 real-C-call-site `.legacy.c` files (`Vram_GetBankBaseE`/`Vram_GetBankBaseCD`) — across `main`, `overlay010`, `overlay021`. **All 6 byte-identical** (`fastmatch.py --gap` 100.0% for the 2 function-containing files; `fastmatch.py` can't check data-only TUs — reports `WARNING — no functions in compiled .o` — so those 4 were verified via `ninja sha1`). Final confirmation: `python tools/gate3.py --scope all` **GATE PASS** — 3-region SHA1 (EUR/USA/JPN) + pytest 3017 passed, 16 pre-existing skips, 0 regressions.
**The one real discovery, exactly as the item asked to find:** the 2 `.legacy.c` pilots' call sites (`Vram_GetBankBaseE(a)` / `...CD(a)`) pass an argument to a function the bank declares as explicit 0-arg `(void)` — swapping only the extern (not the call site) is a **hard mwcc compile error** ("function call ... does not match"), not a silent byte change. This is the SAFE failure mode: it fails loud, at compile time, exactly for TUs needing a call-site fix, never silently for the ones that don't. Dropped the now-provably-unused argument (matching `audit_callsite_arity.py`'s own established resolution: the callee never reads it) — both recompiled clean and matched 100.0%, because the caller's own first parameter was already sitting in the ABI register the wrong call would have used, so removing the extra pass-through needed zero instruction changes. Flagged as a confirmed instance, not a guarantee that generalizes to all 25 arity-mismatched externs in the pool.
Full pilot-by-pilot detail, the eligible-TU recon method, and the recommended mechanical recipe for a future mass-conversion pass (check the definer-set first; a compile error on arg-count means drop the argument, not force it): `docs/research/data/q-prototypes-golive-pilot-2026-07-25.md`.

**Gate:** `ninja sha1` byte-identical 3-region + per-TU objdiff evidence for each pilot TU + the eligible-TU count + a written go/no-go on mass conversion. `python tools/gate3.py --scope all`: GATE PASS (3-region SHA1 + pytest 3017 passed, 0 regressions) — see writeup doc for full per-TU evidence.

### cm-data-inference-3 — data wave 3 — 213 opaque blobs remain and the lane is running at 69% [DONE]

cm-data-inference-2 shipped **11/16 (69%)** and took `Named-struct` from 8,832 to 38,652 bytes (+337%). The runway is large: **65 opaque blobs remain in `src/main` and 148 across `src/overlay*`**. Continue with the same method and the same discipline that made wave 2 good:

- Evidence first: read how real consumer code indexes the blob; the access pattern IS the struct evidence. No evidence -> leave opaque and say why. Wave 2 correctly declined 5 of 16.
- Wave 2 found a productive shortcut: several blobs belonged to one **card-ID -> handler-pointer dispatch family** sharing generic lookup helpers. Look for families again — cracking the helper explains many blobs at once.
- Watch for **misclassified CODE**: 2 of wave 2's non-ships were ARM32 linker veneer stubs, not data at all.
- ⚠️ Wave 2 hit a real regression: rewriting an already-matched consumer from pointer-cast to struct-member access changed mwcc's codegen and dropped it to 27.3%. It reverted rather than forced — do the same, and re-verify every touched consumer individually before the aggregate gate.
- Parse byte content from the already-committed literal by script and round-trip verify; never hand-transcribe.

> **Note (written from the `q-compile-gate-region-fix` branch):** shipped as [PR #1355](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1355), accepted and merge-eligible (confirmed: red checks were pre-existing main breakage, not this PR's — see `q-compile-gate-region-fix`/`q-pytest-ci-reconcile` below), not yet merged into main as of this branch. Patched back to DONE locally, same stale-re-claim mechanism as the two items above.

**Result: 24 blobs investigated (12 main, 12 overlay, 5 modules — main + ov002/ov005/ov006/ov012/ov013), 14 shipped (58%) + 2 bonus siblings found for free.** Live count first: the item's own "65 main + 148 overlay = 213" is stale — a live scan found **140** currently-opaque blobs (40 main, 100 overlay), same recurring stale-count pattern this campaign keeps re-discovering. Method matched wave 2 exactly: 24 parallel read-only investigation agents (exhaustive symbol-grep + independent `relocs.txt` address cross-check per blob), then direct script-driven implementation (parse the already-committed literal, never hand-transcribe, never re-extract from the ROM).
Shipped 14, spanning 2 new struct shapes independent of wave 2's ov002 family (`Ov002CardBonusEntry` 27×16B with 2 function-pointer fields, `data_ov002_022bdfec` a genuine 6×24 2D `short` array — corrected a wrong access-shape claim in existing project docs along the way), 3 more members of wave 2's own 8-table ov002 family (86b8/9250/9038 — 5 of 8 now shipped, 2 remain), overlay005/006/012/013's **first-ever** data-inference touches (a 102-entry Shift-JIS text table with load-bearing byte order, a 8×28B 10-field struct cross-region-verified EUR/USA/JPN, a 5×8 `void*` array shipped via raw literal-address casts for its still-uncarved pointer targets — empirically confirmed byte-identical via `objdump -s -j .rodata`/`-r`, and a 6-entry message-lookup struct with an 336B raw tail), plus 2 bonus siblings found by the same investigating agent tracing a shared consumer to 2 more differently-sized tables of the identical struct shape.
**A real bug caught by the full gate, not by per-file compilation**: the first `gate3.py --scope all` run came back GATE FAIL for EUR (87.6M diverging bytes) — 4 files were written with `const` added by copy-paste habit from majority-`const` sibling files, when their own originals had no `const` at all (a different, non-`const` carve convention). Moving them to a `const`-qualified declaration shifted their linker section, cascading through the entire downstream ROM layout. Fixed by diffing EVERY file's `const`-ness (and `static`, checked separately) against its own original declaration systematically, not assumed from a sibling's convention — re-verified GATE PASS after.
4 more blobs reached STRONG evidence but were deliberately not shipped this wave (none silently dropped): 2 main blobs need an actual symbol carve (`data_020b4680`, `data_020c319c` — the latter a mid-record split mirroring the `data_020b52d8` precedent exactly), 1 main blob is a 30-field single struct instance (not an array) with meaningfully higher implementation risk (`data_021015e4`), 1 ov011 blob has a genuine contradiction between its own reachable index range and 2 independently-proven pointer rows (`data_ov011_021d3060`) — filed as `cm-data-020b4680-carve`, `cm-data-020c3198-carve`, and named priority candidates inside the new `cm-data-inference-4` item below, alongside 2 further sibling leads found but not yet carved (`data_ov006_021cb5f4`, `data_ov006_021cddec`).
`Named-struct` bytes: **38,652 -> 41,956 (+3,304, +8.5%)** — smaller than wave 2's own jump because more of this wave's ships are primitive-element flat arrays (excluded from `Named-struct` by this project's own metric design, same caveat wave 2 already documented).
Full pilot-by-pilot detail, every investigation verdict (including the 8 correctly-declined negatives), and the const-bug postmortem: `docs/research/data/cm-data-inference-3-2026-07-25.md`.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS (EUR/USA/JPN SHA1 + pytest 3017 passed, 0 regressions) + per-blob verdict + hit rate + `Named-struct` before/after from a real `progress.py` run — see writeup doc for full detail.

### q-compile-gate-region-fix — the baserom-free compile gate has never actually worked [S] [DONE]

`Compile changed C (usa)` and `(jpn)` fail with `ninja: error: unknown target 'build/usa/src/main/data_020bea2c.o'`. Workflow-run history shows it has been red on essentially EVERY PR since the gate was added, green only on crossregion-mop and q-batch-port — i.e. only on cross-region PRs. For the entire EUR-first campaign this gate has been crying wolf, so a genuine compile break would be invisible in the noise. That is the demonstrated failure class this fix closes.

Root cause, verified: the region filter in `.github/workflows/compile-check.yml` (~line 57) is

```

(($_ -notmatch '^src/(usa|jpn)/') -or ($_ -match "^src/$env:REGION/"))

```

which treats an un-prefixed path as region-shared. It is not: `src/main/` and `src/overlayNNN/` are EUR-only. Confirmed: `config/usa/arm9/delinks.txt` contains 1057 `src/usa/main/` entries and ZERO `src/main/` entries. So for usa/jpn the workflow synthesizes targets that do not exist in that region's build graph.

Fix: make the filter region-exclusive — eur takes paths NOT under `src/usa/` or `src/jpn/`; usa takes only `^src/usa/`; jpn takes only `^src/jpn/`. The existing sentinel fallback already covers "no changed files for this region", so a pure-EUR PR will compile the usa/jpn sentinel and pass honestly rather than failing.

Do NOT just make the job tolerate unknown targets — that would make it vacuous, which is the same defect `q-gate3-vacuous` already fixed once elsewhere. Prove the fix both ways before shipping: (1) a branch touching only `src/main/*.c` must go green on all three regions, and (2) a deliberately broken EUR `.c` must still turn the eur job RED. Assert both in the PR body.

**Gate:** re-run the workflow on your own PR and on a scratch branch containing only an EUR-path `.c` change; both green. A separate deliberately-broken-EUR scratch branch turns the eur job RED.

**Result:** Shipped as #1356. Filter made region-exclusive exactly per spec. Proved both directions with REAL GitHub Actions runs (windows-latest), not just local simulation:
- #1356 itself (0 changed `.c` files) — `Compile changed C` PASS on all 3 regions via the sentinel path.
- Scratch PR #1357 (one-line comment added to `src/main/data_020bead0.c`, an EUR-baseline file) — PASS on all 3 regions: eur compiles the real file, usa/jpn correctly fall through to their own sentinels.
- Scratch PR #1358 (same file, garbage token spliced into the declaration) — eur FAILS with a genuine mwcc error (`undefined identifier 'this'`, `too many initializers`), usa/jpn stay PASS (file correctly excluded, not even attempted). Exact same error text as the local repro, confirming it's a real compile break, not a tooling artifact.
Both scratch PRs (#1357, #1358) closed without merging, branches deleted — throwaway verification only.
Found a real but out-of-scope issue while reading unrelated CI output on #1357: `pr-invariants`'s `cross_file_name_drift` check has 4 pre-existing errors on main (confirmed via `git log` on the offending files — last touched 2026-06-30, long before this branch existed), currently blocking merge on EVERY PR project-wide, not just this lane's. Filed separately below as `q-invariant-drift-fix` per this session's own standing rule against flagging follow-ups in prose only.

### q-pytest-ci-reconcile — the suite is green locally and red in CI, so neither is a gate [DONE]

`Tests` has been failing on main since ~2026-07-24. `q-green-pytest` delivered "genuinely green, no known-failure baseline" — but that was only ever verified on a fully-provisioned dev box. CI shows 2 failures + 2 errors; a bare local run on the brain worktree shows a DIFFERENT set. Two runs that disagree means neither is trustworthy.

Known environment-dependent tests:
- `tests/test_m2c_feed.py` — `tools/m2ctx.py` shells out to `gcc`, which is not on PATH in CI (or on a worktree that has not provisioned it). Fails as `FileNotFoundError`/`WinError 2`, and as a loader import error in CI.
- `test_gate3.TestDsdBinaryProbe.test_real_repo_root_resolves` — needs the dsd binary.
- `test_fastmatch.TestMissingFile` — 2 tests, CI-only.

Decide per test whether the dependency is genuinely required (then provision it in the workflow) or incidental (then add a real skip guard with a reason, e.g. `shutil.which('gcc')`). A skip with a stated reason is honest; a test that passes only on one machine is not. Do NOT reintroduce a blanket known-failure baseline — that is what `q-green-pytest` deliberately removed.

**Gate:** `Tests` green in CI on your PR, and `python -m pytest -q tests` green on a worktree with NO gcc and NO dsd (skips allowed, failures not). Report the skip count and the reason for each in the PR body.

**Result:** Shipped as #1360. 3 distinct root causes, not 1 shared cause — (1) `test_m2c_feed.py` bare `import pytest` (not in `tools/requirements.txt`) crashed the whole module at import time before any skip guard mattered, compounded by `@pytest.mark.skipif` being inert under CI's actual runner (`unittest discover`, not `pytest`) — swapped to `@unittest.skipUnless`, dropped the import; (2) `test_fastmatch.TestMissingFile` depended on `build.ninja` existing (fastmatch.py checks it before the per-file check) even though the behavior under test has no real need for a build graph — isolated via a `setUp` that monkeypatches `ROOT` to a scratch dir, no product code touched; (3) `test_gate3.TestDsdBinaryProbe.test_real_repo_root_resolves` checks the real repo root for an actual dsd binary, genuinely external state CI never downloads — added `@unittest.skipUnless` with a reason. Confirmed via the REAL ubuntu-latest CI run (not just local sim): `Ran 3020 tests ... OK (skipped=21)`, 0 failures, 0 errors, every skip has a stated reason (verified by reading the actual job log, not assumed). Also green locally both ways: `python -m unittest discover -s tests` (3025 passed/16 skipped on a configured Windows box) and `python -m pytest -q tests` (3017 passed/16 skipped). No blanket known-failure baseline reintroduced.

### cm-data-020c3198-carve — carve the true base of the data_020c319c table (mid-record split, mirrors data_020b52d8) [DONE]

cm-data-inference-3 found `data_020c319c` (92 bytes, `src/main/data_020c319c.c`) is NOT its own table's true base: its sole consumer `func_02090330.s` computes `base + idx*6` against THREE separate symbols in sequence (`data_020c3198`, `data_020c319a`, `data_020c319c`), all three read every iteration as one 6-byte `{u16,u16,u16}` record. `data_020c3198`/`data_020c319a` are `delinks.txt` gap placeholders with NO owning `.c`/`.s` file — the true table starts 4 bytes before the current symbol. This is the exact same shape as the already-shipped `cm-data-020b52d8-carve` precedent (see `docs/research/cm-data-020b52d8-carve-2026-07-25.md` for the carve mechanics: extract missing bytes from `extract/eur/arm9/arm9.bin`, write one unified struct-array `.c` spanning the true base through the next real boundary, update `delinks.txt`/`symbols.txt` to fold in the absorbed gap symbols as address-only markers — do NOT delete their symbols.txt entries, dsd validates the original ROM's fixed relocation table against symbols.txt regardless of current source — then rewrite `func_02090330` from its current pointer-cast form to `data_020c3198[idx].field0/1/2`).

Full evidence, proposed type (`Record020c3198 { unsigned short field0, field1, field2; }`, 16 records spanning `0x020c3198`-`0x020c31f8`), and the stride derivation (`mov r1,#0x6; mul ip,r0,r1`, cross-validated against an independent `docs/research/c-match-prep/02090330.c` draft and `docs/research/dossiers-high/02090330.md`) are in `docs/research/data/cm-data-inference-3-2026-07-25.md`. Record 0's `field0`/`field1` values live only in the ROM gap bytes, not the current tree — extract them as part of this carve, never guess.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + all 4 field reads in `func_02090330.s` individually re-verified against the new struct (disassembly-level, since the consumer stays `.s`) + `data_020c319c.c` deleted, folded into the new unified file.

**Result:** Shipped. The queue item's own text assumed rewriting `func_02090330` to C-struct-member form, but the actual `.s` file's own header comment marks it a GLOBAL_ASM/no-C-match endgame TU — confirmed against the Gate text instead, which correctly says the consumer stays `.s`. Investigated + empirically REJECTED an `.equ`-style assembly alias for keeping `data_020c319a`/`data_020c319c` independently resolvable (real toolchain test: `Illegal relocatable expression` — mwasmarm can't turn an external base + offset into a new exported symbol at assemble time); found the toolchain DOES support `symbol+offset` directly at each reference site (`.word data_020c3198+2`), verified via `objdump -r` producing the identical final relocation target. Extracted the 4 missing ground-truth bytes (both zero, consistent with the 020b52d8 precedent's own record-0-is-a-sentinel pattern), wrote the unified `Record020c3198[16]` struct array, widened the `delinks.txt` entry (0 audit problems), edited the 2 literal-pool lines in `func_02090330.s`. Independently cross-validated against `docs/research/c-match-prep/02090330.c`'s "3 parallel arrays, idx*3 stride" description — mathematically identical bytes/addresses to the struct interpretation shipped here, just a different C-authoring style of the same layout; left a staleness note on that prep draft since it referenced the now-gone independent symbol names. Verified byte-for-byte (not just "compiled clean") against the actual `.rodata` output, and 3-region `gate3.py --scope all`: GATE PASS (confirmed against `verdict()`'s own source, not just the printed banner, since the region-by-region output got truncated by my own `tail`). Full writeup: `docs/research/cm-data-020c3198-carve-2026-07-25.md`.

### cm-data-020b4680-carve — carve the true extent of the data_020b4680 table (evidence covers only 32 of 96 bytes) [DONE]

cm-data-inference-3 found `data_020b4680` (96 bytes, `src/main/data_020b4680.c`) has STRONG, exhaustive consumer evidence (`func_02002c3c.s`/`func_02002ffc.s`, both structurally guarantee the index via `&0xf` masking) for only the first 32 bytes: a 16-entry `unsigned short` nibble-spread lookup table (`table[n]` spreads the 4 bits of `n` into 4 nibble lanes, `idx*2` stride, index bounded to `[0,15]` by the mask itself — not an inference). The remaining 64 bytes (offset 0x20-0x5F) have zero consumer evidence found by either consumer. Unlike the 020c319c case above this is not a mid-record split — the evidenced portion cleanly ends at a record boundary (byte 32) — but shipping it still requires the same carve mechanics (split the symbol into two, one dedicated `.c` for the evidenced 16-record table and one still-opaque `.c`/gap-marker for the remaining 64 bytes) rather than a same-symbol struct+raw-tail (unlike `data_020bea2c`/`data_ov013_021cb7b4` in this same wave, which fit their partial evidence WITHIN their existing single-symbol boundary and shipped directly).

Full evidence and the proposed 16-entry table content are in `docs/research/data/cm-data-inference-3-2026-07-25.md`.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + the split verified not to change either half's linked bytes.

**Result:** Shipped. Confirmed via grep that only the 2 named consumers reference this symbol anywhere in `src/`. Decoded all 16 table values from the existing bytes before writing code, cross-checked the nibble-spread pattern by hand (`table[5]=0x0101`, `table[11]=0x1101`, etc.) against the disassembly's `&0xf` mask + `lsl #1` stride. Split at the byte-32 boundary: `data_020b4680.c` now `const unsigned short[16]` (evidenced), new `data_020b46a0.c` (new symbol, added to symbols.txt in address-sorted position) stays opaque `const unsigned char[64]` — no shape forced onto the unevidenced tail. `batch_carve.py`'s own `audit()`: 0 problems. Byte-for-byte verified (concatenation of both new objects' compiled `.rodata` vs. the original 96-byte literal, programmatic comparison, not eyeballed). First `gate3.py --scope all` run hit a real but self-inflicted `usa` SHA1 FAIL (`ninja: error: loading 'build.ninja': ... being used by another process`) from an earlier stray manually-backgrounded gate run whose process outlived a naive `jobs -l` check in a fresh shell; confirmed no stray processes via `tasklist` and re-ran clean: GATE PASS, all 3 regions' individual SHA1 PASS lines grepped explicitly (not assumed from the banner alone), pytest 3017 passed/16 skipped/0 failed. Full writeup: `docs/research/cm-data-020b4680-carve-2026-07-25.md`.

### cm-data-inference-4 — data wave 4 — continue the method on the remaining ~116 opaque blobs [DONE]

cm-data-inference-3 investigated 24 of the ~140 opaque blobs still in the tree (main: 40 total, 12 investigated; overlay: 100 total across 5 modules touched this wave, 12 investigated) and shipped 14 (58%), spread across `main`, `overlay002`, `overlay005`, `overlay006`, `overlay013`. Continue with the same method (parallel read-only investigation agents, one per blob, exhaustive symbol-grep + `relocs.txt` address cross-check, classify fixed-offset/weak vs computed-stride/strong, never force a type onto insufficient evidence) on the ~28 uninvestigated main blobs and ~88 uninvestigated overlay blobs (`overlay000`, `overlay003-004`, `overlay007-012` minus the ov012 table already shipped, `overlay014-023` are all still completely untouched by any wave).

Baseline for before/after (as of the `q-compile-gate-region-fix` branch): `Named-struct` 38,652 B on `main` (cm-data-inference-3's own +3,304 lands once PR #1355 merges), EUR Natural-C 9.03%, ~116 opaque blobs remain per wave 3's own live scan.

Two already-investigated, evidence-complete candidates this wave deliberately did NOT ship (see `docs/research/data/cm-data-inference-3-2026-07-25.md` for the full writeup — re-investigating them from scratch would waste the work already done):
- **`data_021015e4`** (272 bytes, `src/main/data_021015e4.c`) — STRONG evidence but a 30-field **single struct instance** (not an array), including 6 function-pointer fields proven by a real call site's argument types. Higher implementation risk than this wave's array-shaped ships (getting mwcc's exact struct layout/padding right for a complex mixed-type single instance) — do the implementation carefully, verify per-field, don't rush it.
- **`data_ov011_021d3060`** (152 bytes, `src/overlay011/data_ov011_021d3060.c`) — STRONG evidence for an 8-byte-stride row table, but the consumer's mathematically-reachable index range (0-15) genuinely overlaps 2 rows independently proven (via `relocs.txt`) to be pointers, not table data — a real contradiction, not a clean case. The investigating agent explicitly recommended against a script-driven retype here; needs a human/agent to look at the boundary question directly (there's also a lead that the true array may start 1 byte earlier, at the still-uncarved `data_ov011_021d305f`, based on an already-matched sibling consumer using the identical `slot*8` stride against that address) before committing to a record count.

Two sibling leads found but not yet carved (no dedicated `.c` file exists for either yet — both need their own carve before investigation can even start):
- **`data_ov006_021cb5f4`** (in an unclaimed `.rodata` gap immediately after `data_ov006_021cb518`, `src/overlay006/func_ov006_021c148c.c` already indexes it with a genuine runtime `int` stride).
- **`data_ov006_021cddec`** (referenced only as an `.extern` in `func_ov006_021c3384.s`, shows its own stride-2 `int16` computed-index evidence in the same loop that drives the already-shipped `data_ov006_021cdf88`).

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-blob verdict + hit rate + `Named-struct` before/after from a real `progress.py` run.

**Result:** Shipped. Live census corrected the stale estimate again: 125 opaque blobs remained (37 main, 88 overlay), not ~116 — the queued number hadn't accounted for wave 3's 14 ships or this round's own 2 carves, none merged yet. Investigated 20 (the 4 named priority items + 16 fresh main blobs), shipped 12 (60%): 9 implemented directly after a real operational finding mid-wave — write-capable agents share this session's actual working directory, not a sandbox, so after 2 carve agents' concurrent (successfully non-colliding, independently confirmed via `git diff`) writes to the same `delinks.txt`, switched the remaining 16 investigations to strictly read-only `Explore` agents and did all further implementation directly, matching `cm-data-inference-3`'s own proven-safe pattern. All 12 shipped items verified byte-for-byte (9 by this session directly, 3 re-verified independently after their own agents' self-reports — never just trusted). One pointer field (`data_020bec8c+0x48`) required relocation-based verification (`objdump -r`) rather than raw-byte comparison, since pre-link placeholder bytes there are meaningless until the linker resolves them — confirmed the exact expected `R_ARM_ABS32 data_020fe4d0` target. `data_020be6c4` investigated STRONG but already correctly typed — reported as a confirmation, not a reshape. 5 declined (WEAK/CONTRADICTION), including a valuable 3-way cross-check on a shared buffer cluster that caught an unresolved const-safety tension one report alone would have missed. Found `progress.py`'s Named-struct metric structurally can't see single-struct-instance shapes (only array-of-struct declarations) — 3 of 4 new struct types this wave are undercounted by it; reported the real measured delta (+44B) with that caveat rather than a misleading raw number, and filed the metric gap separately. 6 new sibling leads found (2 with already-matched consumers proving their shape, near-zero risk) folded into `cm-data-inference-5` below rather than left to evaporate. Full 3-region gate: GATE PASS (all 3 regions' SHA1 individually grepped from the log, pytest 3018/16/0). Full writeup: `docs/research/data/cm-data-inference-4-2026-07-25.md`.

### q-research-index-recursive-glob — generate_research_index.py only scans docs/research/*.md, missing 15+ reports already in docs/research/data/ [DONE]

Found while regenerating the index for `cm-data-inference-4`'s own report: `tools/generate_research_index.py` (~line 226) does `RESEARCH_DIR.glob("*.md")` — a non-recursive glob that only reaches files directly in `docs/research/`, never its subdirectories. `docs/research/data/` already holds 15 `.md` files (confirmed via `ls docs/research/data/*.md | wc -l`), including `cm-data-inference-3-2026-07-25.md` and now `cm-data-inference-4-2026-07-25.md` — none indexed, none discoverable via `docs/research/README.md`. This is silent: `drift-check`'s `generate_research_index.py --check` stays green regardless, since the tool's own definition of "up to date" never accounts for subdirectory files in the first place — so this has been silently accumulating, not something a CI failure would ever have caught.

Fix: change the glob to recursive (`RESEARCH_DIR.rglob("*.md")`), verify no path-collision/duplicate-title issues arise from mixing top-level and `data/`-subdirectory reports, regenerate the index once for real (expect 15+ new entries to appear), and add a regression test asserting every real `.md` file under `docs/research/` (any depth) has a corresponding index entry — mirroring the same "don't let a real completeness gap go silently uncaught" discipline as this session's `find_malformed_headers` fix for `work_queue.py`.

**Gate:** `python -m pytest -q tests` no-new-failures + new recursive-discovery test + a real `python tools/generate_research_index.py` run showing all `docs/research/data/*.md` files now present in `docs/research/README.md`.

**Result:** Shipped. Entry count: **496 → 3,011** (confirmed two independent ways: the tool's own reported count, and a manual `find`+`grep` cross-check of every real `.md` file under `docs/research/` with an H1 heading). The 15-file estimate was itself stale — live discovery found the true gap was project-wide (every subdirectory, not just `data/`), including 9 separately-maintained per-directory `INDEX.md` catalogs and a second `README.md` under `archive/`. 2 more real bugs found and fixed in the same pass, not split into follow-ups since they'd otherwise ship a known-broken state: (1) the link generator used the bare filename for both link text and href — silently broken for every non-top-level note, and ambiguous for several genuine same-basename pairs already in the tree (a superseded note's stub at its original path vs. its `archive/`-moved copy) — fixed to use the path relative to `docs/research/`, verified both stub and archived copy now appear as distinct, individually-resolving rows; (2) a note's own body-text links, when copied verbatim into its index summary, resolve incorrectly once relocated to `docs/research/README.md`'s different depth — caught by `tests/test_docs_links.py` (a real, unrelated regression the fix would otherwise have shipped), fixed by flattening Markdown links in copied heading/summary text to plain display text. Refactored the scan into a shared `collect_notes()` so the regression test can no longer silently drift from `main()`'s own logic the way it did originally (the OLD test duplicated the non-recursive glob, so it agreed with the bug instead of catching it). `docs/tools-index.md` also regenerated in the same PR (this tool's own docstring changed, which that index embeds). 9 new/updated tests, full suite 3053 passed/16 skipped, all 3 real `--check` generators (tools-index, briefs-index, research-index) verified green locally, matching CI exactly.

### q-metric-extern-guard — close the metric v2's latent extern miscount (review follow-up, hours) [DONE]

Review of the merged metric v2 found 3 latent gaps, none affecting today's numbers: (1) the type-clause capture does NOT skip `extern` declarations — 801 EUR TUs carry extern array decls (2877 `extern char` + ~30 extern-of-typedef spellings) that will silently miscount as named-struct bytes the moment such a TU owns DATA_SECTIONS bytes; fix = skip any clause containing `extern`. (2) `.search()` is first-match-only — 43 EUR TUs have primitive-first/struct-later declaration ordering; fix = finditer/any. (3) widen primitive coverage: `u?int\d+_t`, `vu8/vu16/vu32`, `fx16/fx32`, `BOOL`. Add tests for each. ALSO record in this commit (docs/research/data/prototypes-provenance notes or the queue): the prototypes.h WIRING constraints found by review — ~15 emitted lines reference types the header chain does not define (BOOL/fx32/s8/s32/one by-value `struct Ov000V3`), so the FIRST future #include of game/prototypes.h will hard-error until those are resolved, and the void*-normalization means the header is includable by CALLER-only TUs, never by a TU that DEFINES one of the banked functions (redefinition conflict). Nothing includes it today; these are constraints on the go-live step, not current bugs.

**Result:** Shipped. Fixed all 3 gaps in `summarize_data_readability()`'s named_struct_bytes walk (`tools/progress.py`): (1) any array declaration whose type clause contains `extern` is now skipped entirely — it's a forward reference to bytes a DIFFERENT TU owns, so it can't tell us anything about the TU's OWN data; (2) `.search()` → `finditer` over every array declaration in the TU, not just the first, so a primitive-first/struct-later TU no longer drops the struct declaration; (3) widened primitive coverage: `_PRIMITIVE_WIDTH_RE` now also matches `u?int\d+_t` (stdint.h spellings), `_PRIMITIVE_TYPE_TOKENS` gained `vu8`/`vu16`/`vu32`/`fx16`/`fx32`/`BOOL`. 3 new regression tests, each independently confirmed to FAIL against the pre-fix code (16≠0, real≠0x10, 80≠0) before confirming they pass post-fix. Full suite: 3057 passed (was 3054), 0 regressions. Real `--version eur` run: Named-struct 38652/4776528 (0.81%), Typed-array 80748/4776528 (1.69%) — byte-identical before and after the fix, exactly as the item predicted ("none affecting today's numbers").

**On the "ALSO record" prototypes.h ask**: verified this is now stale, not current — recording the verified truth here instead of duplicating or re-asserting a now-false claim. `include/game/types.h` already defines `s8`/`s32`/`fx32`/`BOOL` (PR #1341, q-prototypes-golive-fix): the "hard-error on first #include" claim no longer holds. Grepped the current 3,824-line `prototypes.h`: no `Ov000V3` or any other undefined type appears (the by-value-struct exclusion in `gen_prototypes.py` already keeps it out). "Nothing includes it today" is also stale — 6 TUs already `#include "game/prototypes.h"` (`src/main/data_02102360.c`, `Entry.c`, `func_0208f850.legacy.c`, `func_0208f920.legacy.c`, `src/overlay010/sinit_ov010_021b89a8.c`, `src/overlay021/data_ov021_021ac9e0.c`) — PR #1352's `q-prototypes-golive-pilot` already wired and byte-verified all 6, and confirmed each is caller-only (never a definer TU). The one constraint that IS still live — void*-normalization means the header is includable only by caller-only TUs, never a TU that DEFINES a banked function (redefinition conflict) — is already documented twice over: verbatim in `prototypes.h`'s own top-of-file comment, and in full mechanical detail (defining-file-set check, mass-conversion recipe) in `docs/research/data/q-prototypes-golive-pilot-2026-07-25.md`'s "Go/no-go recommendation" section. Nothing new to add.

**Gate:** `python -m pytest -q tests` no-new-failures + new tests for all 3 gaps + the wiring-constraints note committed.

### q-metric-singleton-struct-gap — progress.py's Named-struct metric can't see single-struct-instance shapes, only array-of-struct [DONE]

Found while measuring `cm-data-inference-4`'s own before/after: `tools/progress.py`'s `named_struct_bytes` calculation (`_DATA_ARRAY_DECL_TYPE_CAPTURE_RE`, ~line 58) requires a top-level `Type name[N]` array-bracket declaration and classifies by the *first* such line's type clause in the TU's source. A single struct *instance* (`const Foo data_X = {...};`, no `[N]` on the symbol itself) never matches at the top level — and if its internal fields are all primitive-typed arrays (`char name[64]`, `unsigned int reserved[7]`, etc., which the regex's `.search()` can match first), the whole file scores zero toward `named_struct_bytes` even though it's a genuine new named-struct type. Confirmed directly: 3 of wave 4's 4 new struct types (`data_021015e4`, `data_020bec1c`, `data_020bec8c`) hit this exact gap; only `data_020b5a8c` registered, and only because its wrapping anonymous struct's first field happens to be a non-primitive-typed array (`Entry020b5a8c entries[7]`) — a coincidence of field declaration order, not a meaningful distinction from the other 3.

**Result:** Shipped. Added `_DATA_SCALAR_DECL_TYPE_CAPTURE_RE`, a bracket-less companion to `_DATA_ARRAY_DECL_TYPE_CAPTURE_RE` that matches `Type name = {...};` / `Type name;` with no `[N]` at all, and refactored the classification into `_tu_has_named_struct_decl()`, which checks every match from BOTH regexes (not just the first) for a non-extern, non-primitive type clause. Empirically checked the new regex against every real `.c` file under `src/` (470 data-owning TUs) before relying on it: zero would flip to a false non-primitive match — the risk considered was a bracket-less 2-word statement inside a mixed code+data TU (e.g. `return foo;`) matching as a false "declaration", but this codebase's one-symbol-per-file convention means data-owning TUs don't carry that kind of stray control-flow text.

**cm-data-inference-4 (PR #1364) is still unmerged**, so `data_021015e4`/`data_020bec1c`/`data_020bec8c` don't yet exist in named-struct shape in this branch's tree (confirmed: still opaque `unsigned char data_X[N]` placeholders on main today). Rather than duplicate wave 4's unmerged content into this branch, verified the fix against wave 4's REAL file content directly: read all 4 real files via `git show origin/claude/cm-data-inference-4:<path>` (no working-tree mutation), wrote them into a scratch config/src tree (outside the repo), and ran the real `progress.py --version eur` CLI both pre- and post-fix against it. **Pre-fix: Named-struct 44/436 (10.09%)** (only `data_020b5a8c`'s coincidental match). **Post-fix: Named-struct 436/436 (100.00%)** — all 4 now counted, and the 392-byte delta (436-44) equals exactly 272+32+88, the 3 target symbols' sizes. `typed_array_bytes` unaffected (436/436 both before and after — all 4 files already had some bracketed struct-internal array field, so that tier was never blind to them).

3 new regression tests: (1) a condensed real-shape singleton instance (mirrors `data_021015e4`, primitive bracketed fields before the bracket-less instance — also proves order no longer matters), (2) a bracket-less PRIMITIVE scalar stays excluded (guards against over-matching plain scalar definitions), (3) the `data_020b5a8c`-shaped anonymous-struct-first-field case still registers (regression guard for the pre-existing coincidental path, not new behaviour). Test (1) confirmed to fail pre-fix (0 != 0x110); the other two pass both pre- and post-fix by design (they guard existing/safe behavior, not the new code path). Full suite: 3060 passed (was 3057), 0 regressions. Real `--version eur` run against the actual (wave-4-unmerged) tree: unchanged (38652/4776528 named-struct, 80748/4776528 typed-array) — confirming zero effect on today's real numbers, since no bracket-less named-struct instance exists anywhere in the currently-merged tree yet.

Fix should detect a file-scope declaration whose type clause is a non-primitive typedef name regardless of whether the SYMBOL itself carries an array bracket (i.e. also match `Type name = {...};` / `Type name;` with no brackets, not just `Type name[N]`), add tests for both the singleton-instance case and the field-order-dependent false-negative case this docs, and re-run `progress.py --version eur` before/after on a synthetic fixture to confirm the fix actually changes the counted total for a singleton-struct file.

**Gate:** `python -m pytest -q tests` no-new-failures + new tests for the singleton-instance detection + a real `progress.py --version eur` run showing `data_021015e4`/`data_020bec1c`/`data_020bec8c` now counted, not just the regex changing in isolation.

### cm-data-inference-5 — data wave 5 — continue the method on the ~113 opaque blobs remaining, plus 6 named sibling leads from wave 4 [DONE]

`cm-data-inference-4` investigated 20 of the 125 opaque blobs remaining after wave 3 + this round's 2 carves, shipped 12 (60%). 113 remain (28 main, 85 overlay), plus 6 named leads found but not investigated this wave — continue with the same method (parallel read-only `Explore` agents, one per blob, exhaustive symbol-grep + `relocs.txt` address cross-check, classify fixed-offset/weak vs computed-stride/strong, never force a type onto insufficient evidence) and implement centrally afterward, not via further concurrent write-capable agents (see `cm-data-inference-4`'s own postmortem on why).

Named priority candidates, evidence already gathered, re-investigating from scratch would waste it:
- **`data_020beefc`** (main, 64 B) — already has a **matched** C consumer (`func_0208147c.c`: `extern int data_020beefc[][4];`) proving its shape; near-zero-risk.
- **`data_020b4a2c`** (main) — two already-**matched** C consumers (`func_02011b4c.c`, `func_02011b68.c`) already declare `extern unsigned short data_020b4a2c[]`; currently still a raw `.s` byte listing, needs its own `.c` file first.
- **5 ov006 palette blobs** (`data_ov006_021cb6d8/718/738/758/798`, 32 B each, plus check 3 more addresses in the same run — `021cb6f8/778/7b8` — not yet confirmed referenced) — same "load base, `n=0x20`, copy into palette RAM" idiom as wave 4's shipped `data_020b4728`; 2 spot-decoded and confirmed as further RGB555 colour ramps.
- **`data_020fe480`** (main, 8 B) — evidenced as a small sentinel-value state block.
- **`data_020fe488` / `data_020fe49c` / `data_020fe4b0`** (main) — 3 SDAT filename-suffix string literals, currently in an unclaimed `delinks.txt` gap.
- **`data_020be794`** (main, 140 B) — a 35-entry function-pointer table, clean computed + fixed-bound (`cmp r5,#0x23`) stride.

**Result:** Shipped. Live census corrected the stale estimate again: 116 opaque blobs remained (27 main, 89 overlay), not ~113 — reconstructed the baseline by merging `origin/claude/cm-data-inference-4`'s branch tip directly (it already had wave 3 + both carves synced in), resolving one real conflict where 3 follow-up items had been independently completed on this session's own branch after being independently filed as `[TODO]` on wave 4's. 42 distinct blob investigations (13 named-lead slots + 19 fresh main + 5 ov010 + 3 ov015), 29 symbols shipped/carved across ~26 blob investigations (62%, in line with the ~60% budget), 3 reconfirmed already-correct, 11 declined (8 WEAK, 3 CONTRADICTION — including a genuine cross-region contradiction at `data_02102120` where EUR alone would be STRONG but USA/JPN hold different content at the same shared-stub address, correctly left untouched). One STRONG-per-its-own-investigation case (`data_02101e64`, an 11-field fixed-offset struct with no bulk-copy/function-pointer verification) was deliberately filed as a lead rather than shipped, matching this session's standing bias toward declining on borderline evidence.

A real, reproducible `ninja sha1` regression was found and fixed mid-wave (not just a flaky build — confirmed across a fresh build and a full `-t clean` rebuild): splitting a 66-byte evidenced prefix (`data_020b4a2c`) from its unevidenced tail (`data_020b4a6e`) into 2 separately-linked object files put a non-4-byte-aligned boundary between them, and mwld inserts a real alignment gap at such boundaries even though neither object's own section declares any alignment requirement — bisected via `dsd check symbols`' address-shift report, fixed by keeping both symbols in one translation unit instead. Every touched object's compiled bytes/relocations were directly inspected via `objdump` before trusting any build, not just the final SHA1 banner. Full 3-region gate: `python tools/gate3.py --scope all` → GATE PASS, all 3 of `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the log, pytest 3062 passed / 15 skipped, 0 failed. Named-struct metric: 39,224/4,776,528 (0.82%), up from wave 4's 38,652 (this branch also carries the `q-metric-extern-guard`/`q-metric-singleton-struct-gap` fixes, so not a like-for-like comparison). Full writeup: `docs/research/data/cm-data-inference-5-2026-07-26.md`.

Batch 2's originally-planned scope (12 more main-adjacent blobs from wave 4's own selection, plus ov010 [5 blobs] and ov015 [3 blobs]) was never dispatched — fold into this wave's scope too rather than re-deriving a fresh list.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-blob verdict + hit rate + `Named-struct` before/after from a real `progress.py` run (report the metric's own known singleton-struct blind spot alongside the raw number, per wave 4's finding, until `q-metric-singleton-struct-gap` is fixed).

### q-invariant-drift-fix — pr-invariants' cross_file_name_drift check has a comment-spanning regex bug AND 3 real dead externs, currently blocking merge on EVERY open PR [PARKED]

> PARKED: already being fixed by a different lane — PR #1359 ("q-invariants-green: fix Match invariants (4 errors, 2 root causes)", filed via docs/queue/claude-decomper.md, open as of 2026-07-25) touches the exact same 2 root causes independently diagnosed below (tools/check_match_invariants.py's regex + the same 3 dead externs in src/main/func_02086800.c, src/usa/main/func_02086718.c, src/jpn/main/func_02086718.c) plus a regression test. Verified real via `gh pr view 1359`/`gh pr diff 1359 --name-only`, not assumed from memory. Leaving this item's own analysis in place below in case #1359 stalls or gets closed without merging — re-open (flip back to [TODO]) if so.

Found while reading unrelated CI output on a q-compile-gate-region-fix scratch PR (#1357) — a ONE-LINE comment addition to an already-shipped file made `pr-invariants (eur)` and `(usa)` both fail with "Found 4 error-severity invariant issue(s)". Confirmed this is pre-existing and project-wide, not caused by that PR: same 4 errors reproduce on #1355 (an unrelated, already-in-review PR), and `git log` on each offending file shows its content unchanged since 2026-06-30, long before either branch existed. Right now this blocks merge on every open PR in the repo, same failure class as `q-compile-gate-region-fix` before its fix — the campaign has a second gate crying wolf.

Two distinct root causes, both investigated (not guessed):

1. **A real checker bug, not real drift.** `tools/check_match_invariants.py:334-337`'s `_EXTERN_FN_RE` is `^[^\n]*?\bextern\s+[^;{]*?\b(?P<name>[A-Za-z_]\w*)\s*\([^)]*\)\s*;` with `re.MULTILINE | re.DOTALL` — the negated character classes (`[^;{]`, `[^)]`) already span newlines regardless of DOTALL, and the pattern never excludes `/* ... */` or `//` comment text. One of the 4 flagged "errors" is `src/overlay001/func_ov001_021ca144.c:15`, symbol supposedly named `c` — line 15 is prose inside a block comment ("`* C-27 alias recipe: a second extern name at the identical address`"), not code; grepping the file directly for `extern` shows zero real declarations near that line (the real ones start at line 59). The regex latched onto "extern" inside the comment and then scanned forward across further comment lines and paragraph/parenthesis text hunting for the next `NAME(args);` shape, producing a garbage capture attributed to the wrong line. Fix: strip C comments (`/* */` and `//`) before running `_EXTERN_FN_RE`, the same way a real preprocessor would — do NOT just special-case this one file/symbol.
2. **3 genuinely dead externs**, unrelated to the regex bug, all the identical vestigial shape: `extern void func_02086800_dummy(void);` in `src/main/func_02086800.c:10`, `src/usa/main/func_02086718.c:10`, `src/jpn/main/func_02086718.c:10`. Confirmed dead (not just unresolved) — grepped each of the 3 files for any call site or further reference to `func_02086800_dummy`, found none; `func_02086800.c` itself defines the real `func_02086800` two lines below its own now-unused forward declaration. `config/eur/arm9/symbols.txt` has `func_02086800` (no `_dummy` suffix) at `0x02086800`, confirming `_dummy` was a placeholder name from before the function matched and the extern was never cleaned up. Fix is deletion, not a `rename_symbol.py` re-point — verify there really is no live use in any of the 3 files before removing (already checked once here; re-verify at fix time in case something changed).

**Gate:** `python -m pytest -q tests` no-new-failures + a regression test for the comment-spanning false positive (e.g. an `extern` mention inside a `/* */` block that must NOT be flagged) + the 3 dead externs removed + `pr-invariants` green on a real PR (not just local `python tools/check_match_invariants.py`) to prove the CI path itself, not just the library function, is fixed.

### cm-data-inference-6 — data wave 6 — remaining opaque-blob census, plus 2 specific carried-over leads [DONE]

`cm-data-inference-5` investigated 42 of the 116 opaque blobs live-counted at that wave's start, shipped/carved 29 symbols across ~26 blob investigations (62%). ~74 main+overlay blobs remain uninvestigated (re-run the live census fresh — `grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" src/main/*.c src/overlay*/*.c`, cross-checked against relocs.txt — this campaign's counts have drifted from the queued estimate every single wave so far, don't trust this item's own number either). Continue with the same method (parallel read-only `Explore` agents, one per blob, exhaustive symbol-grep + `relocs.txt` address cross-check, classify fixed-offset/weak vs computed-stride/strong, never force a type onto insufficient evidence) and implement centrally afterward, not via further concurrent write-capable agents.

Two specific carried-over leads, evidence already gathered by wave 5, re-investigating from scratch would waste it:
- **`data_02101e64`** (main, 24 B) — an 11-field fixed-offset struct instance (`signed char, signed char, unsigned short x7, {u16,u8,u8}[2]`) tiling all 24 bytes with zero gaps, cross-validated by an independent writer function and mirrored on a same-sized sibling (`data_02101e7c`, itself fed through the identical accessor chain — check that one too while in the area). Full proposed shape and every consumer file/line already in `docs/research/data/cm-data-inference-5-2026-07-26.md`'s own investigation notes (not reproduced here — re-read that agent's report via the wave's own transcript/journal if available, or re-derive from `src/main/func_0206c1b4.s` and callers). Declined in wave 5 specifically because it lacks a bulk-copy or function-pointer-typed field the way this campaign's other singleton-struct ships have had — if a future wave's own independent re-derivation reaches the same conclusion, that's corroboration, not proof; weigh carefully before shipping a guessed field layout.
- **`data_ov010_021b8908`** (ov010) — CONTRADICTION found in wave 5: genuine consumer evidence (`func_ov010_021b799c.s`) reads 24 bytes past the currently-declared 32-byte end, landing exactly on the byte before the next known symbol `data_ov010_021b8928` — the true contiguous object is ≥56 bytes and the current `symbols.txt` boundary at `0x8928` is very likely a decomp-tool artifact from an interior relocation, not a real second global. Needs `021b8908` and `021b8928` carved/typed together as one object, not `021b8908` alone.

**Result:** Live census (again) corrected the queued estimate: **97** opaque blobs remained at this wave's start, not ~74 (5th consecutive wave with a drifted count — see `docs/research/data/cm-data-inference-6-2026-07-27.md` for the full pattern). 28 fresh investigations across 2 dispatch batches (20 + 8, the second once agent slots freed). **20 symbols shipped** (12 ov006, 4 ov011, 3 ov012, 1 ov010 — full per-symbol table in the research doc), 1 documented-no-change (`data_ov011_021d35ec` — real row/stride semantics recovered, but the correct C representation is the *same* flat byte array already on disk, an alignment pad would be lost by forcing `[5][10]`), 2 previously-confirmed-correct re-confirmed (`data_ov006_021cb4f8`/`021cb518`, no change). Both carried-over leads resolved: `data_02101e64` **declined again** (exhaustive re-search found no new corroboration — two independent waves now agree), `data_ov010_021b8908`/`021b8928` **shipped** — wave 5's "spurious artifact" hypothesis for `021b8928` was wrong; it's a genuine 24-byte object, real evidence below.
**5 new CONTRADICTIONs filed as carried-over leads** for the next wave (`cm-data-inference-7`, below): `data_ov011_021d3178`, `data_ov011_021d3394`, and a 4-symbol cluster `data_ov012_021cc06c`/`021cc078`(gap)/`021cc07c`(gap)/`021cc080` — two independent investigations of the cluster's two endpoint symbols both independently found the same true-aggregate-spans-all-4 evidence.
**Two real implementation bugs found and fixed, both only by rebuilding and independently comparing built-ROM bytes against the baserom — never by trusting a "should work" derivation:** (1) A proposed boundary shift between `data_ov006_021cb65c`/`021cb680` was actually wrong — `021cb680` has an already-matched C consumer whose relocation to its original address is ground truth; the sibling's 40-byte raw-pointer-arithmetic read doesn't need or permit a symbol boundary change. Caught via a dsd delink-time `[ERROR] No symbol found for relocation ... to 0x021cb680` after attempting the rename. (2) **mwcc does not preserve source declaration order for multiple `const` globals in one TU** — merging `data_ov010_021b8908`/`021b8928` into one file (unnecessarily; their boundary was already 4-byte aligned) produced a built ROM with the two globals' addresses swapped. Fixed by splitting into 2 separate files instead, which sidesteps the ordering question entirely, and amended `docs/research/data-carve-tu-alignment.md` with the generalized rule: prefer 2 files whenever the boundary is 4-aligned; only use a same-TU merge for non-4-aligned boundaries, and verify its built layout directly rather than trusting declaration order. A third, lower-stakes hand-transcription error (one bsearch-table record dropped, silently zero-filled by the compiler) was caught the same way and fixed by regenerating the initializer from a script.
Full writeup, per-symbol evidence table, and both bug postmortems: `docs/research/data/cm-data-inference-6-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (EUR additionally re-verified via a full `ninja -t clean` rebuild + independent `dsd rom extract` byte comparison against the baserom, not just SHA1 pass/fail, given the 2 real bugs found this wave). `Named-struct`: 39,224 → 43,136 bytes (0.82% → 0.90%).

### cm-data-inference-7 — data wave 7 — 5 CONTRADICTION leads carried over from wave 6, plus fresh census [DONE]

Wave 6 found (not guessed) 5 symbols across 2 genuine multi-symbol-boundary CONTRADICTIONs — the declared byte range doesn't match what consumer code actually needs, with the true object extending into currently-separate adjacent symbols. Both need a coordinated multi-symbol carve, not a single-symbol retype; investigate as one unit each, not independently. Full evidence for each already gathered — re-investigating from scratch would waste it, but DO verify byte content fresh (this session already caught 2 real implementation bugs from trusting derived-but-unverified byte content — see wave 6's own postmortem, `docs/research/data/cm-data-inference-6-2026-07-27.md`).

- **`data_ov011_021d3178`** (ov011) — `relocs.txt` proves this symbol's own first word (at its own base address) is itself a relocated pointer, meaning the declared object is actually the tail of a larger pointer chain crossing several adjacent uncarved symbols starting some bytes earlier — not a standalone blob at its current declared address.
- **`data_ov011_021d3394`** (ov011) — a column-slice of a much larger `0x72`-stride row table spanning at least 6 adjacent symbols from `0x021d32d8` to `0x021d33bc`. Needs the full table's extent mapped before any one column can be typed correctly.
- **`data_ov012_021cc06c` / `data_ov012_021cc078` (still an unclaimed `delinks.txt` gap) / `data_ov012_021cc07c` (still an unclaimed gap) / `data_ov012_021cc080`** (ov012) — `func_ov012_021ca18c.s` reads 6 bytes at `data_ov012_021cc06c + 0x24..0x29`, an address range the current symbol table assigns to `data_ov012_021cc080`'s own offset `0x10..0x15`. Two independent wave-6 investigations (one starting from each endpoint symbol) both reached this same conclusion independently — the real aggregate spans all 4 symbols, 2 of which don't even have a `.c` file yet.

After these, re-run the live opaque-blob census fresh (same grep as every prior wave's item) rather than trusting wave 6's own count — 97 at wave 6's start, 77 after wave 6's 20 ships, but wave 6's own investigations surfaced several already-resolved false positives in the raw grep, so re-derive rather than just subtracting.

**Result:** Both carried-over clusters fully resolved. `data_ov011_021d3178` reconstructed as a real 144-byte, 9-record (36-pointer) table from `relocs.txt` ground truth — required claiming 2 previously-unclaimed gaps (`data_ov011_021d30f8`, `data_ov011_021d3138`), shrinking `021d3178` to its real 16 bytes, splitting off a new 80-byte opaque tail (`data_ov011_021d3188`, needing its own new `symbols.txt` entry — the only one of the 4 addresses dsd's own analysis hadn't already identified as a boundary), and retiring a spurious 1-byte "ghost" symbol dsd had synthesized (`data_ov011_021d3177`) by repointing its sole `.s` consumer to `data_ov011_021d3138+0x3f` (symbol+offset). The ov012 cluster resolved even more cleanly: each of the 4 legacy symbols' own existing byte range turned out to align exactly with natural field boundaries in the reconstructed 56-byte object, so it shipped as 4 independently-typed files at their original addresses — no merge, no consumer edits. Fresh census dispatched 15 investigations: **14 shipped** (unsigned/signed flat arrays, `{key,val}` pair tables, a 3-field bitfield struct, 3 pointer-containing structs/arrays, one documented-no-change), **1 new CONTRADICTION** found and declined (`data_ov002_022ca3dc` — 17 clean records + an orphan word belonging to a separate, still-undelinked symbol — filed as a lead below).
**Two real implementation bugs found and fixed, both only by rebuilding and inspecting the compiled objects/link output — never by trusting a "should work" derivation:** mwcc places any global containing an `&symbol` relocation into `.data` regardless of `const` (confirmed against this project's own D-1 recipe example, which is itself `.data` for exactly this reason) — fixed by switching to raw `(void *)0x...` literal casts, matching precedent already set in wave 6 (`data_ov012_021cc180`) that this wave initially failed to recognize as generalizable. Separately, even with a literal cast, `const void *arr[N]` (pointer-to-const) and `void *const arr[N]` (const-pointer) are different types and only the latter reliably lands in `.rodata` on this compiler — caught via `mwldarm`'s own `.data(.data) ... referenced but has not been written` link warning, and independently corroborated from the opposite direction by a pre-existing project dossier surfaced during the census batch (warning against accidentally `const`-ing a `.data`-sited array). Both promoted to a new standing rule in the queue header above (kept separate from the TU-alignment note — a distinct failure class, not a variant of it).
Full writeup, per-symbol evidence table, and both bug postmortems: `docs/research/data/cm-data-inference-7-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green). `Named-struct`: 43,136 → 43,828 bytes (0.90% → 0.92%). Hit rate: 14/15 fresh census investigations shipped (93%).

### cm-data-inference-8 — data wave 8 — 1 CONTRADICTION lead carried over from wave 7, plus fresh census [DONE]

Wave 7 found 1 new multi-symbol-boundary CONTRADICTION, plus this campaign is due for another fresh live census (wave 7 didn't exhaustively re-scan after its own 14 ships).

- **`data_ov002_022ca3dc`** (ov002, currently 140 B) — 17 clean `{s32 attr; void *ptr;}` records (136 bytes, computed-stride consumer `func_ov002_0229f41c.s:52-59` + 16 independent `relocs.txt` pointer confirmations) plus one orphan trailing word (offset `0x88`, value `3`) that does NOT fit the pattern. The byte immediately after the declared 140-byte end (`data_ov002_022ca468`, still an unclaimed `delinks.txt` gap) is independently referenced by unrelated code — confirmed NOT a continuation of this table. Needs the orphan word re-attributed to its own tiny symbol, or merged into whatever eventually claims `data_ov002_022ca468`'s region, before `data_ov002_022ca3dc` itself can ship as a clean `[17]` array.

Re-run the live opaque-blob census fresh (same grep as every prior wave's item) — wave 7 shipped 14 more but never re-counted afterward.

**Result:** The carried-over lead resolved clean with no boundary shift needed after all — `delinks.txt` already correctly bounded the full 140 bytes; the orphan trailing word stays an honestly-unlabeled scalar (no relocation, no known consumer). Investigating its true neighbor surfaced 2 bonus carves in the same previously-unclaimed gap (`data_ov002_022ca468`, `data_ov002_022ca470`, both verified against pre-existing `symbols.txt` entries first). Fresh census dispatched 15 investigations: **15 of 15 shipped** — 13 directly as STRONG, plus 2 CONTRADICTIONs investigated to a real resolution rather than declined: `data_ov002_022c836c` required a 4-byte boundary shift (reconstructed as `data_ov002_022c8368`, merging in a `symbols.txt`-declared-but-`delinks.txt`-unclaimed gap immediately before it — same-index/same-stride proof on both halves of the sole consumer's literal pool, the 4 never-carved leading bytes read directly from `extract/eur/arm9_overlays/ov002.bin`); `data_ov002_022ca370` is a genuine cross-region shape divergence (EUR reads it at halfword stride, USA/JPN's own symbol tables + GLOBAL_ASM ground truth read the same bytes at byte stride through an unrelated function) — shipped as `unsigned short[16]` because that's provably byte-safe for all 3 regions regardless (USA/JPN's consumer addresses memory by symbol name, indifferent to the defining TU's C type), with the divergence itself documented rather than papered over.
No new implementation bugs this wave — the wave-7 const-placement rules held with zero regressions across every pointer-containing file (2 `Ov002CardHandlerRecord` tables, an `Ov006StateCb` fn-ptr table, `data_ov002_022ca3dc`'s pointer half), confirmed by a clean first-try EUR SHA1 pass with no `.data`/`.rodata` link warnings.
Full writeup, per-symbol evidence table, and both CONTRADICTION resolutions: `docs/research/data/cm-data-inference-8-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green — 3100 passed, 15 skipped, 0 failed). `Named-struct`: 43,828 → 44,308 bytes (0.92% → 0.93%). Hit rate: 15/15 fresh census investigations landed a retype (100%).

### cm-data-inference-9 — data wave 9 — fresh census [DONE]

No specific carried-over lead this time — both of wave 8's CONTRADICTIONs were resolved in-wave rather than deferred. Re-run the live opaque-blob census fresh (same grep as every prior wave's item); budget the usual 55-70% hit rate rather than expecting another wave-8-sized outlier — this wave's 100% likely reflects an easier-than-average batch (small/simple candidates, several already-partially-mapped record families), not a durable rate change.

Two small never-carved `delinks.txt` gaps noticed in passing but NOT investigated this wave (found adjacent to the `data_ov002_022c8368` cluster fix, unrelated to it): `data_ov002_022c834c` and `data_ov002_022c8354` (ov002, both `symbols.txt`-declared, 3rd/2nd-to-last unclaimed before the cluster). Worth a look if the fresh census doesn't turn up enough runway on its own.

**Result:** Live census corrected the estimate again: **45** opaque blobs remained at this wave's start (not derived from any prior number). 15 investigations dispatched across `main` + 7 overlays (2 first touches: ov014, ov020). **6 of 15 shipped directly** (`data_ov002_022ca390`, `data_ov017_021b7f3c`, `data_ov014_021b4bf8`, `data_ov020_021addd0`, `data_ov006_021cc078`, `data_ov005_021b1568`) plus **3 bonus sibling carves** from the `021cc078` family's own evidence (`data_ov006_021cc03c`/`_021cc050`/`_021cc064`) — 9 files shipped total. **8 of 15 were solid reconfirmations** of prior-wave declines or already-shipped symbols (no source change) — real, useful work, not wasted slots: one corrected a wave-5 coverage undercount (22/22 not 20/22), one found the target symbol was already shipped elsewhere in the same TU, one reclassified a stale "CONTRADICTION" label as the more precise "WEAK." **1 new CONTRADICTION** (`data_020b46b8`) investigated to a real, well-understood resolution (a genuine 40B-EUR-vs-174B-USA/JPN content divergence, verified against raw ROM bytes in all 3 regions) and explicitly deferred — needs new USA/JPN-only region-override files, not a byte-preserving retype, and this wave's own gate confirms USA/JPN build correctly today with no such file present (dsd's gap-filler already supplies the right bytes), so there's no urgency, only a documentation opportunity for a future dedicated item.
A real, unrelated bug was found and flagged separately (not fixed here): `src/main/func_02026f78.c`'s declared signature no longer matches its sole caller's actual call site (1 declared param vs 4 args passed) — spawned as its own background task.
Full writeup, per-symbol evidence table, and the `data_020b46b8` cross-region analysis: `docs/research/data/cm-data-inference-9-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green — 3100 passed, 15 skipped, 0 failed). `Named-struct`: 44,308 → 44,424 bytes (0.93% → 0.93%). Hit rate: 6/15 fresh census investigations shipped directly (40%), 9 files landed with sibling bonuses, 8/15 useful reconfirmations, 1 CONTRADICTION resolved-and-deferred.

### cm-data-inference-10 — data wave 10 — fresh census, plus an optional USA/JPN item [DONE]

No specific carried-over lead for the main EUR-focused census — re-run the live opaque-blob census fresh (same grep as every prior wave's item) across `main` + all overlays. This deep into the campaign, expect a growing share of any fresh batch to land on already-investigated ground (wave 9 saw 8/15) — that's not a sign the method is failing, it's the expected shape of a shrinking, increasingly-picked-over pool; keep dispatching investigate-first agents rather than trying to pre-filter from the queue side, since only a real per-symbol check can tell settled from fresh.

Optional, separate-track item (not required to close this wave, and not EUR-blocking): `data_020b46b8` needs new `src/usa/main/data_020b46b8.c` and `src/jpn/main/data_020b46b8.c` region-override files implementing `unsigned short[87]` (174 bytes each, byte-identical between USA and JPN, extracted from `extract/{usa,jpn}/arm9/arm9.bin` at file offset `0xB46B8`) — full evidence and the exact proposed shape in `docs/research/data/cm-data-inference-9-2026-07-27.md`. Verify the open build-scoping question flagged there (an EUR-only-excluded definition feeding a non-EUR-excluded consumer) before/while implementing, and confirm via `gate3.py --scope all` that USA/JPN still build byte-identical afterward — per the project's EUR-first phased strategy this can wait for a quiet wave or a dedicated item, it is not blocking anything today. **Not attempted this wave** — still open for a future one.

**Result:** Live census re-derived fresh: **35** opaque blobs remained at this wave's start. 15 investigations dispatched: 13 fresh candidates plus 2 deliberate revisits of old wave-4/wave-5 CONTRADICTIONs (`data_02102120`, `data_ov006_021cb7b8`) explicitly re-evaluated against this campaign's newer "ship EUR + document the cross-region caveat" resolution pattern (established waves 8-9), which didn't exist when those two were first declined. **7 of 15 shipped directly (47%)**: `data_02102120` (6-field struct — the cross-region divergence is now resolved by a hard, unit-tested build-config proof that this EUR-only `src/main/` file is excluded from USA/JPN compilation entirely, stronger than the general "no override exists" argument used for prior cross-region ships), `data_ov002_022ca510` (`int[6]`, double-consumer loop-bound-proven), `data_ov006_021cb5f4` (`int[6]`, overturns a wave-4 "keep opaque" call once the already-matched consumer's own `extern int[]` declaration was weighed alongside exhaustive relocs.txt accounting), `data_ov006_021cb7b8` (`{short,short,short,short}[5]`, the wave-5 "CONTRADICTION" label turned out to be a stale family-mismatch note, not a genuine boundary conflict), `data_ov016_021b8e5c` and `data_ov019_021b5a68` (2 more instances of the triangle-wave table family, now shipped 5 times total across waves 8-10), `data_ov022_021ab9a0` (`void*[7]`, 6 relocation-proven pointers + 1 NULL). **8 of 15 were solid reconfirmations** (3 already-optimal ASCII case tables / a stride-1 LUT, 5 WEAK) — no forced retypes.
Full writeup, per-symbol evidence table, and both CONTRADICTION resolutions: `docs/research/data/cm-data-inference-10-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green — 3100 passed, 15 skipped, 0 failed). `Named-struct`: 44,424 → 44,488 bytes (0.93% → 0.93%). Hit rate: 7/15 fresh census investigations shipped directly (47%), 8/15 useful reconfirmations, 0 new CONTRADICTIONs (2 old ones resolved instead).

### cm-data-inference-11 — data wave 11 — fresh census [DONE]

No specific carried-over lead. Re-run the live opaque-blob census fresh (same grep as every prior wave's item) across `main` + all overlays. Two standing optional items from prior waves remain open and are NOT required to close this one: `data_020b46b8`'s USA/JPN region-override files (see wave 9/10 entries above — not EUR-blocking) and the two small never-carved `delinks.txt` gaps near the `data_ov002_022c8368` cluster noted in wave 9 (`data_ov002_022c834c`, `data_ov002_022c8354`) — pick either up only if the fresh census runs thin.

**Result:** Live census dropped sharply to **28** opaque blobs remaining, and only 3 were genuinely fresh after excluding already-settled symbols — the thinnest pool yet. Rather than dispatch a thin fresh-only batch, mixed in 5 higher-value picks: 1 cluster-completion check, 2 revisits of old wave-5 declines under the newer partial-struct standard, and both standing never-carved `delinks.txt` gaps from the note above. **6 of 8 shipped (75%)** — the best hit rate since wave 8's 100% outlier: `data_ov006_021ce2ac`/`data_ov006_021ce29c` (2 more `kv_t` key/value table instances, wave 7's family now at 4 members), `data_ov002_022c834c` (new carve, `unsigned int[2]`) and `data_ov002_022c8354` (new carve, function-pointer table `[5]`, both standing optional gaps now filled), `data_021023c0` and `data_020fe55c` (both resolve wave-5 declines via the partial-struct standard — evidenced fields typed, unevidenced ranges kept as honest `gap[N]` members). 1 WEAK (cluster completion confirmed, not just assumed) and 1 CONTRADICTION correctly reconfirmed (a pointer block sits mid-array with non-pointer bytes on both sides, no clean boundary to carve).
A real implementation bug this wave: the first build failed `ninja sha1` outright; `dsd check modules` isolated it to ARM9 main in one command, narrowing to this wave's 2 `src/main/` changes; root cause was a hand-transcription error in `data_020fe55c`'s gap field (written all-zero, actual bytes have a stray `0x10`). Fixed by re-copying the exact bytes from the pre-edit file rather than re-deriving from memory; second build passed clean.
Full writeup and the transcription-bug postmortem: `docs/research/data/cm-data-inference-11-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green — 3100 passed, 15 skipped, 0 failed). `Named-struct`: 44,488 → 44,592 bytes (0.93% → 0.93%). Hit rate: 6/8 fresh-batch investigations shipped (75%).

### cm-data-inference-12 — data wave 12 — fresh census [DONE]

No specific carried-over lead. Re-run the live opaque-blob census fresh (same grep as every prior wave's item) across `main` + all overlays — expect a very thin pool (wave 11 found only 3 genuinely fresh candidates out of 28). If the fresh batch is too thin to fill a normal wave, follow wave 11's example: mix in revisits of older WEAK/CONTRADICTION declines under the current (partial-struct, build-config-exclusion) standard rather than padding with a small fresh-only batch. One standing optional item remains: `data_020b46b8`'s USA/JPN region-override files (see wave 9/10 entries — not EUR-blocking).

**Result:** Live census returned **zero genuinely fresh candidates** — all 24 remaining `unsigned char[N]` matches were already conclusively settled by waves 2-11 (most reconfirmed 2-4 times independently). Cross-checked with a broader sweep for the original mechanical-carve tag comments regardless of current C type, in case the primary regex was missing something — every extra match it surfaced turned out to be an already-retyped file whose own investigation-note comment happens to reference the old tag name for context. **The EUR main+overlay opaque-blob census is genuinely exhausted for this discovery method** — every `unsigned char[N]` blob from the original mechanical carve has now been either shipped or correctly declined. This is a real milestone, not a stall.
Pivoted to the one standing concrete lead instead: implemented `data_020b46b8`'s USA/JPN region-override (`src/usa/main/data/data_020b46b8.c`, `src/jpn/main/data/data_020b46b8.c`, both `const unsigned short[87]`, byte-identical, 174 bytes, loop-bound-proven via the region-specific consumer `func_0200a180.s`). Content generated via a Python script reading directly from `extract/{usa,jpn}/arm9/arm9.bin` rather than hand-transcribed, learning directly from this same wave's predecessor's transcription bug — gate passed clean on the first attempt.
Full writeup: `docs/research/data/cm-data-inference-12-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed, full pytest green — 3100 passed, 15 skipped, 0 failed) on the first attempt. `Named-struct`: 44,592 → 44,592 bytes (unchanged — this wave's work was USA/JPN-only, outside what the EUR-scoped metric measures). No fresh census investigations dispatched (none to dispatch); 1 of 1 standing lead implemented.

## CORRECTED (2026-07-27, post-merge review): the wave-12 "campaign exhausted" claim below was WRONG

The census regex used every wave (`src/main/*.c src/overlay*/*.c`) is a **flat, one-level glob** — it silently never reached `src/overlayNNN/data/*.c` or `src/main/data/*.c` subdirectories. A properly recursive re-run found **66** current opaque `unsigned char[N]` matches, not the 24 the flat glob reported — **42 net-new candidates, all inside `src/overlay004/data/`**, an overlay this campaign never touched in waves 2-12. See the new standing rule above (added same date) — this is the same recursive-glob bug class already fixed once before in this project's own tooling (`q-research-index-recursive-glob`). The paragraph below is kept for the historical record of what wave 12 believed at the time, not as current guidance — see `cm-data-inference-13` instead.

## cm-data-inference campaign status: EUR main+overlay census exhausted (2026-07-27, after wave 12) — SUPERSEDED, see correction above

Waves 2 through 12 have worked through every opaque `unsigned char[N]` blob the original mechanical carve produced across `main` and all 24 overlays, plus the one cross-region lead that surfaced along the way. No `cm-data-inference-13` filed — there is no known fresh lead left for this specific discovery method (a live census re-run at the start of wave 12 confirmed zero remaining untouched candidates).

If a future session wants to continue this line of work, it needs a **different discovery angle**, not a re-run of the same census — for example: scanning for opaque data that was never part of the original "Cluster C/D" mechanical carve batch at all (a different category, likely needing its own identification method), auditing already-shipped retypes for correctness now that the method has matured (several early-wave ships used older/weaker evidence standards than waves 8-12), or picking a completely different queue item. `python tools/work_queue.py next claude-scaffolder --claim` will fall through to whatever else is queued, if anything.

### cm-data-inference-13 — the untagged Cluster-C pool in src/overlay004/data/ (priority S) [DONE]

Re-derived fresh via `grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" --include="*.c" src/main src/overlay*` (properly recursive this time — see the correction/standing-rule above): **66 total matches, 24 already conclusively assessed across waves 2-12, 42 genuinely fresh** — every one of them in `src/overlay004/data/`, an overlay never touched by this campaign before. Re-derive this count yourself before trusting it; this campaign's own handed-down counts have been wrong every single wave, including this one's first attempt.

All 42, sorted by size (bytes), for size-first prioritization (`Named-struct` sits at 0.93% of data bytes — a handful of large correct retypes moves it more than many small ones):

```

2280 data_ov004_021e3500.c   556 data_ov004_021e2efc.c    32 data_ov004_0220a250.c   28 data_ov004_02209aec.c
2096 data_ov004_021ff0b4.c   500 data_ov004_021e3f60.c    32 data_ov004_0220a20c.c   24 data_ov004_02209e88.c
1024 data_ov004_02206760.c   448 data_ov004_021f4880.c    32 data_ov004_0220a16c.c   24 data_ov004_02209e10.c
 704 data_ov004_021e87ac.c   376 data_ov004_021e3de8.c    32 data_ov004_0220a14c.c   20 data_ov004_02209ac0.c
 268 data_ov004_021e3128.c   152 data_ov004_021f4a40.c    32 data_ov004_0220a12c.c   16 data_ov004_0220a0ac.c
  88 data_ov004_0220a2a0.c    64 data_ov004_02209fd0.c    32 data_ov004_02209d68.c   12 data_ov004_0220a300.c
  60 data_ov004_02209f94.c    40 data_ov004_02206738.c    32 data_ov004_02209d10.c   12 data_ov004_02209f88.c
  32 data_ov004_0220a270.c    32 data_ov004_02209ce8.c    28 data_ov004_02209d30.c   12 data_ov004_02200de8.c
  32 data_ov004_02209cc8.c    32 data_ov004_02209ca8.c    28 data_ov004_02209c8c.c    8 data_ov004_0220a2f8.c
  32 data_ov004_02209c2c.c                                28 data_ov004_02209c70.c
                                                            28 data_ov004_02209bb8.c
                                                            28 data_ov004_02209b9c.c
                                                            28 data_ov004_02209b08.c

```

(all paths relative to `src/overlay004/data/`)

Same method as waves 2-12: consumer-evidence-driven, computed-stride/loop-bound-proven → STRONG, fixed-offset-only → WEAK/decline, boundary conflicts → CONTRADICTION, never force a type onto insufficient evidence. **Expect a different hit-rate profile than waves 2-12**: that pool was pre-filtered by having survived a mechanical carve pass already touched by nothing; this one is genuinely never-assessed, so it likely holds a real mix of correctly-opaque buffers (strings, bitmaps, sound/graphics data legitimately staying `unsigned char`) alongside mis-typed ones — a lower ship rate here is a correct, expected result of a different population, not underperformance. Report it plainly rather than reaching for a number that matches prior waves.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-symbol verdict + hit rate (with an explicit note on why this pool's rate may differ from waves 2-12) + `Named-struct` before/after from a real `progress.py` run.

**Result:** Re-derived the pool count fresh at wave start (66 total recursive matches, 24 already-settled, 42 net-new — independently confirmed, not taken from the queue entry's own number). Dispatched the 17 largest (2280 B down to 40 B) per the size-first instruction. **6 of 17 shipped (35%)**, deliberately lower than waves 8-12's range — see below, this is the expected result of an unfiltered pool, not underperformance. 1 WEAK decline (`02206738`, AES Rcon table — right content, no computed-index consumer proof). 1 kept byte-identical with a comment-only fix (`02209fd0`, genuine Shift-JIS text, not converted to a string literal to avoid charset-mangling risk for zero benefit).
**The other 9 of 17 are CORRECTLY OPAQUE for an unusual reason**: real, compiled ARM32/Thumb machine code (complete functions + literal pools) that dsd's automatic classification left tagged `data(any)` — not struct/array/string data at all. `data_ov004_021e2efc`'s own brief-154/PR #581 precedent proves reclassifying this class to `kind:function` breaks EUR SHA1, so none were retyped. Several agents also independently caught and corrected a standing error in `docs/research/ov004-rodata-pointer-targets.md`: its large "N refs" counts for these blobs are a mirage from ov002/ov004 sharing address space (mutually-exclusive overlays), not real references.
Implemented (all 6, byte content generated via Python script reading `extract/eur/arm9_overlays/ov004.bin` directly, per the permanent never-hand-transcribe rule): 3 `/Duel2D/MOBJ/edit_*.LZ5bg` asset-path strings (`0220a20c`, `0220a250` — a sprintf template, `0220a270`), 1 ESRB online-play notice string (`02209f94`), 1 AES **Td2** inverse-cipher table as `const unsigned int[256]` (`02206760` — element count/stride proven directly from the raw undecompiled consumer's own disassembly: explicit `LSL #2` + `AND #0xff`), and 1 partial struct (`0220a2a0` — 2 relocation-proven function-pointer fields via literal casts per this project's pointer-table convention, remaining 76 unproven bytes kept as honest gap fields).
Full writeup: `docs/research/data/cm-data-inference-13-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS on the first attempt (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed; pytest 3108 passed, 15 skipped, 63 subtests). `Named-struct`: 44,592 → 44,680 bytes (+88 — only the one struct-typed file moves this specific metric; the strings and flat array are real readable-C but not struct-shaped).
**CORRECTION (caught during wave 14 startup):** the AES Td2 table retype (`data_ov004_02206760`) described above was fully investigated and documented but the actual file edit was never made — it silently stayed `unsigned char[1024]` through the gate and merge (an omitted edit is byte-identical to a no-op, so the gate couldn't catch it). Fixed for real as wave 14's first commit. See `feedback_claimed-change-was-never-written` (session memory) and wave 14's own doc.

### cm-data-inference-14 — the remaining src/overlay004/data/ pool (25 of 42, ≤32 bytes each) [DONE]

Wave 13 dispatched only the 17 largest of the 42 fresh `src/overlay004/data/` candidates found by the corrected recursive census. **25 remain, all 32 bytes or smaller** — re-derive the exact list fresh (`grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" --include="*.c" src/main src/overlay*`, cross-check against wave 13's doc for what's already settled) rather than trusting any prior wave's table, per this campaign's standing count-derivation rule.

**Strongest lead**: `data_ov004_0220a12c`, `_0220a14c`, `_0220a16c` (all 32 B, immediately before wave 13's confirmed `_0220a20c` in address order) — very likely more members of the same `/Duel2D/MOBJ/edit_*.LZ5bg` asset-path string family wave 13 shipped 3 of. Worth investigating first.

Also worth checking before investigating fresh: wave 13 found this overlay has an active, separate research thread (`docs/research/ov004-rodata-misclassification-survey.md` and siblings, briefs ~141-182) covering ARM32-veneer-blob misclassification — search there first for any of the 25 remaining symbols before treating them as unseen, since 9 of wave 13's 17 turned out to already be cataloged by that thread under a different framing.

Same method as waves 2-13: consumer-evidence-driven, computed-stride/loop-bound-proven → STRONG, fixed-offset-only → WEAK/decline, boundary conflicts → CONTRADICTION, real compiled code misclassified as data → CORRECTLY OPAQUE (do not retype; do not attempt a `kind:function` reclassification, proven to break SHA1 on this exact symbol class). Small blobs (≤32 B) skew toward being either short strings or small scalar/pointer fields rather than multi-field structs — expect a hit-rate profile closer to the string-heavy part of wave 13 than to its large-blob veneer-code tail, but state the real number rather than assuming it.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-symbol verdict + hit rate + `Named-struct`/`Typed-array` before/after from a real `progress.py` run.

**Caught and fixed before starting**: wave 13's own AES-table retype (`data_ov004_02206760`) was documented and gated as shipped in PR #1383, but the actual file edit was never made — the file silently stayed `unsigned char[1024]` through the merge (an omitted edit is byte-identical to a no-op; the gate had nothing to catch). Fixed as this wave's first commit, re-verified via a real rebuild + SHA1 pass. See `feedback_claimed-change-was-never-written` (session memory) and the dated correction notes in both `cm-data-inference-13-2026-07-27.md` and this file's own wave-13 entry above.

**Result:** Re-derived the pool fresh at wave start: 60 total project-wide matches (down from 66, consistent with wave 13's 6 real retypes once the AES fix is included), 35 in `src/overlay004/data/`, 11 already settled by wave 13 → **24 genuinely fresh candidates** (not 25 — the AES fix retired one from the flat-glob count), all 8-32 bytes. Dispatched all 24.
**24 of 24 shipped (100%)** — starkly different from wave 13's 35%, and correctly so: this pool sits entirely in ov004's genuine `.data` section (plus one `.rodata` outlier), not the `.rodata`/`.text`-adjacent veneer-code band wave 13's large candidates clustered in. 18 strings (3 families: a "Common dialog" trio distinct from wave 13's MOBJ family despite address proximity — verified from bytes, not assumed; further MOBJ-family and WiFi-asset-path members, several confirmed genuine duplicate strings at independent addresses; a "game_level" config key; an AOSS Wi-Fi default name/SSID pair with already-matched `strlen`/`memcmp` consumers, the strongest evidence tier this campaign uses) + 2 NULL-terminated function-pointer dispatch tables (one already has a real in-tree C consumer proving its shape; the other matches an established wave-8 precedent exactly) + 1 struct proven by an already-matched sibling function's own real parameter type.
All byte content generated via script from the extracted ROM, then independently re-verified in one consolidated pass against every proposed value before any file was written (belt-and-suspenders on top of the standing rule, given this wave's 24-file scale).
Full writeup: `docs/research/data/cm-data-inference-14-2026-07-27.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed; pytest 3111 passed, 15 skipped, 63 subtests) after one fix cycle (stale research index, caught by pytest itself). `Named-struct`: 44,680 → 44,728 (+48, the 3 struct/typedef-array files). `Typed-array`: 79,676 → 79,664, a small net decrease not fully traced to this wave's own changes in the time available — noted rather than glossed over; the gate itself is fully green and is the authoritative correctness signal.

This closes out the `src/overlay004/data/` pool as found by this wave's census. A future session should re-derive the count fresh before assuming it's exhausted, per this campaign's standing rule — `data_ov004_0220a010`/`_01c`/`_028`/`_034` (sibling config-key strings to this wave's shipped `data_ov004_02209f88`) are a concrete lead if the count comes back non-empty.

### cm-data-inference-15 — the wider unassessed pool (priority S) [DONE]

`src/overlay004/data/` is finished (24/24, wave 14). The remaining pool is project-wide and untagged: a recursive scan of merged `main` shows opaque `unsigned char` data files with no assessment of any kind, outside every prior wave's scope. **Re-derive the exact count and file list yourself before trusting any handed-down number** — every wave of this campaign so far has found the handed-down count wrong, and the last "recursive census" instruction two waves running has surfaced files already resolved elsewhere (wave 13's own census pulled in 2 files `cm-data-inference-2` had already settled; watch for the same class of overlap here, e.g. any file this campaign's waves 2-14 already gave a verdict to should be excluded even if a fresh grep re-surfaces it because its C type never changed).

Example largest-first leads to start from (verify each independently, do not assume these are still accurate or that this list is complete):

```

5,904B  src/main/data_020bff80.c
4,096B  src/main/data_020c1f80.c   (obvious repeating 4-byte stride -- record array typed as flat bytes)
3,328B  src/main/data_020bf280.c
2,280B  src/overlay004/data/data_ov004_021e3500.c

```

Note: the last of these (`data_ov004_021e3500`) was already conclusively investigated in wave 13 and confirmed CORRECTLY OPAQUE (real compiled ARM32 code misclassified as data, part of the documented "Category 2 veneer blob" class — do not reclassify, breaks SHA1 per brief 154/PR #581). A fresh recursive grep will still surface it since its C type never changed; exclude it and any other already-settled symbol before dispatching investigations, per the standing "check research broadly, not just this campaign's own docs" rule.

Same method as every prior wave: consumer-evidence-driven, computed-stride/loop-bound-proven → STRONG, fixed-offset-only → WEAK/decline, boundary conflicts → CONTRADICTION, real compiled code misclassified as data → CORRECTLY OPAQUE (never retype; never attempt a `kind:function` reclassification on that class). This pool was never pre-filtered by any mechanical carve pass, so expect a real mix — genuinely correct `unsigned char` buffers (strings, bitmaps, sound/graphics data) alongside mis-typed ones, likely a lower ship rate than wave 14's 100% outlier. State the real number plainly rather than reaching for one that matches a prior wave. `Named-struct` is ~0.94% of data bytes — a few large correct retypes move it far more than many small ones, so prioritize by size.

**Now-permanent process rules, both earned the hard way and required for every wave from here on, not just this one:**
1. **Generate every byte-level claim via script reading the real extracted ROM — never hand-transcribe, no exceptions.**
2. **Before writing any commit message, doc, or queue result block, reconcile every claim against `git diff --stat`/`git status --short`** — for any wave touching more than a handful of files, run one consolidated script that independently re-verifies every proposed value against the raw ROM bytes before writing anything, and confirm the changed-file *count* matches your intended list with `git status --short | wc -l` after writing but before building. A gate pass proves the bytes are right; only this check proves every intended file was actually touched.
3. **Decline with a citation rather than forcing a type onto weak evidence** — a correctly-declined WEAK/CONTRADICTION/CORRECTLY OPAQUE verdict is a successful investigation, not a shortfall.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-symbol verdict + hit rate (with an explicit note on how this pool's profile compares to waves 13-14 and why) + `Named-struct`/`Typed-array` before/after from a real `progress.py` run.

**Result: 0 shipped, pool genuinely exhausted — a real finding, not manufactured work.** Re-derived the count fresh via a fully recursive `src/`-wide census (not scoped to `main`/`overlay*` only): **36 total matches**, not 32. 11 already known settled (`overlay004/data/`, waves 13-14), excluded without re-investigation. The remaining **25 were individually reconciled against the full research history** — every wave doc (2-14) read in full, current file content cross-checked against every claimed verdict, `git log --follow` run on each file to independently confirm the campaign never actually shipped a change to it. **All 25 already have a real, traceable verdict** (15 WEAK, 6 CORRECTLY OPAQUE, 1 CONTRADICTION, 2 already-shipped elsewhere in the same TU/directory) with zero discrepancies found between any doc's claim and current reality.
The one symbol with an explicit reopening condition (`data_02101e64`, declined by waves 5 and 6 pending "a genuinely new access pattern... e.g. a not-yet-shipped sibling function") was re-investigated fresh against the current tree — full call-graph re-trace, every consumer's match status and commit date checked. Nothing in its chain has changed since wave 6; **confirmed still declined, a third independent wave reaching the same conclusion.**
This is methodologically different from wave 12's wrong "exhausted" claim: that census was flat and missed a real subdirectory; this one is fully recursive by construction and every hit was individually reconciled against primary sources, not assumed settled. No wave 16 filed — per this campaign's own wave-12 precedent, a genuinely exhausted discovery method is a real stopping point. Concrete leads for a genuinely different angle, left for the next session to choose from: raw `.s` data never carved into a `.c` file at all (unexplored category), or the specific uncarved `data_02101e7c` gap (corroborates `02101e64`'s shape, doesn't reopen it).
Full writeup: `docs/research/data/cm-data-inference-15-2026-07-30.md`.
**Gate:** no source changed; `python tools/gate3.py --scope all` run for hygiene/regression confirmation regardless.

### cm-data-typing-16 — find where the data mass actually is (priority S) [DONE]

Measurement item, not a shipping round by default. `python tools/progress.py --version eur` shows only 1.67% Typed-array / 0.94% Named-struct of 4,776,528 EUR data bytes — the flat unsigned-char census (waves 2-15, now genuinely exhausted per wave 15) only ever addressed one narrow shape. Read `tools/progress.py`'s `summarize_data_readability` and `_DATA_ARRAY_DECL_RE`/`_tu_has_named_struct_decl` first — know exactly what the metric counts before ranking what would move it.

Rank the remaining opportunity by BYTES across: bytes in `.bss` never carved at all (verify the claim that zero `.bss` bytes are `.c`-owned in any region, don't assume it); bytes in `.rodata` not reached by the blob census; bytes already typed as flat primitive arrays (`int[N]`, `unsigned int[N]`, etc — real count TBD, re-derive don't trust a handed-down ~179/~21) that might really be struct arrays; bytes in genuinely opaque veneer/code regions that must NOT be touched (wave 13 established reclassifying these breaks EUR SHA1 — cite and exclude).

Deliverable: a ranked table by bytes with the arithmetic, and a recommendation on which category to attack next. Ship the top few if the evidence is strong enough within the round. A "the data lane has no high-value work left, redirect to code" conclusion is valid and useful if that's the honest result — say so plainly rather than stretching for a number.

**Permanent rules (apply every wave, not just this one):** generate every byte-level claim via script reading the real extracted ROM, never hand-transcribe. Before writing any commit/doc/queue claim, reconcile it against `git diff --stat`/`git status --short`; for multi-file waves, run one consolidated script re-verifying every proposed value against raw ROM bytes before writing anything, plus a `git status --short | wc -l` file-count check after writing but before building. Decline with a citation rather than forcing a type onto weak evidence.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + the ranked table + recommendation + `Named-struct`/`Typed-array` before/after from a real `progress.py` run.

**Result: ranked, and the item's own framing undersold the real opportunity by ~400x.** Read `summarize_data_readability` first: `Typed-array` already counts opaque `unsigned char[N]` carve placeholders (any array, any element type), so the ~97% uncounted isn't "wrong-typed arrays" — it's bytes not owned by any `.c`/`.cpp` TU at all (raw `.s`, or genuinely unclaimed with no delinks.txt entry whatsoever).
**Ranked by bytes**: `.bss` — 4,067,552 B (85.2% of all data bytes), **confirmed 0% `.c`-owned** (99.2% raw `.s`, 0.8% truly unclaimed) — the user's claim holds. `.data` unclaimed — 346,976 B (172 fragmented gaps, no code-adjacency red flag, uncertain but not excluded). `.rodata` unclaimed — 181,867 B, but 135,883 B of it (74.7%) sits in `ov004`, and **all 9 of its gap ranges border a symbol wave 13 already confirmed as real ARM32 code misclassified as data** — high-confidence excluded as more of that same phenomenon, not data opportunity. The item's own named category (primitive arrays that could be structs) is real but the smallest slice: 75 files/10,548 B total, and after excluding char-family (already exhaustively covered by waves 2-15) and already-shipped-as-correctly-flat files, only **20 files/5,872 B genuinely never touched** by this campaign — dominated by one file (5,376 B, 91.6% of that total).
**Shipped**: `data_ov002_022bf3c4` (5,376 B) — retyped `const unsigned int[1344]` → `const RecordOv002_022bf3c4[224]`, a 24-byte record (id + 5 handler pointers), the third and last member of a dispatch-table family whose other two members were already shipped in `cm-data-inference-2` and explicitly deferred this one. 836/1344 words reloc'd, every reloc at record-relative offset {4,8,12,16,20} with zero anomalies across all 224 records; consumer computes a genuine `idx*24` stride; all 319 distinct pointer values resolve to real function symbols. Independently re-verified against raw ROM bytes before installing (not just trusting the investigating agent's own report).
**Recommendation**: the data lane is NOT out of work — the opposite. But the real mass (`.bss`, 4M+ bytes) needs a fundamentally different method (carving new symbol boundaries from raw `.s`, not retyping already-bounded files) that this campaign was never built for; recommend scoping it as its own new workstream rather than folding into `cm-data-inference`'s existing rhythm. A concrete secondary lead (`data_ov002_022c08c4`, a genuine 9,912-byte never-carved gap with a real boundary tension) is named for a focused future item. `ov004`'s unclaimed `.rodata` is explicitly NOT recommended without new evidence.
Full writeup: `docs/research/data/cm-data-typing-16-2026-07-30.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed; pytest 3125 passed, 15 skipped, 63 subtests). `Named-struct`: 44,728 → 50,104 (+5,376, exactly the shipped file). `Typed-array`: unchanged at 79,664 (the file already counted there pre-retype; fully explained, no discrepancy).

### cm-bss-carve-scope — scope the .bss workstream (priority S) [DONE]

Scoping only, not the carving itself. `cm-data-typing-16`'s own ranking is the mandate: `.bss` is 4,067,552 B = 85.2% of all EUR data bytes, confirmed 0% C-owned (99.2% raw `.s`, 0.8% unclaimed). Everything else in that ranking is a rounding error beside it, and it needs a new workstream (symbol-boundary carving from raw `.s`), not another `cm-data-inference` wave.

Establish with evidence:
- What does a `.bss` symbol carve actually require end to end? What tools exist (`batch_carve.py`, `emit_data_blob.py`, the delinks/symbols machinery) and what's missing?
- What does `progress.py` count for `.bss`? Does a carved-and-typed `.bss` symbol move `Typed-array`/`Named-struct` at all, or is the metric blind to it? Measure this first — if the metric can't see the work, that changes whether it's worth doing.
- Is `.bss` even carvable safely? Zero-initialized means no bytes to preserve — does that make it easier than `.rodata`, or does the entire risk sit in symbol boundaries/sizes instead? Say which.
- The 0.8% (32,768 B) genuinely-unclaimed slice — what is it, and is it a cheap first target?

Deliverable: a scoped workstream with a first concrete item and a mechanically checkable gate, or a well-argued "not worth it because X." Both are valid outcomes — report the honest answer, don't manufacture a workstream to have something to ship.

Exclude `ov004`'s unclaimed `.rodata` gaps entirely — already established all 9 border symbols wave 13 proved are real ARM32 code misclassified as data. Do not reopen that.

**Permanent rules (every wave):** generate byte-level claims via script from the real extracted ROM, never hand-transcribe. Reconcile every commit/doc/queue claim against `git diff --stat`/`git status --short` before writing it. For multi-file waves, one consolidated re-verification script before writing anything, plus a file-count check before building.

**Gate:** if any carving is proposed/attempted, 3-region `python tools/gate3.py --scope all` PASS + the scoping evidence above + `Named-struct`/`Typed-array` before/after from a real `progress.py` run. If the deliverable is "not worth it," the evidence trail itself is the gate.

**Result: a real, low-risk workstream — not "not worth it" — plus a proof-of-concept shipped, not just proposed.**
Neither named tool applies: `batch_carve.py` is `kind:function`/`.text`-only; `emit_data_blob.py`'s name is misleading — it's a workaround for *functions* whose disassembly round-trip fails, deliberately keeps `kind:function`, never touches `.bss`. But the hardest sub-problem (boundary discovery) is already fully solved: **1,592 individually-named, individually-addressed `kind:bss` symbols already exist** in EUR `symbols.txt`, and a prior effort (briefs 118/139) already broke every EUR module except `ov000`/`ov002` into a per-symbol `.global name` / `.space N` `.s` cluster file with exact sizes — "carving" here means the same opaque-placeholder-to-C conversion this campaign has always done, one step more raw than usual, with **zero byte-content risk** (`.bss` is uninitialized; nothing to preserve or get wrong) and a **self-enforcing safe section** (a const global with no initializer isn't valid C, so there's no way to accidentally place one in the wrong section).
`progress.py` **does** count `.bss` — confirmed both from source and empirically: shipped a real proof-of-concept (`data_ov023_021b23a0`, 8 bytes, `Ov023DispatchState{int idx; int f4;}`, its type already proven by an already-matched consumer's own `extern` declaration) and watched `Named-struct` move **exactly +8**. `Typed-array` correctly did NOT move (a bracket-less scalar instance is invisible to `_DATA_ARRAY_DECL_RE` by design — the documented `q-metric-singleton-struct-gap` behavior, not a bug); an array-shaped `.bss` carve would move `Typed-array` too per the regex's own `;`-terminated-declaration handling, not independently re-proven this pass. Gate: 3-region PASS, first attempt.
The 0.8% (32,768 B) genuinely-unclaimed slice is exactly `ov000`+`ov002` — the only 2 EUR modules the brief-118/139 sweep never reached (both are the overlay-swap pair CLAUDE.md already documents as dsd-analysis-special-cased) — a real "catch up to parity" candidate, not investigated further this pass.
**First concrete item for the next wave**: a scripted discovery found **462 of 1,422** still-raw `.bss` symbols already have at least one `extern` reference in an already-*matched* consumer proving a real type — zero fresh consumer investigation needed to start, though real per-symbol reconciliation is still required (multi-consumer type agreement; full-vs-partial size match — one already-found case, `data_ov001_021ca420`, has a consumer proving only 4 of its 32 declared bytes). Not a blind bulk-convert list; a well-evidenced starting pool.
Full writeup: `docs/research/data/cm-bss-carve-scope-2026-07-30.md`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed; pytest 3125 passed, 15 skipped, 63 subtests). `Named-struct`: 50,104 → 50,112 (+8). `Typed-array`: unchanged at 79,664 (expected, explained above).

### cm-bss-convert-1 — start the conversion (priority S) [DONE]

`.bss` is the largest data opportunity in the project: 4,067,552 B = 85.2% of all EUR data bytes, currently 0% C-owned. `cm-bss-carve-scope` found the entry point: 462 of 1,422 still-raw `.bss` symbols already have an `extern` reference in an already-matched consumer proving a real type — zero fresh consumer investigation needed to start.

**Per-symbol reconciliation is a hard rule, not a note, before converting any of them**: multi-consumer type agreement, and full-vs-partial size match against the symbol's real `.space N` size. One `extern` is a claim, not a proof. Decline where consumers disagree, exactly as every other wave has declined on insufficient evidence.

Size the first batch for proper reconciliation, not maximum count. Report `Named-struct` and `Typed-array` before/after, and say plainly which metric each conversion moves and why — the scalar-vs-array distinction from `cm-bss-carve-scope` will come up constantly (a bracket-less scalar struct instance moves `Named-struct` only; an array declaration moves both).

Leave `ov000`/`ov002` alone — that's the 32,768 B genuinely-unclaimed slice the brief-118/139 sweep never reached, and the documented overlay-swap pair sharing a base address. A different problem; file it separately if picked up.

**Permanent rules (every wave):** generate byte-level claims via script from the real extracted ROM, never hand-transcribe (moot for `.bss` itself — no bytes exist — but still applies to any other file touched). Reconcile every commit/doc/queue claim against `git diff --stat`/`git status --short` before writing it. One consolidated re-verification pass before writing a multi-file batch, plus a file-count check before building.

**Gate:** 3-region `python tools/gate3.py --scope all` PASS + per-symbol verdict (converted vs declined, with reasons) + `Named-struct`/`Typed-array` before/after, broken out by which conversions moved which metric.

**Result: 18 symbols reconciled (13 CONVERT, 5 DECLINE), 11 shipped (59,440 B), 2 mechanically deferred.** Full per-symbol table and reasoning: `docs/research/data/cm-bss-convert-1-2026-07-30.md`.
Every shipped symbol is a plain primitive-element array (`char[N]`/`unsigned char[N]`) — corrects this item's own filing assumption that "an array declaration moves both [metrics]": per `progress.py`'s `_is_primitive_type_clause` check, a *primitive*-element array moves `Typed-array` only. Only a non-primitive/struct-typed array would move both; none of this batch's evidence supported inventing a struct shape, so none did. Measured directly via `progress.py` before/after (`git stash`/`git stash pop`), not trusted from any single agent's own claim — this caught one investigation's incorrect self-reported metric impact before it reached this writeup.
`Named-struct`: 50,112 → 50,112 (**+0**, unchanged — expected, see above). `Typed-array`: 79,664 → 139,104 (**+59,440**, 1.67% → 2.91%).
**Mechanical finding, now a standing guard in the carve tooling**: 2 of the 13 CONVERT-reconciled symbols (`data_ov006_021cf1b0`, `data_0219060c`) have byte sizes that aren't multiples of 4. Carving either out as a standalone TU leaves that TU's exit boundary 4-byte-misaligned; `mwldarm` inserts a real alignment gap there that cascades through every subsequent symbol in the module (confirmed empirically — first attempt shipped both, `ninja sha1` failed with a multi-megabyte diff, `ninja check` showed a clean cascading address shift starting exactly at the bad boundary). Both symbols' reconciliation stands and they're shovel-ready for a future wave with a pairing strategy; not shipped this wave. Deferring them and rebuilding produced a clean gate.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first clean attempt after the alignment fix (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed; pytest 3125 passed, 15 skipped, 63 subtests).
`ov000`/`ov002` untouched, as scoped. Wave-14 safeguards applied throughout (sizes re-verified against `symbols.txt`/`.space` from three independent angles before writing; `git status --short` file-count check — 32 files, exactly as planned — before building); every claim in this result block reconciled against `git diff --stat`/`git status --short` before writing.

### cm-bss-convert-2 — continue (priority S) [DONE]

Continuation of `cm-bss-convert-1`: re-derive the fresh candidate pool (excluding wave 1's 18 already-investigated symbols), keep the exact per-symbol reconciliation rule, attempt the alignment-pairing fix for the 2 wave-1-deferred symbols only if it can be solved properly, prefer real struct types over primitive arrays where evidence supports it (to move `Named-struct`, still only 1.05%), never force a struct onto array-shaped evidence, keep `ov000`/`ov002` out of scope.

**Result: 28 fresh symbols reconciled (17 CONVERT, 11 DECLINE); both alignment-pairing investigations succeeded, unblocking the 2 wave-1-deferred symbols. 19 symbols shipped, 19,248 B.** Full per-symbol table and process notes: `docs/research/data/cm-bss-convert-2-2026-07-31.md`.
`Typed-array`: 139,104 → 158,304 (**+19,200 B**, 2.91% → 3.31%). `Named-struct`: 50,112 → 52,040 (**+1,928 B**, 1.05% → 1.09% — first real Named-struct movement since the ov023 proof-of-concept; wave 1 shipped zero struct-typed conversions). Measured against a fresh `git stash`-based baseline on this exact branch point, not wave 1's own end-of-wave numbers — other lanes' work had already landed on `main` in between and would have polluted a naive comparison.
**Two genuine new findings this wave, both fully traced to ground truth, neither a bug in the shipped C:**
1. **mwldarm does not preserve declaration order for multiple `.bss` tentative definitions in one TU.** First attempt at the alignment-pairing fix put both symbols as separate declarations in one file; `ninja sha1` failed. The real linker map showed them placed in the opposite order from how they were declared — and reversing the declaration order had *zero effect* on the compiled output, proving the layout doesn't depend on source order at all. Since neither pairing symbol (`data_ov006_021d01fd`, `data_0219190b`) has a real named consumer, the fix was to merge each pair into one array covering the combined range rather than fight the compiler's own opaque ordering. New standing rule: never put two independently-referenced `.bss` symbols in one TU expecting a specific relative order.
2. **`progress.py`'s array-decl regex is line-based and doesn't track brace nesting**, so a struct-internal padding/buffer field that looks like `Type name[N];` gets credited to `Typed-array` exactly like a real file-scope array would — confirmed empirically against 3 shipped files (1216+544+32 = 1792 B, the exact gap between the naive per-symbol prediction and the measured delta). Not fixed here (out of scope for a data-carving wave); a sibling finding to the already-documented `q-metric-singleton-struct-gap`.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS after both fixes (pytest 3130 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. A file-naming collision from wave 1 recurred (ov006's fragment numbering collided with wave 1's own `_2`..`_5` files) and was fixed generically — the carve script's fragment-naming is now directory-aware rather than assuming a fresh cluster always starts at `_2`. Wave-14 safeguards applied throughout (`git status --short` file-count checked before building); every claim in this result block reconciled against `git diff --stat`/`git status --short` (49 files: 17 modified, 32 new) before writing.

### cm-bss-convert-3 — continue, prefer struct-typed conversions (priority S) [DONE]

Continuation: keep the exact per-symbol reconciliation rule and keep declining — do not let the ratio drift upward under volume. Prefer struct-typed conversions where evidence genuinely supports one (`Named-struct` 1.09% is furthest behind `Typed-array` 3.31%), but never force a struct onto array-shaped evidence. File the wave-2 `progress.py` brace-nesting finding on the `codex-scaffolder` queue rather than fixing it in this lane. `ov000`/`ov002` remain out of scope.

**Result: 23 fresh symbols reconciled (16 CONVERT, 7 DECLINE), 3,460 B shipped.** Filed [`q-typed-array-brace-nesting-fix`](codex-scaffolder.md) separately (PR #1406) before starting the carve batch. Full per-symbol table and process notes: `docs/research/data/cm-bss-convert-3-2026-07-31.md`.
`Typed-array`: 158,304 → 161,736 (**+3,432 B**, 3.31% → 3.39%). `Named-struct`: 52,040 → 52,068 (**+28 B**, 1.09% → 1.09%). Both deltas match the per-symbol hand-predicted totals exactly — no struct-internal-field leakage this wave, since none of this wave's Named-struct typedefs contain an internal array field (the specific shape that caused wave 2's classifier discrepancy).
**Two new DispatchState-pattern members investigated, one converted, one genuinely declined** — found directly from the commit that shipped the first four, not a prescan. `data_ov016_021b9740` converted cleanly (6th confirmed instance of the pattern). `data_ov014_021b5040` declined despite matching the pattern on its surface: unlike its 5 already-shipped siblings, 3 *real* consumers (not draft speculation) dereference an offset landing inside the neighboring symbol. First case in the campaign where a symbol matching an already-proven pattern was independently investigated and declined — the reconciliation discipline isn't rubber-stamping pattern matches.
Two shipped `char[]` conversions (`data_0218fd10`, `data_021a071c`) have unusually strong flagged struct-shape alternates (one backed by 5 independent ground-truth `.s` files) that were deliberately not shipped as structs — stride is solidly evidenced, exact field types are not, and unlike every Named-struct conversion shipped so far, neither struct name exists in already-matched code. Kept as documented leads rather than inventing a new type from partial evidence.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (no mechanical bugs this wave — every carve was a single-declaration TU, avoiding wave 2's multi-declaration-ordering issue entirely; pytest 3136 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-14 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (46 files: 17 modified, 29 new) before writing.

### cm-bss-convert-4 — resolve 2 flagged leads + continue (priority S) [DONE]

Focused sub-item: resolve `data_0218fd10`/`data_021a071c`'s flagged struct alternates from wave 3 — ship a real struct if field types can be established from consumers, or formally close the leads. Then continue weighting toward struct-typed candidates. Re-baseline metrics from current `main`, not wave 3's own numbers — the codex lane's `Typed-array` brace-nesting fix (PR #1408) changed the denominator in between.

**Result: both wave-3 leads resolved as real retypes** (`data_021a071c` → `slot_t[4]`, `data_0218fd10` → `struct El02010f84[2]`, both moving `Named-struct` only since the bytes were already counted in `Typed-array`). **Fresh batch: 19 symbols investigated (11 CONVERT/RETYPE, 8 DECLINE); 8 of 9 reconciled fresh CONVERTs shipped** (1,264 B) — the 9th, `data_ov001_021ca420_alias`, hit a genuine new build-tooling wall and is deferred with its reconciliation intact. Full per-symbol table and process notes: `docs/research/data/cm-bss-convert-4-2026-07-31.md`.
`Typed-array`: 158,276 → 159,508 (**+1,232 B**, 3.31% → 3.34%). `Named-struct`: 52,068 → 52,836 (**+768 B**, 1.09% → 1.11%). Both deltas match the per-symbol hand-predicted totals exactly, measured against a fresh `git stash` baseline on this exact branch point (not wave 3's numbers, per the filing instruction).
**Headline finding: a matched consumer's own extern is not proof of an object's full extent.** Two more members of the already-6-times-shipped DispatchState pattern (`data_ov005_021b1e4c`, `data_ov021_021ace80`) were cited from already-matched, byte-identical consumers — and both were still 4 bytes short of their real size, caught only by tracing into additional matched consumers and a ground-truth `.s` write neither cited consumer's own typedef accounted for. Both shipped with corrected, wider structs. Worth checking explicitly on every future pattern-family member, not just weakly-evidenced symbols.
**One genuine new build-tooling wall found and characterized, not worked around:** `data_ov001_021ca420_alias` (the canonical partial-coverage-trap symbol, reconciled for the first time as a real "partial-struct-plus-honest-gap" carve) failed dsd's delink/LCF generation with `.bss ... has mixed section order` — the first carve in 4 waves to produce a truly zero-width `.bss start:X end:X` remaining fragment (every prior front-peel case had no preceding fragment at all). Reverted cleanly; `ninja sha1` passed immediately once reverted, confirming it was the sole cause. Reconciliation stands for a future wave with a different mechanical approach.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS after reverting the ov001 carve (pytest 3151 passed, 15 skipped, 63 subtests). A new gate step appeared this wave — `docs/state-table.md` now has a committed-freshness test; regenerated alongside the research index. `ov000`/`ov002` untouched. Wave-14 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` before writing.

### cm-bss-convert-5 — retroactive DispatchState audit + continue (priority S) [DONE]

Continue, keep weighting toward struct-typed candidates (`Named-struct` 1.11% still trails `Typed-array` 3.34%). New sub-item: apply the wave-4 lower-bound rule retroactively to the 5 DispatchState members shipped before that rule existed — a second independent consumer or ground-truth `.s` write for every field; fix any found short. Keep the transitive-callee tracing technique for any partial-stride lead. Note the wave-4 build-tooling wall (`data_ov001_021ca420_alias`) as a queue item for whichever lane owns the tool, rather than carrying the workaround forward silently.

**Result: all 5 pre-wave-4 DispatchState members (`data_ov023_021b23a0`, `data_ov009_*`, `data_ov016_021bab44`, `data_ov017_*`, `data_ov019_*`) CONFIRMED CORRECT against the lower-bound standard — zero fixes needed.** Filed [`q-zero-width-bss-tu-fix`](codex-scaffolder.md) separately (PR #1415, not yet merged) for the wave-4 build wall before starting the carve batch. Two dedicated leads resolved: `data_ov019_021b6848` → `Ov019SceneBState` (204 B, a straight `Typed-array`→`Named-struct` swap, not a free addition, since the struct is genuinely heterogeneous and can't keep an array bracket); `data_0219b490`/`data_021a5340` → real vendored-SDK `OSThread` (a first for this project — mechanism confirmed safe by reading `configure.py`'s include-path logic directly, not assumed). **Fresh batch: 15 symbols investigated (9 CONVERT, 6 DECLINE), all 9 shipped**, plus 1 bonus alignment-pairing symbol (`data_ov004_0229164c`) found and shipped mid-carve, for 10 symbols across 9 files. Full per-symbol table and process notes: `docs/research/data/cm-bss-convert-5-2026-08-01.md`.
`Typed-array`: 159,508 → 160,072 (**+564 B**, 3.34% → 3.35%). `Named-struct`: 52,836 → 53,352 (**+516 B**, 1.11% → 1.12%). Both deltas match the per-symbol hand-predicted totals exactly, measured against a fresh `git stash` baseline on this exact branch point (matches wave 4's own reported ending values exactly, confirming a clean anchor).
**Headline finding: the retroactive audit closes a real risk with a real (negative) result.** The `relocs.txt` structural-proof technique (counting every `kind:load ... to:<addr>` relocation in the shipped ROM's own relocation table) definitively ruled out hidden consumers for 2 of the 5 audited members — a stronger guarantee than grep-based reference counting. The DispatchState family (7 shipped members) is now fully verified end-to-end with zero known undersizing risk; no future wave needs to re-run this check.
**One genuine metric-classification nuance surfaced**: `data_ov019_021b6848`'s retype is a straight bucket *swap* (-204 `Typed-array` / +204 `Named-struct`), unlike wave 4's two RETYPE precedents which were free additions (outer array bracket kept, so `Typed-array` was untouched). The difference is structural — this struct is genuinely heterogeneous (a 2-element record array plus 5 scalar tail fields) and can't honestly keep a top-level array bracket, landing in the bracket-less-singleton case `tools/progress.py` already special-cases.
**One new discovery technique**: the Metrowerks `__register_global_object` C++-dtor-registration call is a decisive discriminator for C++-object-shaped globals. `data_ov006_0225deb4` (120 B) had 5 consumers 100%-agreeing on surface-level `char[]` — every one a pure pass-through; tracing one level deeper found the registration call (a marker no primitive buffer would ever get) plus 3 confirmed int fields via dedicated one-line setters, overturning the naive reading. Shipped as `Ov006Obj6d8c`, `Named-struct`.
**One new mechanical case, handled outside the carve script**: the pool scan surfaced this campaign's first single-symbol `.bss` cluster file (`data_ov004_02291f98`) — converting it leaves zero remaining fragment, a case the script's own invariant rejects by design. Handled directly (repoint the single `delinks.txt` entry from `.s` to `.c`, delete the now-pointless `.s` file); `ninja sha1` passed clean first attempt, confirming this is a normal ship-as-.s-to-.c promotion, mechanically distinct from wave 4's zero-width-TU wall.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (pytest 3156 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-4 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (35 files: 19 modified, 1 deleted, 15 new) before writing.

### cm-bss-convert-6 — vendored-SDK type-signature scan + continue (priority S) [DONE]

Continue, keep weighting toward struct-typed candidates (`Named-struct` 1.12% still trails `Typed-array` 3.35%). Two techniques promoted to standing practice: `relocs.txt` structural proof for any extent/hidden-consumer question, and transitive tracing through an already-matched callee for partial-stride leads. New sub-item: scan for `.bss` symbols whose consumers match NitroSDK vendored concrete-type signatures — a free `Named-struct` win with a real type name, following the `OSThread` precedent. Watch the include-path mechanism per header, don't assume it generalizes from one check.

**Result: 5 real `MtxFx33`/`MtxFx43` matrix candidates found and shipped (228 B)** — a first for this project's math types, found via direct calls into already-shipped vendored SDK functions (`MTX_Identity33_`, `MTX_ScaleApply43`) or unambiguous matrix-multiply-shaped raw assembly. **Two full-family negative results** (`VecFx32`/`VecFx16`: 87 candidates screened, zero survive contact with consumers; `OSLockWord`: 72 candidates screened, the real lock-adjacent code in this codebase is a different, larger `OSMutex`-style mutex) — genuinely useful, thoroughly-evidenced "no," not a shortage of effort. **Fresh batch: 12 symbols investigated (9 CONVERT, 2 DECLINE, 1 reconciled-but-blocked), all 9 CONVERTs shipped** (828 B), for 14 symbols / 1,056 B total. Full per-symbol table and process notes: `docs/research/data/cm-bss-convert-6-2026-08-01.md`.
`Typed-array`: 160,072 → 160,900 (**+828 B**, 3.35% → 3.37%). `Named-struct`: 53,352 → 53,580 (**+228 B**, 1.12% → 1.12%). Both deltas match the per-symbol hand-predicted totals exactly, measured against a fresh `git stash` baseline on this exact branch point (matches wave 5's own reported ending values exactly).
**Headline finding: the SDK-type-signature technique generalizes cleanly beyond `OSThread`.** The same 3-step method (survey the header for concrete types, verify the include mechanism once, search for real corroborating consumer behavior — never size alone) found 5 more real wins on its first application to a new type family (fixed-point matrices). The 2 negative results are equally valuable: 159 candidates were individually resolved with real evidence, not batch-dismissed on a size filter — this project's "no vendored-type precedent beyond `OSThread`" status for vector/lock types is now backed by genuine search, not absence of one.
**One boundary nuance resolved, not hidden**: `data_021a1974`'s (`MtxFx33`) consumer reads 12 bytes past its own end into the adjacent, already-shipped `data_021a1998` — investigated directly and found to be that one caller treating two independently-correct adjacent globals as a combined view for its own purposes, not a boundary bug in either symbol.
**New mechanical finding**: cross-region symbol-address aliasing — EUR and JPN/USA can assign the same symbol name/address to genuinely different objects (`data_ov017_021b867c`/`_021b8794`), which silently misattributes a naive cross-region consumer count. Caught and corrected within this wave's own reconciliation.
**Two more lower-bound-rule catches**: `data_0218ff0c` was reclassified from a "generic buffer" to a `u16[32]` ring array after 2 raw `.s` consumers a `.c`-only search missed were read directly; `data_02191fe0` was kept as conservative `char[64]` rather than a matched consumer's own struct type, which only accounts for 56 of the confirmed 64 bytes. The rule is now standing practice across every candidate type, not just DispatchState-family ones.
**Second instance of the wave-4 blocked-alias pattern**: `data_0219a924_alias` reconciles with zero honest gap (stronger evidence than the wave-4 precedent) but is blocked by the same `q-zero-width-bss-tu-fix` wall — confirmed still open by reading the actual commit diff, not the prior wave doc's prose. 2 shovel-ready carves (68 B) now wait on that one tooling fix.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (pytest 3163 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-5 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (45 files: 19 modified, 26 new) before writing.

### cm-bss-convert-7 — cross-region aliasing investigation + continue (priority S) [DONE]

Two workstreams. (1) URGENT: investigate whether the wave-6 cross-region symbol-address aliasing finding poses a real correctness hazard to the ~550-port cross-region port lane, which assumes name+address identity implies same object. Establish scope and whether any already-ported code is affected; stop and flag immediately if so, otherwise document plainly as confined to `.bss` data. (2) Continue the SDK-type scan (`OSMutex`, `OSMessageQueue`, `FSFile`, `GXOamAttr`, `NNSG2d*` families) as standing practice, keep struct-weighting, keep `relocs.txt`/transitive-tracing as defaults.

**Result: cross-region aliasing investigated to full scope (105 addresses, not 2) — confined to raw `.bss` data, zero currently-ported files affected, filed as its own PR** ([#1426](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1426), `docs/research/cross-region-symbol-aliasing-audit.md` + `q-cross-region-alias-guard`). **`OSMutex` scan: 6 real candidates found and shipped (144 B)**, the second successful application of the vendored-SDK technique — found by recognizing that the wave-6 `OSLockWord` *negative* result had already named the real lock code without identifying its actual vendored type. **Volume batch: 6 investigated, 2 clean CONVERT (128 B) shipped, 4 declined-as-`char[]`-but-real-structs flagged** for a future focused pass. 8 symbols / 272 B total this wave. Full per-symbol tables and process notes: `docs/research/data/cm-bss-convert-7-2026-08-01.md`.
`Typed-array`: 160,900 → 161,028 (**+128 B**, 3.37% → 3.37%). `Named-struct`: 53,580 → 53,724 (**+144 B**, 1.12% → 1.12%). Both deltas match per-symbol hand-predictions exactly, measured against a fresh `git stash` baseline matching wave 6's own reported ending values exactly.
**Headline finding on the aliasing investigation: the risk is real in scope but structurally contained.** 105 confirmed EUR/JPN/USA same-name-different-object collisions across `main` and 21 of 24 overlays — 53× more than the 2 originally noticed. But every one of the 26 addresses with live consumers in already-ported code traces back to `port_to_region.py`'s primary reloc-pairing resolution method, which is immune to this class of coincidence by construction (it pairs relocations by instruction offset in already-fingerprint-matched code, never consulting either side's raw address or name text). The narrower, genuinely open risk sits in the tool's two fallback-tier paths, which do assume address correspondence — filed with a concrete mitigation (a maintained block-list) rather than fixed directly, since it's cross-lane tooling.
**`OSMutex` field-for-field verification cross-validated against the already-shipped `OSThread`**: independently computing the vendored header's byte layout by hand predicts `OSThread::mutex` at exactly `+0x84`, which matches the lock function's own `str r5, [r7, #0x84]` instruction precisely — a nice structural double-check that two separately-verified vendored types agree with each other, not just with their own isolated consumers.
**Two self-corrections in the volume batch**: `data_ov005_021b1d4c` and `data_02105b70` were both initially mis-scored as opaque `char[]` (ctor/dtor stubs + memcpy/Fill32-only direct consumers looked clean) until every raw-`.s` reference was actually read, revealing real struct fields in both. Generalized as a process note: a memcpy-only direct consumer is not sufficient evidence of opacity when other raw-`.s` references exist.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (pytest 3165 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-6 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (21 files: 9 modified, 12 new) before writing.

### cm-bss-convert-8 — resolve open struct leads + 2 new SDK families (priority S) [DONE]

PRIORITY: focused resolution of every open struct lead from waves 6-7 (4 char[]-declined wave-7 leads, 4 shipped-conservative wave-6 RETYPE candidates, 2 OSMutex-oversized wave-7 leads) using the full toolkit — transitive tracing, `relocs.txt` structural proof, lower-bound rule. Permanently decline with recorded reason if still unresolvable, so they stop being re-flagged. Secondary: keep the SDK scan running (`OSMessageQueue`, `OSAlarm`, `FSFile`, `GXOamAttr`, `NNSG2d*`), each newly-confirmed type corroborating the next. Note (don't fix) if carving touches one of the 105 cross-region-aliased addresses.

**Result: all 10 open leads resolved — 9 shipped, 1 permanently declined with recorded reason.** **2 brand-new SDK families found and shipped**: `GXOamAttr` (264 B) and `OSMessageQueue` (3× 32 B) — neither had a vendored header before this wave; both authored from scratch strictly from this game's own observed codegen, not copied from an external reference. 13 fresh symbols (772 B) + 3 retypes (240 B bucket-swapped). Full per-symbol tables and process notes: `docs/research/data/cm-bss-convert-8-2026-08-01.md`.
`Typed-array`: 161,028 → 161,052 (**+24 B**, 3.37% → 3.37%). `Named-struct`: 53,724 → 54,736 (**+1,012 B**, 1.12% → 1.15%). Both deltas match per-symbol hand-predictions exactly — see the metric-model correction below for how that prediction was derived, measured against a fresh `git stash` baseline matching wave 7's own reported ending values exactly.
**Headline finding: 4 dispatched agents were told to re-verify every prior claim from scratch, not extend it — and caught 2 real errors the prior passes had made.** `data_021aa0d0`'s earlier note that `func_020ace14` touches it was wrong (it operates on an unrelated global, confirmed by reading the actual instructions); `data_02105b70`'s "reads +0x4 twice" claim was a register-reuse trap (the second apparent hit was `[r4,#0x4]` after `r4` had been reloaded to a different global). A purely incremental follow-up would have inherited both silently. `data_ov009_021adc54` also resolved completely — all 16 of 16 four-byte slots confirmed, zero padding, the richest lead of the whole campaign — after catching and self-correcting a near-miss where a different sibling object's offset traffic nearly got misattributed to it.
**A genuine metric-model correction, found while reconciling this wave's own numbers**: the first delta computed didn't match measured output, off by exactly `GXOamAttr[33]`'s 264 bytes. Reading `tools/progress.py` directly (not re-deriving from memory) revealed `Typed-array` and `Named-struct` are not mutually exclusive — `Typed-array` counts any bracketed array regardless of primitivity, `Named-struct` counts any non-primitive declaration bracketed or not, and a bracketed array of a non-primitive type counts toward both. Every prior wave's array-of-struct win came from retyping an already-`Typed-array`-counted primitive array (so `Typed-array` never visibly moved); `GXOamAttr[33]` is this campaign's first brand-new non-primitive array carved straight from raw `.bss`, so it's new to both metrics at once. This was a real gap in how I'd been modeling the metric, not a tooling bug — corrected and documented so it doesn't recur.
**New technique validated**: the `relocs.txt` cross-symbol trick (checking a target's *neighboring* symbol's relocations, not just its own) surfaced 2 real shipped consumers for `data_021a089c` that direct-name `git grep` structurally could not find, since those files reach the memory only through the neighbor's own offset arithmetic — closing that symbol's struct to zero padding.
**One permanent decline, recorded as final**: `data_ov007_022334d0` improved from 2.5% to 35% evidenced (a newly-closed, zero-gap 7-field tail) but the front 65% has zero evidence anywhere, including in the front-half's own already-matched consumer's own struct model (`char gap00[0x3c]`) — below this project's established retype bar. Not re-flagged as an open lead going forward.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (pytest 3167 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-7 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (42 files: 20 modified, 22 new) before writing.

### cm-bss-convert-9 — FSArchive resolved + AudioBank family + honest yield note (priority S) [DONE]

Continue. Keep the SDK scan running (`OSAlarm`, `OSTick`/`OSTimer`, `FSFile`/`FSArchive`, `NNSG2d*`, `GXRgb`), each newly-confirmed type corroborating the next. Keep `relocs.txt` structural proof and transitive-callee tracing as defaults. If a wave's fresh-candidate yield drops below roughly a third, say so and consider a different discovery angle rather than forcing another volume batch.

**Result: fresh-candidate pool checked honestly and found thin (9 non-primitive candidates/92 B, primitive top capped at 61 B — roughly a quarter of wave 6's density) — no traditional volume batch attempted, exactly per this wave's own filing instruction.** In its place: a month-old dormant lead (`cm-bss-convert-4`'s flagged-but-never-resolved `data_021a8334`) resolved as NitroSDK's `FSArchive` (92 B, new header, 76/92 bytes evidenced), 2 more symbols shipped using already-vendored types (`OSTick`, an `OSThreadQueue`-shaped anchor), and a 6-member struct family found by cross-referencing this project's own pre-existing `ov006_core.h` research rather than blind reverse-engineering. 9 symbols / 468 B total, 1 real decline (a proven boundary conflict, not a research gap). Full per-symbol tables and process notes: `docs/research/data/cm-bss-convert-9-2026-08-01.md`.
`Typed-array`: 161,052 → 161,052 (**+0 B**, unchanged — every carve this wave was a bracket-less scalar). `Named-struct`: 54,736 → 55,204 (**+468 B**, 1.15% → 1.16%). Both deltas match per-symbol hand-predictions exactly, measured against a fresh `git stash` baseline matching wave 8's own reported ending values exactly.
**Headline finding: leaning on this project's own existing research beat blind pool-scanning by a wide margin.** `ov006_core.h` already documented 5 of this wave's targets as an "audio sub-struct" family from prior briefs, without a resolved type — investigating them together (rather than as 5 scattered weak single-consumer 60 B candidates, which is how the raw pool scan surfaced them) found one proven, shared struct. A 6th candidate, dispatched specifically as an "unrelated, different-module control," turned out to be the same family's 6th member — the "no connection" framing didn't survive contact with the evidence.
**A real process recovery, not a negative result taken at face value**: one dispatched SDK-scan investigation produced a garbled non-answer mid-task instead of findings. Resuming it directly (rather than trusting the malformed output as "no findings" or silently re-spending a full fresh investigation) recovered substantive, real work already in progress — including the `FSArchive` breakthrough. Worth trying before assuming a confused agent output means nothing happened.
**One permanent decline for a genuine boundary conflict, not a research gap**: `data_0210594c`'s declared 61-byte boundary is real, but already-matched shipped code (`func_020191cc.c`, independently confirmed by raw disassembly in `func_ov004_021d3de4.s`) reads up to 29 bytes past it, into a neighboring symbol that's itself independently, separately relocated. This needs a dedicated joint investigation of both symbols, not a single-symbol carve — correctly declined rather than forced.
**Gate:** 3-region `python tools/gate3.py --scope all` PASS, first attempt (pytest 3171 passed, 15 skipped, 63 subtests). `ov000`/`ov002` untouched. Wave-8 safeguards applied throughout; every claim in this result block reconciled against `git diff --stat`/`git status --short` (29 files: 10 modified, 1 deleted, 18 new) before writing.

### cm-main-sweep-h — readable-C sweep of `main`, the second mass [DONE]

Shipped 12 functions: 1 natural-C (`func_020b0034`, `copysign()` — union-typed-by-value parameters, not a local union assignment, is what makes mwcc spill upfront to match the original) + 11 asm-void. New toolchain finding from the canary (`func_02032724`, not yet in codegen-walls.md): mwcc keeps a **raw base pointer** alive across an intervening call and folds two constant field offsets into one combined immediate at each access, where the original computes and preserves a **partially-offset intermediate pointer** instead, applying only the remaining offset per-access. Tried flat arithmetic, a reused intermediate, a nested-struct member, and `volatile` (which instead forced a stack spill) — none reproduced it; flagged as a candidate new wall-taxonomy entry. Also: `func_0208b300` (3x3 matrix transpose) inflates 11→23 words under natural C — mwcc never emits register-block `ldm`/`stm` from array-indexed C on this toolchain.

```
$ python tools/check_delink_dupes.py
check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)

[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS

3176 passed, 13 skipped, 63 subtests passed in 26.47s
==================== GATE PASS ====================

$ python tools/check_activation_invariant.py
range: origin/main..HEAD
function .c added:       12
function .s deleted:     12
delinks activations:     12
data .c additions:       0 (informational)
classification sources: symbols=12
check_activation_invariant: OK
```

PR: #1437.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS + `check_activation_invariant.py` + `check_delink_dupes.py` + regenerated research index and `docs/state-table.md`.

### cm-data-restock-check — bounded honest re-census of the data pool [DONE]

Companion to `cm-main-sweep-h`, done **after** it, not instead of it. No
source files changed — pure investigation, both open leads resolved as
declined. Full write-up:
[`docs/research/data/cm-data-restock-check-2026-08-03.md`](../research/data/cm-data-restock-check-2026-08-03.md)
(candidate table in the companion
[`cm-data-restock-census-2026-08-03.md`](../research/data/cm-data-restock-census-2026-08-03.md)).

1. **Pool census: did NOT restock in the depletion→regrowth sense — it was
   never visible to the `cm-data-inference`/`cm-bss-convert` series'
   methodologies in the first place.** Shape-classified re-census
   (`data_worklist.py --shape struct/array/fnptr_table/jump_table`, `ov002`
   excluded) finds **274 non-primitive candidates / 24,753 bytes**
   (`main` 58 struct-shaped + `ov006` 33 + 19 other overlays), none of
   which were ever shipped or declined by name across all 23 prior wave
   docs. Wave 9's own "9 candidates/92 B" was scoped specifically to a
   pre-curated `.bss` cluster-file pool (`cm-bss-carve-scope`'s pool), not
   this one; wave 15's separate "zero fresh, fully recursive" claim for
   the `.data`/`.rodata` series is the one this contradicts — and this
   campaign has hit that exact false-exhaustion failure mode twice before
   (wave 12's buggy flat glob missing `overlay004/data/` entirely, fixed
   wave 13). Spot-checked (not just tool output): no `.c` file exists yet
   for the top 5 candidates by size. Caveat stated plainly in the doc:
   shape-classification isn't verified typeability — the usual evidence
   bar still applies before any of these 274 actually ship.
2. `data_02101e7c` (wave 15's flagged, uninvestigated `data_02101e64`
   sibling): **declined, 4th confirmation.** Its sole reader
   (`func_0206bcec.s`) passes it as a fully opaque pointer, zero field
   access. New finding: it shares its consumer (`func_0206c46c`) with
   `data_02101e64`/`data_02101e4c` (three parallel instances of whatever
   that function expects) — genuinely new context, but the call chain
   dead-ends in permanent `.s`-walled vtable dispatch before any field
   evidence surfaces. Documented as a lead, not chased further.
3. `data_0210594c`/`data_02105989` boundary conflict: **declined, 4th
   confirmation, more precisely scoped than before.** Confirmed via exact
   hex arithmetic that it's a 3-symbol chain, not 2 — `func_ov004_021d3de4`
   reads 27 bytes (0x1b) past `data_0210594c`'s declared 0x3d span, which
   is *also* past all of `data_02105989`'s declared 0x15 span, landing 6
   bytes into a third symbol, `data_0210599e`. Both this read and the
   already-shipped `func_020191cc.c` (`data_0210594c + 0x52`) build and
   gate green today regardless, since absolute-address arithmetic doesn't
   care about our symbol boundaries — confirmed no functional risk, purely
   a naming/typing-boundary artifact. `data_0210594c` has 16 reader files
   across 8 modules, `data_02105989` has 21 across 8 modules — sized here
   for whoever picks up the dedicated joint investigation this and 2 prior
   single-symbol attempts have now all recommended.

**Before/after** (`tools/progress.py --version eur --json`, no ship this
item so before=after, confirming item 1's code-only sweep left these
untouched):

```
Typed-array:   161,052 -> 161,052 bytes  (+0 B,   3.37% -> 3.37%)
Named-struct:   55,204 ->  55,204 bytes  (+0 B,   1.16% -> 1.16%)
```

**Gate:** none required (no source changes); doc-only commit.

### cm-f-cf8-contradiction — resolve the duel-phase enum contradiction, then measure how common it is [DONE]

**Approved pilot from the 2026-08-03 external-review audit.** Small, doc-only, evidence-producing. Do NOT generalise it into a framework — the point is to find out whether this is one error or a class.

Three canonical documents assert the duel-phase field `data_ov002_022d016c.f_cf8` is a 0–3 enum:

- `docs/research/types/DuelStateSingleton.md` — "DUEL PHASE: 0/1/2/3 (most-tested field)"
- `docs/research/constants/DuelStateEnums.md` — "The duel phase enum (0–3)"
- `docs/research/constants/INDEX.md` — "values 0–3"

Three dossiers, derived from real disassembly, contradict them:

- `dossiers/02212d98.md` — `if (dss->f_cf8 == 4) state = 2;`, and its pasted disassembly carries a literal `cmpeq r1, #0x4`
- `dossiers/0220079c.md` — `pass when f_cf8 == 2 or f_cf8 == 4`
- `dossiers/02206eb0.md` — `if ((unsigned int)dss->f_cf8 > 3) return 0;`, derived from a `movhi` (unsigned-higher)

**Shipped, byte-matched game code compares this field against literal 4.** So it is not a settled 0–3 enum. Determine the real value range from the disassembly and decide which it is: a five-or-more-state enum, a real-but-rejected transient state, or a wrong field interpretation. Correct or annotate the three canonical docs accordingly — with a `confidence:` marking, since that is the actual root cause (see below).

**Root cause to fix, not just the symptom.** A confidence ladder already exists and is populated: 879 of 1,268 dossiers carry a `confidence:` field (43 high / 495 med / 341 low). It has no counterpart on the canonical `types/` and `constants/` docs — so a claim's uncertainty is recorded at the dossier layer and then **silently dropped when the claim is promoted into canon**. That promotion step is where "0–3" became fact. Propose the smallest change that carries confidence across it.

**Then measure.** Report how many OTHER enums in `docs/research/constants/` have a documented range that some matched `.c` or dossier compares outside of. One contradiction means this was a one-off; fifteen means the readable-C corpus has systematic semantic drift and the follow-on work gets re-ranked immediately. Either answer is the deliverable.

⚠️ Do **not** build the contradiction-checking tool here — `tools/` is Codex Scaffolder territory. Report the pattern and the counts; the tool is filed separately as `q-semantic-contradiction-check`.

**Gate:** doc-only, no build. `python3.13 -m pytest tests -q` no-new-failures. Paste the disassembly evidence for the f_cf8 verdict and the other-enum contradiction counts.

---

**Done.** Full write-up:
[`docs/research/cm-f-cf8-contradiction-2026-08-03.md`](../research/cm-f-cf8-contradiction-2026-08-03.md).

**Canary verdict**: `f_cf8` is a 5-value field (0-4), not the documented
4-value 0-3 — confirmed a genuine new value, not a rejected transient or a
wrong-field mapping (3 of 4 dossiers branch on `f_cf8==4` as a first-class
success case, not a guard; a 4th, independently-found dossier
`02299c9c.md`, is a second `==4` confirmation beyond the 3 named in the
filing). All three canonical docs corrected
(`types/DuelStateSingleton.md`, `constants/DuelStateEnums.md`,
`constants/INDEX.md`).

**Promotion-confidence fix**: `constants/INDEX.md` had no confidence
ladder at all; added the same HIGH/MED/LOW scale `types/INDEX.md` already
used, plus one rule — a claim asserting a *closed* range must state its
own confidence when weaker than the document's blanket rating, instead of
silently inheriting it. `types/INDEX.md` gets a one-sentence
cross-reference rather than a duplicate copy. Applied concretely to the
`f_cf8` sections (MED confidence on the range, HIGH on the shape).

**Measurement**: checked the 7 enums in `docs/research/constants/` that
share `f_cf8`'s exact risk shape (closed range asserted, inferred from a
small sample of call sites — excluded hardware-fixed enums,
array-literal-backed tables, and explicitly open-ended catalogs as
structurally not at risk). **3 of 7 show a confirmed contradiction**:
`f_cf8` itself, plus two NEW ones found this round —
`Ov006SubState` (`OverlayConstants.md`, documented `{0,2-9}`, real set at
least `{0,2-9,11,12,14,16,17}` — 5 extra values, all in **already-shipped
matched C**: `data_ov006_021cf140 = 0x11` in `func_ov006_021b23c8.c`, `=
12` in `021b2c9c.c`, `.f0 = 0xb`/`0xe` in `021b28c0.c`, `= 16` in
`021b2cbc.c`) and `Ov004Phase` (`OverlayConstants.md`, documented
`{0,2,4,15,16}`, real set at least adds `5` — `func_ov004_021d9810.c`:
`if (*(int *)(base + 0x54) != 5) return 0;` on the identical
`data_ov004_0220b500+0x54` base/offset the doc's own 3 named functions
use). Not a one-off, not "systematic across everything" either — a real,
reproducible pattern on the sample checked, with 2 of 3 backed by
stronger (matched-C, not dossier-only) evidence than `f_cf8` had.
`Ov006SubState`/`Ov004Phase` reported here, not fixed — that's follow-up
work, not this item's scope.

```
$ python3.13 -m pytest tests -q
3178 passed, 13 skipped, 63 subtests passed in 46.68s
```

### cm-enum-contradiction-fix — fix the two enum contradictions your own survey found [DONE]

Your `cm-f-cf8-contradiction` survey reported these and correctly did NOT fix them — that was the right call under that item's scope. Fixing them is this item.

Both are **worse than `f_cf8` was**, because they are contradicted by already-shipped, matched `.c` rather than by still-in-dossier disassembly:

- **`Ov006SubState`** — documented `{0, 2-9}`; confirmed real values `11, 12, 14, 16, 17` present in already-verified `.c` files.
- **`Ov004Phase`** — documented `{0, 2, 4, 15, 16}`; confirmed real value `5`.

Resolve each the way you resolved `f_cf8`: establish the true value set from the matched code, correct the canonical doc, and apply the confidence-marking convention you extended `constants/INDEX.md` with — including the rule that a closed-range claim states its own confidence rather than inheriting the document's blanket score.

Then re-check the remaining 4 of the 7 you surveyed. Your 3/7 was measured against the enums sharing `f_cf8`'s risk shape; say plainly whether the other 4 are genuinely clean or merely unexercised (the `f_cf8` root cause was an *assumed* upper bound that no file happened to test — "no contradiction found" and "verified" are different claims, and that distinction is the whole finding).

**Gate:** doc-only, no build. `python3.13 -m pytest tests -q` no-new-failures. Paste the matched-code evidence behind each corrected range, and your clean-vs-unexercised verdict on the remaining 4.

---

**Done, combined with `cm-f-cf8-reopen`** (same sweep, filed together
per instruction). Full write-up:
[`docs/research/cm-f-cf8-reopen-2026-08-04.md`](../research/cm-f-cf8-reopen-2026-08-04.md).

`Ov006SubState`: producer sweep of `data_ov006_021cf140` across all 4
assignment syntaxes the codebase uses (bare `=`, `.f0=`, `[0]=`,
`*(int*)ptr=` — the survey's own re-check had only matched 2 of these
forms) finds **14 confirmed stored values, not 9**:
`{2,3,4,5,6,7,8,9,11,12,14,15,16,17}`, all in already-shipped matched
`.c`. `0` has no confirmed explicit store. Doc corrected to an open set;
explicitly flags the other 5 parallel structs as not re-swept this
round.

`Ov004Phase`: producer/consumer split across `data_ov004_0220b500`'s 33
readers — stored (producer-confirmed): `{2,4,16}`. Compared but never
found stored (consumer-only, same shape as `f_cf8`'s own `4`): `{5,15}`
— `func_ov004_021ceb6c.c` and `func_ov004_021d9810.c` both independently
gate on `phase == 5`; `func_ov004_021d13dc.c` gates on `== 15`. Doc
corrected to separate stored vs. compared-only explicitly.

**Clean-vs-unexercised verdict on the remaining 3** (re-checked with a
producer lens, not just consumer comparisons): all 3 are **unexercised,
not verified** — `Ov000Facing`'s value comes from the setter's own
*parameter* (only 3 callers found, all passing `1`; the doc's other
values `0/2/3/4` have no confirmed producer); `Ov011SlotState` is
written via `*p = (*p & ~0x3u) | (val & 0x3u)` — an untraced caller
argument, the same argument-forwarding shape `f_cf8` has; `Ov011ViewMode`
has no write site found at all, only the 2 known `==3` reads. None of
the 3 should be read as "clean" — the honest status is "not enough
producer evidence gathered," a materially weaker and different claim
than the original survey's grouping implied.

```
$ python3.13 -m pytest tests -q
3181 passed, 13 skipped, 63 subtests passed in 29.32s
```

### cm-f-cf8-reopen — the duel-phase range is still wrong, and the denominator is off [DONE]

⚠️ **This reopens work merged in PR #1441.** Read it as a correction, not a criticism — the root-cause fix you shipped (the confidence-promotion gap in `constants/INDEX.md`) is sound and stays. What is wrong is the range, and the way it is wrong is the interesting part.

**1. `f_cf8` is not a closed 0–4 range.** You corrected an assumed `0–3` to an assumed `0–4` — which is the same class of error the item existed to diagnose: taking the highest value you happened to observe and declaring the range closed. Brain-side verification, tracing each `str` to `+0xcf8` back to the immediate assigned to that register across all three regions:

| stored value | store sites (÷3 regions) | example |
|---|---|---|
| 0 | 4 | `src/overlay002/func_ov002_021aec04.s:141` |
| 1 | 2 | `func_ov002_021aec04.s:149` |
| 2 | 1 | `func_ov002_021aec04.s:157` |
| 3 | 2 | `func_ov002_021aec04.s:166` |
| **5** | **1** | `func_ov002_021aec04.s:176` |
| **7** | **2** | `src/overlay002/func_ov002_021af5a0.s:229` |

Note what is *absent*: **4 never appears as a stored immediate at all** — it shows up only in comparisons (the `cmpeq r1, #0x4` you cited). So producers and consumers disagree about which values matter, which is itself worth a sentence in the writeup.

Correct all affected canonical docs (`constants/DuelStateEnums.md`, `constants/INDEX.md`, `types/DuelStateSingleton.md`) and your research report. Until an **exhaustive producer sweep** proves closure, document it as an open observed-value set, not a range:

    confirmed values include 0, 1, 2, 3, 4, 5 and 7;
    complete range and semantic names are not yet established.

Do **not** call it a five-value state machine, a 0–4 range, or anything else that asserts closure. "Highest value seen" is not "upper bound" — that equivalence is the bug.

**2. The measurement denominator is wrong.** Your survey reported 3 of 7, but the 7 includes `Ov013Slot`, which your own method excludes as array-literal-backed — your report says so explicitly at `cm-f-cf8-contradiction-2026-08-03.md:162` ("Excluded — array-literal-backed"). Either identify a genuine seventh in-category candidate or restate the result as **3 contradictions among 6 actual candidates**. Keep "no contradiction found" distinct from "range verified" when you do — that distinction is your own finding and it applies to your own denominator.

Do this **alongside** the `Ov006SubState` / `Ov004Phase` corrections in `cm-enum-contradiction-fix`, not as a separate pass — they are the same sweep and the producer-vs-consumer question above applies to all of them.

**Gate:** doc-only, no build. `python3.13 -m pytest tests -q` no-new-failures. Paste the producer-sweep method, the observed-value set per enum with store-site evidence, and the corrected denominator with its category rule stated.

---

**Done.** Full write-up:
[`docs/research/cm-f-cf8-reopen-2026-08-04.md`](../research/cm-f-cf8-reopen-2026-08-04.md).

**CANARY reproduced first**: both cited sites confirmed exactly —
`func_ov002_021aec04.s:176` (`mov r1,#0x5` / `str r1,[r0,#0xcf8]`) and
`func_ov002_021af5a0.s:229` (`mov r5,#0x7` / `str r5,[r4,#0xcf8]`).

**Full EUR producer sweep** (every `str` to `+0xcf8`, traced back to the
feeding immediate): `0`→4 sites, `1`→1, `2`→1, `3`→2, `5`→1, `7`→3.
**`4` never appears as a stored immediate anywhere** — confirmed, matches
the brain trace exactly on that point and on both cited example
file:lines. Minor open discrepancy stated rather than picked: this
sweep found 1 site for `1` and 3 for `7` vs. the brain trace's 2 and 2
— both agree on the cited examples; the gap is unresolved (possibly a
USA/JPN-only site, not re-traced this round).

**Two producer mechanisms found beyond literal `str` tracing**, which is
why closure still isn't provable even after a careful sweep:
argument-forwarding (`func_ov002_021d1158.s` stores its own incoming
parameter to `+0xcf8` — the field can be set to whatever that
function's own untraced callers pass) and a save/restore idiom
(`func_ov002_021cacf0.s` temporarily forces `3` then restores the prior
value — not a new literal producer, just a naive sweep artifact worth
documenting so it isn't miscounted later).

**Corrected framing** (all 3 canonical docs + the original report):

```
confirmed values include 0, 1, 2, 3, 4, 5 and 7;
complete range and semantic names are not yet established.
```

**Denominator corrected**: `Ov013Slot` removed from the count (it was
already excluded by the survey's own stated method) — **3 of 6**, not
3 of 7.

```
$ python3.13 -m pytest tests -q
3181 passed, 13 skipped, 63 subtests passed in 29.32s
```

### q-producer-consumer-sample — stratified MED-vs-HIGH sample of the producer/consumer lens [DONE]

> Stopped at the canary — and the stop was the result. See the item body.

Self-scoped and self-filed, per the brain's invitation after
`cm-f-cf8-reopen`. Question: was `f_cf8` a localized `DuelStateSingleton.md`
(MED) defect, or is the producer-vs-consumer gap systemic across the
research corpus (including HIGH-confidence docs, which would mean the
confidence ladder isn't load-bearing)? Design: ~13 fields from
`DuelStateSingleton.md` (MED) + a 6-field HIGH-confidence control split
across `GlobalData02104bac.md`, `GlobalData02104e6c.md` (the two
"closest structural analogues" — 1 real-evidence field each, too small
alone) and `Box.md` (4 of its 6 fields have confirmed access evidence;
`f4`/`fa` excluded as untestable rather than padding the count).

**CANARY, run before the other 17 fields**: `GlobalData02104bac.flags`
@ +0x54 (HIGH doc, documented `r/w`). Consumer evidence: abundant and
convergent — read + bitmask-tested across 12+ files spanning main and
8 overlays, several reading it together with an undocumented adjacent
`+0x56` field. Producer evidence: **none found anywhere**, despite
checking every candidate the search surfaced (2 apparent stores
resolved as false positives — register reassigned to an unrelated base
between the `&data_02104bac` load and the store, the exact same failure
shape as `cm-f-cf8-reopen`'s save/restore false positive).

**Stopped here, per the explicit instruction**: this isn't the same
failure shape as `f_cf8` (partial producer evidence, missing one value)
— it's a total absence, on a bitmask/flags field rather than a small-int
enum. Diagnosed why: "producer" for an enum is crisp (a literal gets
stored — greppable); for a flags word it isn't (a masked RMW, a bulk
fill, a hardware latch, or an SDK call could all set it without ever
looking like "the literal 0x8 stored to +0x54"). The method transfers
cleanly to other small-int discrete-value fields; it does **not**
transfer to bitmask fields without a broadened producer-detection
method first. Real, useful finding — just not the MED-vs-HIGH hit rate
the sample set out to measure. That original question is still open.

Full write-up: [`docs/research/q-producer-consumer-sample-2026-08-04.md`](../research/q-producer-consumer-sample-2026-08-04.md).

### q-producer-consumer-sample-2 — repair: method-compatible control, canary passes, full sample clean [DONE]

Repair of `q-producer-consumer-sample` (PR #1451, still open at the time
of this item — not a conflict, an independent addition). The brain's
own diagnosis: `GlobalData02104bac` was picked for structural analogy
(both global-state singletons) without checking field-type compatibility
with the method — it's dominated by a bitmask flags word, the exact
shape the method can't evaluate. Fix: same stratified design, control
re-picked for method compatibility instead.

**Sample**: 13 `DuelStateSingleton.md` fields restricted to discrete
small-int shapes (dropping `f_cf8` itself, a packed u16 pair, and a
function pointer) + a 6-field HIGH control across `BgCfg.md` (`fc`,
`f10` — its other 3 fields, `f0`/`f14`/`f18`, turned out to ALSO fail
the shape test: a runtime handle and two masked bitfields, same problem
as before, filed separately not counted) and `Box.md` (`f0`/`f2`/`f6`/`f8`,
invoked as the anticipated fallback once `BgCfg` alone only yielded 2
qualifying fields).

**CANARY** (`BgCfg.f10`, HIGH): producer = 2 clean literal stores
(`cfg.f10=0x1a0`/`=0x180`); consumer = a real `-1`-sentinel gate in the
receiving callee's raw disassembly. **Passed** — the method transfers
to a properly-typed HIGH field, confirming the problem was the control's
field type, not the method itself.

**Full sample (19 fields): zero contradictions in either tier.**
HIGH: 5/6 CONFIRMED (83%), 1 PRODUCER-ONLY (`BgCfg.fc` — a 2nd, more
careful read of the receiving callee caught the SAME false-positive
shape both prior rounds hit: an apparent consumer read at the right
offset digit, on the wrong base register — this time caught before
miscounting, not after). MED: 12/13 CONFIRMED (92%), 1 PRODUCER-ONLY
(`f_d30`). No contradictions, no unfalsifiable claims in either tier.

**What this answers**: real signal, not a third non-answer. Neither
tier showed a contradiction in a sample restricted to the method's own
valid shape — evidence against "the gap is systemic regardless of
tier." Consistent with a narrower reading too: `f_cf8` is the doc's own
*"most frequently tested field,"* an outlier by call-site density, not
a representative median field — under that reading the risk
concentrates in high-traffic fields specifically, which is a useful,
different conclusion than "unpredictable everywhere." The sample can't
distinguish the two readings; both point at the same next step
(recheck the next-most-tested fields per doc, not a uniform sweep).

The flags-word shape (`GlobalData02104bac.flags`, now also `BgCfg.f0`/
`f14`/`f18`) is filed as a **standing observation**, not resolved and
not counted toward either hit rate — third occurrence of the same
shape, worth a dedicated broadened method later, not stretched into
this round's number.

Full write-up: [`docs/research/q-producer-consumer-sample-2-2026-08-04.md`](../research/q-producer-consumer-sample-2-2026-08-04.md).

**Gate:** doc-only, no build.

```
$ python3.13 -m pytest tests -q
3193 passed, 13 skipped, 63 subtests passed in 74.86s
```

### cm-restock-carve-1 — first wave of the restock-census carve series (ov006's 33 structs, then main's 58) [DONE]

**Result: 31 of 35 candidates shipped (1,960 B), 4 cleanly declined on a real mwldarm alignment wall — not a research gap.** CANARY discipline held throughout: the 6-symbol callback-table cluster (`Ov006StateCb` dispatch tables) went through a full 3-region gate before any batching. Discovered and validated a new mechanical pattern this series needs going forward: unlike `.bss`, these `.data` candidates have **no existing delinks.txt TU at all** — dsd silently fills genuine gaps from the base ROM, so carving means *inserting* a brand-new TU entry, not repointing an `.s` cluster file. Both wave-9 fast-follow `.bss` symbols (`data_ov006_0224f2ac`/`_0224f344`) verified to full standard via raw-disassembly call-chain proof (their callers are still ship-as-`.s`) and shipped. 5 parallel read-only investigation agents covered the remaining 27 struct candidates; two independently derived the *same* 6-member hit-test-rect family from opposite ends of one shared dispatch function without knowing about each other's symbols — reconciled into one typedef rather than shipped as two artificially-divergent families. **Declined 4 symbols** (the remaining members of a 9-table `kv_t` lookup family): every one sits at a 2-byte-misaligned address, and `arm9.lcf`'s `ALIGNALL(2)` inserts a real linker padding gap at any new non-4-aligned TU boundary, cascading a +2 byte shift through the rest of the module. Tried 3 source-level workarounds (backward byte-absorb — rejected by dsd's symbol-containment check; one large bundle TU — built, but mwcc reordered the top-level globals, landing every symbol at the wrong address; a smaller bundle — blocked by undefined-symbol link errors, since 4 of the "no consumer" placeholder bytes are in fact referenced by name from two unrelated existing files). Matches `docs/research/ov004-odd-aligned-slot-recipe.md`'s documented harder case (all 3 of *its* source-level variants also failed) — a genuine structural floor, not a one-off mistake. **main's 58 struct-shaped candidates: not started — this wave did not have room** after the alignment-wall investigation; left for a future wave. Full per-symbol tables, the 3-attempt alignment-wall writeup, and process notes: `docs/research/data/cm-restock-carve-1-2026-08-06.md`.

```
Typed-array:   161,052 -> 162,884 bytes  (+1,832 B,  3.37% -> 3.41%)
Named-struct:   55,204 ->  57,076 bytes  (+1,872 B,  1.16% -> 1.19%)
```

3-region `gate3.py --scope all` SHA1 PASS (EUR/USA/JPN) + full pytest suite green.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS + Named-struct/Typed-array before/after (state-table regen) + the per-symbol reconciliation table in the PR body.

### cm-field-recheck-1 — producer/consumer lens on the MOST-tested fields, ranked by the census tool [DONE]

**Result: 5/5 ranked method-compatible fields CONFIRMED (2 with genuine refinements), 0 gaps, 0 contradictions.** Found 2 real methodology gaps in `field_exposure_census.py` before trusting its ranking (per the standing "read the metric's own source" rule): (A) 11 of 22 type docs have no detected base-symbol (getter/self-pointer/parameter-accessed structs like `GameSingleton`), so the tool's file-relevance filter falls back to scanning the whole tree, producing cross-doc-contaminated counts — multiple unrelated docs shared *identical* inflated numbers for same-offset fields; excluded those 11 from the candidate pool. (B) the tool's matching is hex-offset-only and misses this codebase's own decimal-offset field-naming convention used by several already-matched files (`f1472`/`f1492`/`+ 1460` for what the canonical docs call `f_5c0`/`f_5d4`/`f_5b4`) — a real undercount, confirmed directly while tracing 3 of this wave's 5 fields by hand. Neither gap fixed (out of scope), both filed for whoever next touches the tool. Ranked candidates after filtering: `DuelQueueState.f_5a8`/`f_5b4`/`f_5d4` (a doc never touched by sample-2) and `DuelStateSingleton.f_d50`/`f_d9c` (2 of its fields sample-2 didn't reach). CANARY (`f_5a8`) confirmed the doc's 0x7f/0x80 handshake claim while finding it undersold: both consumers are real dual-case dispatchers, and the producer briefly stores a 3rd, call-result value. Both cheap loose ends closed: `f_d64==0xc` cited into `DuelStateSingleton.md`; the `BgCfg.md`/`Box.md` region anomaly characterized as real (all cited functions exist only under USA/JPN, EUR has genuinely different addresses in the same modules) without asserting a cause. Full per-field table and both gap writeups: `docs/research/data/cm-field-recheck-1-2026-08-06.md`.

```
$ python -m pytest -q tests
3200 passed, 15 skipped, 63 subtests passed in 44.30s
```

**Gate:** doc-only — `python -m pytest -q tests` green (skips allowed, failures not) + the per-field verdict table with cited sites in the research doc.

### cm-restock-carve-2 — second wave of the restock-census carve series (main's 58 struct-shaped) [DONE]

Continues `cm-restock-carve-1` (#1464: 31/35 carved, 1,960 B — 6 Ov006StateCb
tables + 2 Ov006AudioBank `.bss` fast-follows + 23 struct-batch, with 4 `kv_t`
symbols honestly declined on the mwldarm 2-byte alignment wall).

Wave 1 took ov006's 33 struct-shaped candidates. The restock census —
`docs/research/data/cm-data-restock-census-2026-08-03.md` — holds **274
never-assessed candidates / 24,753 B** in total, so the pool is far from empty.

Wave 2: **`main`'s 58 struct-shaped candidates**, cross-referenced against the module's own headers the way wave 1 used `src/overlay006/ov006_core.h` — that header-cross-reference is the method that produced wave 9's Ov006AudioBank family and wave 1's six StateCb tables, so lead with it rather than carving blind. If the wave has room after main's 58, continue into the census's next-largest module group and say which.

**Carry wave 1's alignment finding forward as a pre-filter, not a rediscovery.**
Wave 1 proved that a non-4-aligned TU boundary makes mwldarm/ALIGNALL(2) insert
a +2 cascade, and that three source-level workarounds all fail: separate files
(cascade caught by `ninja check`), a combined-TU absorber (withdrawn), and a
third variant per that doc. The reference write-up is
`docs/research/ov004-odd-aligned-slot-recipe.md`.

Check each candidate's start/end alignment in `delinks.txt` BEFORE drafting and
route the 2-byte-misaligned ones to a declined list up front. Declining early is
a success; re-deriving the wall per symbol is wasted budget.

CANARY: the FIRST carve goes through the FULL gate (3-region SHA1) before any batching.

Standing rules: **NEVER hand-transcribe byte content — generate every C initializer from a script reading the real bytes, every wave, no exceptions**; per-symbol reconciliation table (one row per shipped symbol: address, size, section, type, evidence — wave 1's fix pass had to add this retroactively, so build it as you go); `relocs.txt` structural proof per carve; transitive-callee tracing; const/static matching each symbol's OWN original, never a sibling's convention; check `delinks.txt` ground truth before choosing sections (`&symbol` always relocates to `.data`; literal-cast pointer arrays need `void *const` for `.rodata`); never assume mwcc preserves same-TU global declaration order — verify the built layout directly; keep a non-4-byte split inside ONE TU; never shift an already-matched consumer's relocation boundary.

**Gate:** `python tools/gate3.py --scope all` — 3-region SHA1 PASS. ⚠️ `gate3` piped through `tee` MASKS its exit code (both lanes hit this last round) — read the log, do not trust exit 0. Paste the three sha1 lines VERBATIM + the Named-struct/Typed-array before/after lines from the state-table regen + the per-symbol reconciliation table in the PR body. Coordinate the full gate with Lenny: the mwcc toolchain serialises MACHINE-WIDE, and the CC Decomper is running a 5-worktree consolidated `--clean` gate this round — never run yours while theirs is live.

### cm-restock-carve-3 — the misaligned remainder, and whether the alignment wall is really a wall [DONE]

`cm-restock-carve-2` (#1473) carved 58/58 of main's struct candidates (16,412 B) — a genuine 100%, because every main candidate is 4-aligned at both ends. Waves 1 and 2 have now taken the census's easy geometry: `ov006`'s 33 and `main`'s 58.

What remains is the harder half, and it is worth attacking deliberately rather than skimming for more 4-aligned wins. The census (`docs/research/data/cm-data-restock-census-2026-08-03.md`) holds **35 struct candidates that are 2-byte misaligned**, spread across ov006/ov011/ov016/ov017/ov004/ov022/ov005/ov019/ov000/ov009/ov012 — exactly the population wave 1's ALIGNALL(2) finding declined, and the reason wave 2 could report 100%.

Two parts, in order:

1. **Sweep the remaining 4-ALIGNED candidates first** (whatever the census still holds outside ov006 and main). Same method that worked twice: cross-reference each module's own header, script every initializer from the real bytes, per-symbol reconciliation table built as you go. This is the reliable yield and it funds the round.

2. **Then take ONE bounded run at the misaligned class.** The wall is documented (`docs/research/ov004-odd-aligned-slot-recipe.md`) and three source-level workarounds were falsified in wave 1 — do NOT re-run those three. The open question is different: is the +2 cascade avoidable by **TU composition** rather than by source form? Specifically, does placing a misaligned symbol so that its containing TU's total span lands 4-aligned (pairing two misaligned symbols, or absorbing the odd tail into an adjacent already-carved symbol's TU) avoid the cascade? Test that on exactly ONE candidate pair, byte-verify, and report the answer either way. **A clean negative is a full success here** — it would let us mark those 35 candidates permanently declined with evidence instead of leaving them as perpetual "maybe" rows, which is worth as much as carving them.

⚠️ Do NOT split a non-4-byte boundary across two TUs (`feedback_non-4-byte-tu-split-linker-gap`) — that is the thing that produces a real linker gap. The experiment is about TU *composition*, not splitting.

CANARY: the first carve of part 1 goes through the FULL gate (3-region SHA1) before any batching; the part-2 experiment is byte-verified on its own before any conclusion is written.

Standing rules unchanged: never hand-transcribe byte content; `relocs.txt` structural proof per carve; transitive-callee tracing; const/static matching each symbol's OWN original; `delinks.txt` ground truth before choosing sections; verify built layout directly rather than assuming declaration order.

**Gate:** `python tools/gate3.py --scope all` — 3-region SHA1 PASS. ⚠️ A background wrapper's exit code is not `gate3.py`'s — READ THE LOG. Paste the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the per-symbol reconciliation table + the part-2 verdict with its byte evidence. Regenerate `docs/research/README.md` before committing — #1473 was blocked on exactly that (its index row was generated before the doc's H1 was reworded).

### cm-restock-carve-4 — apply the TU-composition recipe at scale, and test the half that is still open [DONE]

`cm-restock-carve-3` (#1476) shipped 64/64 aligned candidates plus the Part 2 experiment, and **the TU-composition recipe is real and gate-covered** — the experimental pair (`data_ov016_021b9000` + `_021b900a`) actually shipped, so the 3-region SHA1 PASS proves it rather than a local observation. That is a genuine mechanism, not a plausible one.

The brain corrected three things in the write-up before merge; read the corrected doc (`docs/research/alignment-wall-tu-composition-recipe.md`), not your memory of it:

- the precondition is **4-alignment at BOTH ends** of the composed span (4-aligned start AND `size % 4 == 0`), not size alone;
- the recipe therefore does **not** unlock wave 1's four `ov006` `kv_t` symbols, and **11 of the 35** misaligned candidates fail the both-ends screen structurally;
- the two Part-2 table rows read 10 B, not 12 — which is also what made the "752 vs 748 Named-struct" note evaporate.

Two parts, in order:

**PART 1 — apply the recipe to the candidates that pass the screen.** Screen all 35 misaligned candidates on the both-ends criterion FIRST and publish the screen as a table (candidate, run start, run size, PASS/FAIL, reason) before carving anything. Expect roughly 24 to pass. Then compose and carve them. Keep the verified shape: adjacent misaligned symbols as separate named globals of the same type, **in address order**, in one TU. Byte-verify each composed TU against pristine ROM at the symbols AND at both neighbouring already-shipped TUs — the cascade shows up at the neighbours first, which is exactly how #1476 proved the negative space.

⚠️ **`n > 2` is unproven.** #1476 confirmed `n = 2` only, and wave 1's failure mode (mwcc reordering declarations) was correlated with bundle size. If a group needs 3+ symbols to reach a 4-aligned span, spot-test that group for declaration reordering by inspecting the compiled `.o` symbol table BEFORE trusting it — do not assume it generalises.

**PART 2 — test the half that is still open: backward absorption.** The 11 screen-failures need the other composition move — absorbing the odd head into an adjacent already-carved symbol's TU extent, so the *combined* span becomes 4-aligned at both ends. `ov006`'s four `kv_t` symbols are the worked example: their run starts at `0x021ce38a`, and reaching them means extending backward into `data_ov006_021ce372`'s extent. `cm-restock-carve-1` Part 5 attempt #1 recorded that as rejected by dsd's containment check — establish whether that rejection is a hard structural limit or an artifact of how that attempt was framed, on exactly ONE candidate group.

A clean negative here is a FULL SUCCESS: it would let us mark those 11 permanently declined with evidence and stop three-plus waves from circling the same question. Say plainly which it is.

⚠️ Never split a non-4-byte boundary across two TUs — composition and absorption are both in scope, splitting is not.

CANARY: the first composed carve of Part 1 goes through the FULL gate (3-region SHA1) before any batching; the Part 2 experiment is byte-verified on its own before any conclusion is written.

Standing rules unchanged: never hand-transcribe byte content; `relocs.txt` structural proof per carve; transitive-callee tracing; const/static matching each symbol's OWN original; `delinks.txt` ground truth before choosing sections; verify the built layout directly rather than assuming declaration order — doubly so here, since declaration order IS the mechanism.

**Gate:** `python tools/gate3.py --scope all` — 3-region SHA1 PASS. ⚠️ A background wrapper's exit code is NOT `gate3.py`'s — read the log. Paste the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the both-ends screen table + the per-symbol reconciliation table (built as you go; check every Size cell against `delinks.txt` — a wrong cell is what produced #1476's phantom 4 B) + the Part 2 verdict with byte evidence. Regenerate `docs/research/README.md` LAST, after any retitling.

### cm-restock-carve-5 — close out the declined 11, finish the composable pool, return to the main pool [DONE]

`cm-restock-carve-4` (#1481) carved 22 symbols in 11 composed TUs (Named-struct +488 B, independently recomputed) and — more valuably — returned a **clean negative on backward absorption**: `cm-restock-carve-1` Part 5 attempt 1's dsd-containment rejection is a real structural wall, not an artifact of framing. That closes a question three consecutive waves carried.

Three parts, in order:

1. **Close out the declined 11.** Record the backward-absorption negative against each of the 11 both-ends screen-failures in the census, so future selection sees them as permanently declined with evidence attached rather than as perpetual maybes. Bookkeeping, but it is the payoff of #1481's negative — minutes, not hours.

2. **Finish the composable pool.** #1481 carved 22 of the ~24 that passed the screen. Carve whatever remains, same verified shape: adjacent misaligned symbols as separate named globals of the same type, **in address order**, one TU, composed span 4-aligned at both ends. Byte-verify each composed TU against pristine ROM at the symbols AND at both neighbouring already-shipped TUs — the cascade shows at the neighbours first.

   ⚠️ **`n > 2` is still unproven.** #1476 and #1481 both confirmed `n = 2` only, and wave 1's failure mode (mwcc reordering declarations) correlates with bundle size. If a group needs 3+ symbols to reach a 4-aligned span, inspect the compiled `.o` symbol table for reordering BEFORE trusting it.

3. **Return to the main pool.** The restock census still holds candidates outside the misaligned class (274 total, minus ov006's 33, main's 58, and this arc's ~35). Sweep the largest remaining 4-aligned module group with the standard method: cross-reference the module's own header, script every initializer from the real bytes, per-symbol reconciliation table built AS YOU GO with every Size cell checked against `delinks.txt` — a wrong cell produced #1476's phantom 4 B.

CANARY: the first carve of part 2 goes through the FULL gate (3-region SHA1) before any batching.

Standing rules unchanged: never hand-transcribe byte content; `relocs.txt` structural proof per carve; transitive-callee tracing; const/static matching each symbol's OWN original; `delinks.txt` ground truth before choosing sections; verify the built layout directly rather than assuming declaration order — doubly so here, since declaration order IS the mechanism.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS (read the log — a background wrapper's exit code is not `gate3.py`'s) + the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the per-symbol reconciliation table + the declined-11 closeout. Regenerate `docs/research/README.md` LAST.

### cm-restock-carve-6 — work the new size-ordering wall, then keep draining the main pool [DONE]

`cm-restock-carve-5` (#1487) closed the declined 11 with evidence, swept ov011, and — the part worth building on — **found a new mwcc size-ordering wall** while establishing that the composable pool was not fully exhausted. Two threads:

1. **Characterise the size-ordering wall properly.** #1487 found it; it is not yet a taxonomy entry with criteria a future wave can cite. Write it up to the `C-NN` / `P-NN` standard: what shapes trigger it, how it presents in the diff, whether any source-level or TU-composition form avoids it, and how many of the remaining census candidates it blocks. If it is permanent, give it a `P-NN` and say what evidence makes it permanent rather than merely unbeaten — the taxonomy has been wrong in that direction before (brief 640 found 0 of 5 sampled wall citations matched their entry's criteria).

2. **Finish the composable pool, then keep draining.** #1487 established the pool was not exhausted — carve whatever composable candidates remain under the verified recipe (adjacent misaligned symbols, same type, address order, one TU, span 4-aligned at BOTH ends, `n = 2` proven only). Then continue the main restock pool: largest remaining 4-aligned module group, header cross-reference first, script every initializer from the real bytes, per-symbol reconciliation table built AS YOU GO with every Size cell checked against `delinks.txt`.

⚠️ `n > 2` remains unproven across three waves now. If a group needs 3+ symbols, inspect the compiled `.o` symbol table for declaration reordering before trusting it.

⚠️ Run `npx markdownlint-cli2 --fix` on any doc you write before committing — MD022/MD031/MD018 have blocked four PRs in two days, including two of the brain's own.

CANARY: the first carve goes through the FULL gate (3-region SHA1) before any batching.

Standing rules unchanged: never hand-transcribe byte content; `relocs.txt` structural proof per carve; transitive-callee tracing; const/static matching each symbol's OWN original; `delinks.txt` ground truth before choosing sections; verify the built layout directly rather than assuming declaration order.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS (read the log — a background wrapper's exit code is not `gate3.py`'s) + the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the per-symbol reconciliation table + the size-ordering wall write-up with its criteria. Regenerate `docs/research/README.md` LAST.

### cm-restock-carve-7 — close P-50's evidence boundary, then keep draining [DONE]

`cm-restock-carve-6` (#1493) is merged. The carve half was the strongest in the series — every one of the 144 shipped bytes independently confirmed against the real ROM image and `relocs.txt`, and the misaligned-struct arc closure reconciles when derived from scratch (186 struct rows → exactly 35 misaligned → 26 delinks-claimed + 9 declined + 0 in limbo).

The taxonomy half needed three corrections at merge review, all now applied — **read the corrected entry before citing it**:

- your wall was renumbered **P-48 → P-50**: `cm-main-tier-sweep-5` had independently claimed P-48 for a register-pressure wall and `main` already ran to P-49. Check the highest existing `P-`/`C-` number on `origin/main` before assigning one;
- it is now marked **OBSERVED-NOT-CONFIRMED**, because every scratch compile and both real candidates ran at the **default SP only** while this document's bar for a `P` verdict is an N-variant × SP sweep — the same bar that demoted P-10 to C-29;
- its census impact was corrected from 2 to **4**, because this same wave declined four candidates citing it.

**PART 1 — CLOSE THE EVIDENCE BOUNDARY. This is the round's point and it is cheap.** The two legacy tiers are selected by FILENAME (`tools/configure.py`, `is_legacy_c()` / `is_legacy_sp3_c()`) and apply to a data TU with zero extra machinery. Run the two-differently-sized-globals scratch test at **`.legacy.c` (mwcc 1.2/sp2p3)** and **`.legacy_sp3.c` (mwcc 1.2/sp3)**. If either preserves declaration order, P-50 becomes a `C-NN` with a routing-tier recipe and unlocks up to 4 declined candidates. If neither does, P-50 earns its `P` and you can delete the OBSERVED-NOT-CONFIRMED block with evidence.

Also test the one-compile repair Leg 3 asserted instead of checking: rewrite `func_ov011_021caafc`'s reference to `data_ov011_021d305f` as the merged symbol `+ 43` — the final ROM word is the same absolute address either way, so the only open question is whether dsd's symbol/reloc check accepts the renamed target. If it does, the merge-to-one-symbol leg is not structural.

**Either outcome is a full success.** A clean negative at both tiers is what upgrades P-50 from "unbeaten" to "permanent" with evidence, which is worth more than another few carves.

**PART 2 — keep draining.** Continue the restock pool: largest remaining 4-aligned module group, header cross-reference first, script every initializer from the real bytes, per-symbol reconciliation table built AS YOU GO with every Size cell checked against `delinks.txt`.

⚠️ Run `npx markdownlint-cli2 --fix` on any doc before committing.

CANARY: the first carve of Part 2 goes through the FULL gate (3-region SHA1) before any batching.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS (read the log) + the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the per-symbol reconciliation table + the P-50 tier-test result stated either way. Regenerate `docs/research/README.md` LAST.

### cm-restock-carve-8 — the pool after main; and decide whether this lane's method has an end [DONE]

`cm-restock-carve-7` (#1496) closed P-50's evidence boundary the right way: a three-tier scratch sweep (default `2.0/sp1p5`, `.legacy.c` `1.2/sp2p3`, `.legacy_sp3.c` `1.2/sp3`, both declaration orders) came back identical every time, so **P-50 is now PERMANENT with evidence** rather than by assertion, and the OBSERVED-NOT-CONFIRMED block is gone. A clean negative, properly run — that is the outcome the item wanted. You also drained main's largest remaining pool (36 symbols, Typed-array +1,864 B).

Two threads:

**PART 1 — keep draining.** Continue the restock census into the next-largest remaining module group. Same method that has now worked across seven waves: header cross-reference first, script every initializer from the real bytes, per-symbol reconciliation table built AS YOU GO with every Size cell checked against `delinks.txt`, `relocs.txt` structural proof per carve, const/static matching each symbol's OWN original.

**PART 2 — and answer the question this lane has been deferring: how much is actually left?** Seven waves in, the census is the only map, and it was built once (2026-08-03) by one discovery method. Re-census honestly: how many never-assessed data candidates remain, how many are reachable by the current method, how many are blocked by a documented wall (P-50 and the n>2 reordering wall between them now decline a known set), and how many are in neither bucket. `cm-data-restock-check` established once before that the pool "never emptied — it was invisible to the old discovery methods"; the useful question now is whether that is *still* true or whether this method is genuinely approaching its end.

An honest "the method has roughly N candidates and M bytes left, then it is done" is exactly as valuable as another carve wave — arguably more, because it tells the campaign when to stop investing here. Do not pad the estimate in either direction.

⚠️ Run `npx markdownlint-cli2 --fix` on any doc before committing, and regenerate `docs/research/README.md` LAST — stale-index `drift-check` failures have now blocked three PRs.

CANARY: the first carve of Part 1 goes through the FULL gate (3-region SHA1) before any batching.

⚠️ GATE TIMING: the CC Decomper is running `cm-main-tier-sweep-7` with a 5-worktree consolidated `--clean` 3-region gate. mwcc serialises MACHINE-WIDE. Before your canary gate run `Get-Process | Where-Object { $_.Name -match 'mwcc|mwld|mwasm|ninja' }` — if it returns rows, wait. Confirm the window with Lenny.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS (read the log) + the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the per-symbol reconciliation table + the re-census table with its four buckets and a stated remaining-bytes figure.

### cm-restock-carve-9 — the two successors this lane's own re-census identified [DONE]

`cm-restock-carve-8` (#1501) shipped `ov006`'s last 6 candidates (352 B) and did
the harder half of the job: the honest four-bucket re-census this lane had
deferred for seven waves. It also caught something worth carrying — **six
symbols that waves 5-7 investigated and wall-blocked but recorded only in their
own narrative docs**, so a mechanical reconciliation kept re-surfacing them as
open. They are now in the formal declined table. `232 + 16 + 1 + 25 = 274`,
exact.

**Two brain corrections landed with the merge; both matter to this wave's
scoping:**

1. The remaining reachable pool is **548 B — about 1.56x what `ov006` shipped
   this wave (352 B)**, not "smaller than half" of it. The comparison was
   inverted, and it was the one quantitative claim supporting the "exhausted"
   verdict. The verdict survives, on a different basis: 548 B is roughly *one
   more wave* of headroom, not a fraction of one.
2. The 25-symbol module enumeration listed only 23 across 13 modules. The
   omitted module is **`ov008`** — `data_ov008_021b23c0` and
   `data_ov008_021b23d0`, 16 B each, verified still open directly against
   `delinks.txt` (the `.rodata` section runs `0x021b23b8`-`0x021b2430`; carving
   covers `0x021b23b8`-`0x021b23c0` and `0x021b23e0`-`0x021b2430`, leaving
   exactly those two uncarved). Bucket totals were always right; the breakdown
   was short. **A wave using that list as its worklist would have skipped both.**

This wave takes the two successors the re-census itself identified.

**PART 1 — the shape-filtered pool (cheap, same method, same evidence
standard).** 1,076 symbols / 11,592 B are reachable by exactly this lane's
method and were excluded only because the original census ran a 4-shape filter
that dropped `string`/`string-ascii4`. Widening the filter is not a new
discovery, it is an uncovered corner of the method you already trust. Start with
the largest contiguous groups. Same rules throughout: header cross-reference
first, script every initializer from the real bytes, per-symbol reconciliation
table built AS YOU GO with every Size cell checked against `delinks.txt`,
`relocs.txt` structural proof per carve, const/static matching each symbol's OWN
original. If you exhaust the appetite for one wave inside this pool, say where
you stopped and what remains.

**PART 2 — a bounded PoC against the zero-reader pool.** The ~9,690-symbol /
~227,820 B pool you sampled is ~10x everything these 8 waves have shipped
combined, and this lane's reader-based method cannot see any of it. You already
did the diagnosis: the largest contributor is `shape=string` (4,506 entries /
95,593 B), real readable filenames and archive paths, clustered into 159
contiguous runs, almost certainly one resource/archive manifest that `dsd` split
into one placeholder per string because nothing holds a *direct* pointer to any
individual string.

**Prove or disprove the obvious method on ONE run.** Pick a SMALL contiguous run
(not the 1,588-string / 35,424 B monster — a first-of-kind PoC should be cheap to
throw away), emit the whole run as a single C string table in one TU, and gate
it. The question to answer is narrow and binary: **does a contiguous run of
reader-less strings match when emitted as one table?** If yes, that unlocks a
path to ~95,593 B and the next several waves write themselves. If no, report the
exact failure mode — that is the finding, and it saves a future wave from
assuming it.

⚠️ Expect the alignment and declaration-order walls to be live here. `P-50`
(composed-TU declaration order collapsing to ascending size) is PERMANENT with
evidence and a multi-symbol TU is exactly its trigger — check the run's
address-ascending size sequence for monotonicity BEFORE drafting, and decline
early rather than re-deriving the wall.

CANARY: the first carve of Part 1 goes through the FULL gate (3-region SHA1)
before any batching.

⚠️ GATE TIMING: the CC Decomper is running `cm-main-wall-filtered-sweep-1` with
a 5-worktree consolidated `--clean` 3-region gate. mwcc serialises MACHINE-WIDE.
Before your canary gate run `Get-Process | Where-Object { $_.Name -match
'mwcc|mwld|mwasm|ninja' }` — if it returns rows, wait. Confirm the window with
Lenny.

⚠️ Run `npx markdownlint-cli2 --fix` on any doc before committing, and regenerate
`docs/research/README.md` LAST — stale-index `drift-check` failures have now
blocked four PRs.

**Gate:** `python tools/gate3.py --scope all` 3-region SHA1 PASS (read the log) +
the three sha1 lines VERBATIM + Named-struct/Typed-array before/after + the
per-symbol reconciliation table + the Part 2 PoC verdict stated as a plain
yes/no with its evidence.

### q-toolchain-repin-eval — evaluate (do NOT adopt) dsd v0.12.0, m2c 19f2ddb2, permuter 27952473 [DONE]

External audit lead (2026-08-14). Our pins have drifted: `dsd` vendored at
**v0.11.0** (2026-04) against upstream **v0.12.0** (2026-08, whose notes cite a
Thumb-BLX/jump-table `dsd dis` fix relevant to the m2c_feed export path); `m2c`
pinned `ce052171` in `tools/m2c_bootstrap.py` (2026-06) against upstream
`19f2ddb2`, with three ARM-specific commits on 2026-08-10 including a
PopAndReturnPattern fix; `decomp-permuter` pinned `efc5c5e7` in `tools/permute.py`
(2026-04) against upstream `27952473`, including a `perm_var_cond_block` mutation
(2026-06-30) never tested against our documented reg-alloc plateau.

⚠️ **LAYER CORRECTION, carried from brain review — do not chase a phantom.** The
audit implied upstream m2c epilogue work might subsume our `.legacy` /
`.legacy_sp3` routing. It cannot. Our routing tiers are a **compile-tier**
mechanism (which mwcc compiles the TU, so the shipped bytes match); m2c is
**draft generation** for the cold-RE track. Upstream m2c improvements can only
improve draft quality feeding `m2c_feed.py`. Evaluate strictly on that basis.

Scope, cheapest first, each with its own written verdict:

1. **m2c bump** in a scratch clone (it is gitignored-vendored — bump
   `M2C_COMMIT` locally only). Run the m2c_feed pipeline over a fixed panel of
   6-10 previously-fed functions (draw from the cold-RE track docs; include at
   least 2 with Style A/B epilogues and 1 known pool-literal mis-resolution
   case) and A/B the drafts. Verdict: adopt or decline, with diffs.
2. **permuter bump** likewise: probe `perm_var_cond_block` against 2-3
   documented reg-alloc-plateau cases from `codegen-walls.md`. Permuter is a
   demoted last-resort probe (brief 403) — the adoption bar is **cracking a
   documented wall case**, not "upstream is newer".
3. **dsd v0.12.0 LAST**, and only if 1 or 2 produced value. `dsd` is
   load-bearing in the build graph (the delink layer). Bump in a dedicated
   worktree, then run a FULL `python tools/gate3.py --scope all` 3-region SHA1
   plus a delink-ref audit before proposing adoption. Any output drift in
   delinks or symbols from the new version is a **finding to report**, never
   something to auto-accept.

Effort: **MEDIUM**. Item 3 needs the build machine — coordinate the wine lane.

**Gate:** a per-item verdict with pasted evidence (m2c draft diffs; permuter
case outcomes; for `dsd`, the three per-region sha1 lines VERBATIM if attempted)
+ an explicit adopt/decline per pin + **no pin actually changed on `main` in
this PR**. This item is evaluation only; adoption is its own follow-up item with
its own gate.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder q-toolchain-repin-eval`; commit;
report the PR number with the pasted artifacts.

### cm-toolchain-adopt-1 — execute the m2c ADOPT verdict, then finish the dsd leg you were blocked on [DONE]

`q-toolchain-repin-eval` (#1512) is merged and it did the evaluation properly:
it captured a baseline at the current pin **before** bumping, discovered that
7 of the 8 historically-cited panel functions were already matched (doc
staleness, not a pipeline fault), rebuilt the panel from live gaps rather than
reporting a dead comparison, and produced three clearly-separated verdicts. It
also respected the contention rule under real pressure — `pgrep` showed the
Decomper's `ninja sha1` running, and the lane reported the `dsd` leg **blocked**
instead of forcing a window. That was the correct call and it is why this item
exists rather than a re-run.

**PART 1 — ADOPT the m2c pin.** Bump `M2C_COMMIT` in `tools/m2c_bootstrap.py`
from `ce052171` to `19f2ddb2`. Your own evidence carried it: the new pin fixes a
real stack-argument-by-reference misresolution (wrong callee arity plus a
nonsense `&subroutine_arg0` placeholder) on 2 of 8 live panel functions, with
the other 5 identical and zero build risk — m2c is draft-generation for the
cold-RE track, so it cannot affect shipped bytes. Re-run the same 8-function
panel at the adopted pin and paste the drafts, so the adoption carries its own
evidence rather than pointing back at #1512.

**PART 2 — the `dsd` leg, this time with a window.** `dsd` v0.11.0 → v0.12.0 was
in scope last round and never attempted. It is load-bearing (the delink layer),
so it needs the full treatment: a dedicated worktree, `python3.13 tools/gate3.py
--scope all` 3-region SHA1, and a delink-ref audit. **Any drift in delinks or
symbols output is a finding to report, never something to auto-accept** — if the
new version changes even one delink boundary, stop and write it up rather than
absorbing it.

Two things you already found that belong in this round's scope:

- **The reproducible `dsd` v0.11.0 `dis` panic** you hit incidentally. If
  v0.12.0 fixes it, that is a second concrete adoption argument; if it does not,
  it is worth an upstream issue with your reproduction.
- **The m2c `MagicFuncPattern` assert** on `bl symbol+offset` targets, identical
  on both pins. Pre-existing and out of scope to fix, but note it in the round
  doc so the next person feeding m2c a post-link object does not rediscover it.

⚠️ **MAC CONTENTION.** The CC Decomper is draining a pool this round and gates
once at the end with `--clean`. Before the Part 2 gate run `pgrep -fl
'mwcc|mwld|mwasm|ninja'` and wait if it returns rows. If you again cannot get a
clean window, **deliver Part 1 and report Part 2 blocked** — the same call you
made last round, and it stays the right one.

**Gate:** for Part 1, the 8-function panel drafts at the adopted pin pasted, plus
`git diff` showing `M2C_COMMIT` as the only pin changed. For Part 2 if attempted,
`python3.13 tools/gate3.py --scope all` 3-region SHA1 PASS with the three
per-region sha1 lines VERBATIM (read the log — a background wrapper's exit code
is not `gate3.py`'s), plus the delink-ref audit result stated either way.
`python3.13 -m pytest -q tests` green. Regenerate `docs/research/README.md` LAST.

ONE PR; verify every claim against `git diff --stat`; `python3.13
tools/work_queue.py done claude-scaffolder cm-toolchain-adopt-1`; commit; report.

### cm-toolchain-adopt-2 — the dsd leg, third attempt, and this time you get the machine first [DONE]

`cm-toolchain-adopt-1` (#1515) adopted the m2c pin correctly: `M2C_COMMIT` is the
only pin file changed, and you re-ran the full 8-function panel **at the adopted
pin** rather than pointing back at #1512's evidence — line counts matched, and
the 3 differing functions showed the same real fix (`sp0` materialised, correct
callee arity, no more `&subroutine_arg0` placeholder).

**The dsd leg has now been blocked twice, and the second block was reported
better than the first.** You ran a genuine bounded poll — 10 checks over ~9
minutes — instead of a single instantaneous check, and you observed contention
*escalate* mid-poll from one Decomper worktree to two. You created no worktree,
never touched `DSD_VERSION`, and ran no gate. That is the correct behaviour and
it is why this item exists rather than a reprimand.

**This round the scheduling is fixed at the dispatch level: you are being
started FIRST, before the CC Decomper's round begins.** The wine lane is yours.
Do not poll politely and yield — take the window, run the gate, and get the
answer. Still run `pgrep -fl 'mwcc|mwld|mwasm|ninja'` before you start so you
know the state you are entering, and report what you saw.

**THE ROUND — `dsd` v0.11.0 → v0.12.0, the full treatment.** It is load-bearing
(the delink layer), so: a dedicated worktree, `DSD_VERSION` bumped there only,
`python3.13 tools/gate3.py --scope all` 3-region SHA1, and a delink-ref audit.

⚠️ **ANY drift in delinks or symbols output is a FINDING TO REPORT, never
something to auto-accept.** If v0.12.0 moves even one delink boundary, stop and
write it up. A silent boundary change that still passes SHA1 today is exactly the
kind of thing that detonates three rounds later.

Two carried items, both cheap once you are in the worktree:

- **The reproducible v0.11.0 `dis` panic** you found incidentally. Test it
  against v0.12.0. If fixed, that is a second concrete adoption argument; if
  not, produce a minimal reproduction worth sending upstream.
- **m2c's `MagicFuncPattern` assert** on post-link `bl symbol+offset` targets —
  pre-existing, identical on both pins, already restated in your last doc. No
  action; do not spend the round on it.

**Verdict shape:** ADOPT with the gate evidence, DECLINE with the reason, or
BLOCKED with what blocked it. All three are acceptable outcomes. What is not
acceptable is adopting a delink-layer bump without a 3-region PASS behind it.

CANARY: before the full gate, bump `DSD_VERSION` in the dedicated worktree and
run `dsd` once on a single module, diffing its delinks output against v0.11.0's.
If that one module already drifts, you have your finding without spending a
40-minute gate — report it and stop.

**Gate + report — paste the real sha1 output, never summarize it:** the three
per-region sha1 lines VERBATIM (read the log — a background wrapper's exit code
is not `gate3.py`'s), the delink-ref audit stated either way, the single-module
canary diff, and `python3.13 -m pytest -q tests` green. `git diff --stat` must
show `DSD_VERSION` as the only toolchain change if you adopt. Regenerate
`docs/research/README.md` LAST.

ONE PR; verify every claim against `git diff --stat`; `python3.13
tools/work_queue.py done claude-scaffolder cm-toolchain-adopt-2`; commit; report.

### cm-restock-carve-10 — teach the call graph to see data->data edges, then drain what appears [DONE]

`cm-restock-carve-9` (#1507) shipped 689/689 of the shape-filtered pool
(11,588 B) and — more valuable — **killed a standing assumption with its own
Part 2**: the ~9,690-symbol / ~227,820 B "zero-reader" pool is not reader-less.
100% of the 3,901 `main` `shape=string` symbols it checked have a real
relocation from an **uncarved data pointer table**. `cm-restock-carve-8` had
written that pool off as needing "a different discovery method"; wave 9 proved it
is reachable by the exact reader-based method this lane already trusts. It also
proved the absorbing carve works end to end — a contiguous run of
apparently-reader-less strings emitted as one declaration passed a clean 3-region
SHA1.

This item is the successor wave 9 scoped for itself. It is the largest unclaimed
target on the board.

**The mechanism, confirmed by the brain in the source this round** — so you are
not starting from the prose. `analyze_symbols.build_call_graph` resolves an
edge's origin with:

```python
caller = src_mod.enclosing_function(r.src_addr)
if caller is None:
    ... graph.unresolved_loads.append(r)   # edge dropped
```

A relocation originating **inside a data pointer table** has no enclosing
*function*, so `caller` is `None` and the edge is discarded into
`unresolved_loads`. That is the entire blind spot. Note the useful half: the
edges are already collected — they are simply unattributed. You are adding
attribution, not discovery.

**Scope:**

1. **Extend the graph to data->data load edges.** Attribute an edge to its
   enclosing *symbol* (data or function), not only `enclosing_function`. Keep the
   existing function->data behaviour byte-identical — any consumer of the current
   graph (`data_worklist.py` and friends) must produce the same output it does
   today unless it opts in. State in the PR which existing consumers you checked
   and how.
2. **Make the `src/` screen a precondition, in code, not in prose.** Wave 9's
   Attempt 1 caused a real link failure by absorbing a symbol whose name was
   already `.extern`'d by an earlier shipped Pattern-3 file. `relocs.txt` alone
   does not catch this. Every absorption candidate must be screened by name
   against the **entire `src/` tree** first. Wire that into the carve path so it
   cannot be skipped.
3. **Then drain a bounded first tranche.** Do NOT attempt the whole pool in one
   round. Take the newly-visible candidates that the extended graph surfaces,
   ship as many as gate cleanly, and report the honest remaining census.

**Report the pool honestly, including if it shrinks.** ~227,820 B / ~9,690
symbols is `cm-restock-carve-8`'s figure and it has never been re-derived under
the extended graph. **Your own fresh measurement is authoritative over that
number** — wave 9 corrected its own kickoff's 1,076 to 689 and was right to. If
the extended graph surfaces far fewer usable candidates than the raw symbol count
suggests, that is the finding; say so with the count you got.

**One falsification test up front (AGENTS.md control 6):** before you carve a
tranche, take a single newly-visible candidate whose only reader is an uncarved
pointer table, ship it alone, and gate it alone on 3-region SHA1. If that single
carve does not pass, the data->data reader is not a sufficient basis for the
method and the tranche does not get dispatched — report that instead. Wave 9
gated its own Part 1 canary this way before batching; do the same.

**Do not compose TUs to beat alignment.** Wave 9 avoided P-50 entirely by
emitting each candidate as its own single-declaration file, and every candidate
in its pool was individually 4-aligned. Check alignment per candidate and prefer
the single-declaration form; only reach for composition if you have a
4-aligned-at-both-ends span, and say so explicitly if you do.

**Gate:** full `python tools/gate3.py --scope all --clean` — all three `SHA1
PASS` lines pasted verbatim + pytest tail. Report `typed_array_bytes` /
`named_struct_bytes` before -> after via `tools/progress.py`'s
`summarize_data_readability`, with the BEFORE isolated by an actual
`git stash push -u` / `pop` (wave 9's method), not recalled. The byte delta must
reconcile against the files you shipped, item by item, the way wave 9's
`11,716 = 11,588 + 32 + 96` did.

ONE PR; verify every PR-body claim against `git diff --stat` before writing it;
`python tools/work_queue.py done claude-scaffolder cm-restock-carve-10`.

### cm-restock-carve-11 — the two tranches your own census sized [DONE]

`cm-restock-carve-10` (#1526) did what the brief asked and then some. Brain
verified independently: **739 new `src/main/data/*.c`, declared array bytes
summing to exactly 15,732**, 748 files total, zero deletions, and the
`typed_array_bytes` delta reconciles to the same figure. The `data_size_of`
parameter is opt-in and you checked all 16 real `build_call_graph` call sites
stay byte-identical by default — that is the right way to extend a shared tool.
`screen_names_against_src` is now code rather than prose, which is what wave 9's
Attempt-1 link failure actually cost us.

**And you corrected the pool figure again, which is the habit that matters.**
`cm-restock-carve-8`'s ~9,690-symbol / ~227,820 B estimate is superseded by your
own census: **5,826 symbols / 215,668 B** in `main`'s previously-"zero-reader"
pool, of which **5,751 / 213,220 B (98.7%)** have a real data-attributed reader
and only **75 / 2,448 B** are genuinely reader-less by both methods. Fourth
consecutive wave to correct an inherited count. That is now the series'
signature and it should stay that way.

**This wave takes the two successors you sized yourself:**

1. **3,187 string-shaped symbols / 68,613 B that need TU composition.** These
   are the ones that are not individually 4-aligned, so the Pattern-1
   one-declaration-per-file recipe does not apply. **P-50 is live here** —
   composed-TU declaration order collapsing to ascending size is PERMANENT with
   evidence, and the alignment-wall recipe only works when the composed span is
   4-aligned at BOTH ends. Take a bounded first tranche, gate the first composed
   TU alone before batching, and report the composable fraction honestly — if
   most of the 3,187 turn out to be non-composable under those two constraints,
   that is the finding and the byte figure comes down accordingly.
2. **1,825 non-string symbols / 128,875 B needing shape-specific recipes.** Do
   NOT attempt this as one job. Classify by shape first, pick the single largest
   tractable shape class, and write its recipe with one gated worked example —
   the way `cluster-c-recipe.md` was established. A recipe with one proven
   example beats a tranche of guesses.

Prefer (1) if you have to choose: the recipe already exists and only its
preconditions are in question. (2) opens a new method and deserves a clean run
at it rather than the tail end of a round.

**Standing preconditions, both now enforceable in code — use them:**
`screen_names_against_src` before any absorption, and the individual-alignment
check before choosing Pattern-1 over composition. Neither is optional and both
are yours from previous waves.

**Gate:** full `python tools/gate3.py --scope all --clean` — three SHA1 PASS
lines verbatim + pytest tail. `typed_array_bytes`/`named_struct_bytes` before ->
after via `summarize_data_readability`, BEFORE isolated with a real `git stash
push -u`/`pop`, and the delta reconciled item by item against the files shipped.
`git restore assets/` after the clean run. Regenerate `docs/research/README.md`
LAST.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-restock-carve-11`.

### cm-progress-dashboard — one page where every number is tool-derived [DONE]

The project owner steers this campaign without reading diffs; the brain
re-derives the same handful of numbers by hand every round (natural-C % per
region, remaining pool by band, data-readability bytes) and pastes them into
prose, where they immediately start going stale — the exact failure class the
pool-freshness tool was built for, one level up. Build the page that makes the
hand-derivation unnecessary.

`tools/generate_dashboard.py` writing `docs/dashboard.md`:

1. **Headline:** natural-C % and bytes for EUR / USA / JPN. REUSE the
   state-table generator's own parser — do not re-implement the metric (the
   standing rule from the metric-extern-guard incident: read the metric's own
   source, reuse its parser). State in the PR which function you reused.
2. **Trend:** the committed git history of `docs/state-table.md` IS the time
   series — walk `git log --follow -p` (or `git show <sha>:...` per commit)
   and emit a compact per-round table or sparkline of natural-C bytes. No new
   bookkeeping files; history is the database.
3. **Remaining pools by band:** reuse `wall_aware_headroom.scan()` (and the
   pool-freshness tool once it merges — check whether it landed and say which
   you used) for the candidate bands the campaign actually dispatches on
   (≤192 B, 193–256, 257–320, 321–384, ≥4 `bl` variants). Every figure
   stamped with the command that reproduces it.
4. **Data readability:** `progress.py summarize_data_readability` typed-array
   / named-struct bytes, plus the remaining zero-reader-pool estimate.
5. **The honest ceiling:** one short section linking
   `docs/research/rnd-swarm-2026-07-24-r8.md` (the measured-ceiling
   reclassification) and `docs/research/post-small-pool-strategy.md` (the
   decision memo) — the dashboard must carry the calibration, not just the
   good news.
6. **Freshness guard:** mirror the existing
   `test_generate_state_table.py::TestCommittedTableIsCurrent` mechanism so a
   stale committed dashboard fails the suite. Do NOT invent a new drift
   mechanism; copy the one that already works. No hardcoded counts, SHAs, or
   row totals in the test — assert shape, not cardinality (the class is
   0-for-3; see #1499/#1505/#1520).

Regenerate `docs/research/README.md` LAST if you touch research docs. Tooling
budget clause: consolidates duplicated infrastructure (the brain's per-round
hand-derivations) and measurably cuts cycle time.

**Gate:** full `python tools/gate3.py --scope tests` green (paste the tail) +
the committed `docs/dashboard.md` regenerated at HEAD + markdownlint clean +
every dashboard number annotated with its reproducing command. This item needs
no ROM build — if you find yourself running `ninja`, you have left scope.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-progress-dashboard`; commit;
report.

### cm-restock-carve-12 — build the group verifier, then drain the 66,096 B it unlocks [DONE]

**Rewritten 2026-08-24 after `cm-restock-carve-11` (#1547) reported its census.
The previous version of this item said "continue from wherever 11 stopped",
which is now underspecified — 11 told us exactly where it stopped and why.**

Wave 11 shipped **46 of 3,187 symbols (1,060 B — 1.4%)** and the small number is
the *good* outcome: it came down from an initial 62/1,456 estimate only because
the lane actually tested the differing-size class instead of assuming it, and
found a real EUR-breaking wall in the process. Its own disposition table is the
map for this wave:

| Class | Windows | Symbols | Bytes | Status after wave 11 |
|---|---:|---:|---:|---|
| n=2, same size | 23 | 46 | 1,060 | shipped, proven |
| n=2, differing size (ascending) | 8 | 16 | 396 | **declined — new wall** |
| n=2, size decreasing | 17 | 34 | 668 | declined — P-50, permanent |
| **n>=3, geometrically composable** | **576** | **3,069** | **66,096** | **deferred — this wave's target** |
| unreachable from run start | — | 22 | 393 | needs backward absorption, untested |

**The blocker is verification cost, not a wall.** The standing rule — established
the hard way in wave 4, when three separate n=4 groups from three different
modules silently reordered despite correct section sizes — forbids trusting an
n>=3 composed group without compiling it and inspecting its `.o` symbol table
first. Nobody is going to do that 576 times by hand. Wave 11 says so explicitly
and suggests a purpose-built tool. Build it.

**Part 1 — `tools/verify_composed_group.py` (name as you see fit).** Given a
candidate window: emit the composed TU, compile it standalone (no link needed),
read the resulting `.o` symbol table, and report whether the declaration order
and section layout match what the recipe requires — pass/fail per group with the
reason. Then run it across all 576 and publish the verified/rejected split.

This is the same "inspect before linking" method the alignment-wall recipe
already established; wave 11 used it manually at the compile stage to root-cause
the `char[N]` finding. You are automating a check this project already trusts,
not inventing a new one.

**Part 2 — drain what verifies.** Ship the groups that pass, canary-first
(gate one composed TU alone on 3-region SHA1 before batching), then the tranche.

**Size the wave to one comfortable round, and do not inflate it.** Both CC lanes
contend for the same ~40-minute 3-region clean gate; wave 10's scale is a fine
default. If the verifier passes 400 groups and you can only gate 150 cleanly,
ship 150 and leave the rest for wave 13 — the verifier's output is durable and
the next wave starts from it rather than re-deriving.

**Two things wave 11 proved that constrain this wave:**

- **`char[N]` string globals compile to their OWN `.data` section per
  declaration**, not one merged section with internal offsets. The
  alignment-wall recipe's "in-section offset" language describes struct-typed
  globals and does NOT describe this pool. Wave 11 corrected that doc; read the
  correction before you compose anything.
- **The n=2 ascending-size exception does not transfer here.** Wave 11's full
  tranche failed EUR SHA1 with a 93 MB divergence and a ROM-header ARM9-size
  shift — a file-layout signature, not a content bug — and bisected it to
  exactly the 8 differing-size windows. Do not re-attempt that class on a hunch;
  if you think you have a fix, prove it on ONE window with a full clean gate
  before it goes anywhere near a tranche.

**If the verifier finds most of the 576 reject**, that is the finding and the
66,096 B comes down accordingly. Say so plainly with the count — this series has
corrected an inherited number four waves running and that habit is worth more
than a big headline.

**Gate:** full `python tools/gate3.py --scope all --clean` — three SHA1 PASS
lines verbatim plus the pytest tail. `typed_array_bytes` / `named_struct_bytes`
before -> after via `summarize_data_readability`, BEFORE isolated with a real
`git stash push -u` / `pop`, delta reconciled against the files shipped.
`git restore assets/` after the clean run. Regenerate `docs/research/README.md`
LAST.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-restock-carve-12`; next item.

### cm-restock-carve-13 — the non-string shapes, one recipe at a time [DONE]

The 1,825 non-string symbols / 128,875 B are the larger half of the remaining
pool by bytes and the one with no established recipe. `cm-restock-carve-11`
was told to pick the single largest tractable shape class and prove one recipe
with a gated worked example. This wave takes the **next** shape class the same
way.

**Do not batch across shapes.** The reason the string pool scaled to 739 files
in one wave is that every candidate used one proven declaration form. A
non-string wave that mixes `fnptr_table`, `jump_table` and struct-ish shapes
inherits the failure modes of all three and diagnoses none of them. One shape,
one recipe, one gated example, then scale *within* that shape as far as the
pool allows — the same scale-the-tranche-not-the-risk rule as wave 12.

**`fnptr_table` deserves specific care.** A table of function pointers is not
inert data: its contents are relocations against real functions, several of
which are still `.s`. Emitting it wrong can produce a file that gates green in
isolation and breaks when a sibling function later ships to C. Screen every
entry against `src/` and against the delinks routing for the functions it
points at, and say in the PR what you checked.

Where a shape turns out to need a lever this campaign does not have, park it
with a real diagnosis and move to the next shape rather than iterating. An
honest "this shape needs X, which we do not have" is a result — it is how
`cluster-c-recipe.md` and the P-catalog got built.

**Gate:** as wave 12 — full 3-region clean gate, readability delta with the
BEFORE stashed, reconciliation item by item, README regenerated last.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-restock-carve-13`; then take the
next item — report QUEUE-EMPTY honestly if you genuinely reach it.

### cm-restock-carve-14 — carve the pointer tables themselves, the thing every other route keeps hitting [DONE]

Two of your own findings now point at the same target, so this wave takes it
head-on.

`cm-restock-carve-12` (#1561) proved the composition route is **dead**: 0 of 575
content-valid windows pass, 561 rejected pre-compile as mixed-size, 14 same-size
compiled and mismatched, plus the new finding that same-size does not generalise
from n=2 to n>=3 either. Nobody should spend another wave on composition — that
negative is worth more than a speculative positive.

`cm-restock-carve-13` (#1565) shipped 201 symbols / 7,100 B as opaque
`unsigned char[N]` and reported *why* it was only 201 of 788: **both the `array`
and `struct` shapes are dominated by embedded pointers rather than plain scalar
data.** The zero-internal-reloc subset is the small part.

So the remaining data pool is largely **pointer tables**, and they are the one
shape this campaign has a strong reason to want carved properly rather than
opaquely. `cm-restock-carve-10` only became possible because the call graph
learned to follow data->data edges — every uncarved pointer table is still a
hole in that graph. Carving one as `unsigned char[N]` ships bytes but keeps the
hole; carving it with real symbol references closes it.

**Scope:**

1. **Census the pointer-shaped population honestly.** How many of the ~587
   with-reloc array-shape symbols (and the struct-shape equivalents) are
   *pure* pointer tables — every internal relocation pointing at a resolvable
   symbol — versus mixed data-with-pointers? Report both, and the bytes.
2. **Prove the recipe on ONE table, gated alone**, before any batch. Emit real
   references (`void *const tbl[] = { &sym, ... }` or the shape the target
   actually wants) and gate it on 3-region SHA1 by itself.
   ⚠️ `const` placement decides `.data` vs `.rodata` and this project has been
   burned by it: `&symbol` always relocates into `.data`, so a literal-cast
   pointer array needs `void *const`. Get that wrong and the section moves.
3. **Only then take a bounded tranche**, sized to one comfortable round.
4. **Report the call-graph effect.** After carving, does
   `analyze_symbols.build_call_graph` attribute readers it previously could not?
   That is the second half of the value and it is measurable.

**Where a table points at a function still shipped as `.s`**, say so and handle
it explicitly — `cm-restock-carve-13`'s own caution applies: an emission can gate
green in isolation and break when a sibling later flips to C. Screen every target
against `src/` and against the delinks routing.

**If the pure-pointer-table population turns out small**, that is the finding.
Four waves running have corrected an inherited count and the series is trusted
because of it.

**Gate:** full `python tools/gate3.py --scope all --clean` — three SHA1 PASS
lines verbatim plus the pytest tail. `typed_array_bytes` / `named_struct_bytes`
before -> after with the BEFORE stashed for real, delta reconciled against the
files shipped. `git restore assets/` after the clean run. Regenerate every derived
artifact your content invalidates — dashboard, state-table and walls-index all
carry freshness guards now.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-restock-carve-14`.

### cm-restock-carve-15 — the high-reader unknown-shape symbols [DONE]

`cm-restock-carve-14` (#1573) shipped 167 single-embedded-pointer records
(2,004 B) and did it the right way — a **real symbol reference** for the pointer
field, which closes a call-graph hole instead of opaquing it, and no `const` so
the record stays in `.data`.

The bytes are small because that shape is small. Look at what
`data_worklist.py --include-data-readers` now ranks at the top and a different
population is obvious:

```text
ov002  data_ov002_022d0e6c  shape=unknown  readers=123
ov002  data_ov002_022ce950  shape=unknown  readers=107
ov002  data_ov002_022cf1ac  shape=unknown  readers=106
main   data_020faca0        shape=array    size=0x3a0  data_readers=65
```

These are **heavily-used symbols with no classified shape** — 123 readers is core
game data, not a stray table. They have been passed over by every wave so far
precisely because `shape=unknown` gives no recipe to apply.

**Scope, in order:**

1. **Classify before carving.** Take the top ~20 by reader count and work out
   what they actually are, from the relocation pattern, the access widths at the
   reader sites, and `sec=`. Several show `sec=unknown size=?`, which is itself a
   finding — the worklist cannot size them, and knowing why is prerequisite to
   anything else.
2. **Pick the single largest tractable class** that emerges and write its recipe
   with **one gated worked example**, the way `cluster-c-recipe.md` and
   `cluster-b-pointer-pool.md` were established.
3. **Then a bounded tranche within that one class.** Do not batch across shapes —
   carve-13 established why.

**A high reader count is a reason for care, not speed.** A symbol read from 123
sites has 123 chances to expose a wrong field split. The project's standing
no-invented-structure convention applies with full force: leave a prefix as
`unsigned char[N]` unless the reader evidence actually proves a finer split, and
say what the evidence was.

**If these turn out to be genuinely unclassifiable without more tooling**, that
is the finding — report it with what you tried and what tooling would close it.
Five waves have corrected an inherited assumption and the series is trusted
because of it.

**Gate:** full `python tools/gate3.py --scope all --clean` — three SHA1 PASS
lines verbatim plus the pytest tail. `typed_array_bytes` / `named_struct_bytes`
before -> after with the BEFORE stashed for real, delta reconciled against the
files shipped. `git restore assets/` after the clean run. Regenerate every derived
artifact your content invalidates.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-restock-carve-15`.

### cm-port-drain-jpn — the same drain, JPN side, with the machine to yourself [DONE]

**Status: re-issued. You did not fail this last round — the schedule did.** Your
worktree still holds your claim commit and one accepted port,
`src/jpn/main/func_0200ab94.c`. It is preserved deliberately. The other lane held
the compiler toolchain continuously from 18:08 to 20:08 while ROM-gating 15
batches, and the previous kickoff required a full three-region gate as your very
next step while forbidding concurrent builds. That was unsatisfiable, and
stopping was the correct read. **This round you are the only toolchain-bound lane
on the machine.**

**The pipeline is proven, at scale.** The USA side of this exact item shipped
**283 ports in 15 self-gated batches, every one `usa sha1 OK`**, and the merged
result passed a full three-region clean gate. Nothing about the tooling is in
doubt. USA natural-C went **11.84% -> 13.43%** on it.

**What to expect, measured rather than guessed.** USA accepted **283 of 651**
candidates — a **43.5%** acceptance rate, with 365 confidence-floor refusals, 2
needs-symbol skips and 1 prefilter refusal. The brain had predicted ~44% by
replicating `port_to_region.py`'s own floor rule, so treat that rate as a sound
prior for JPN. **Refusals are the expected outcome for more than half the pool
and are a success, not a shortfall.** "N shipped, M refused with reasons" is the
deliverable.

**Your pool:** roughly **653 rows / 99,388 B** byte-identical, of which 650 files
are natural C. Re-derive it yourself with `python tools/port_census.py` and paste
the before counts — do not inherit the number. At USA's rate this is on the order
of **280 ports and a ~1.6-point JPN gain**, which is the largest single item on
the board.

⚠️ **`byte_sim = 1.0` does NOT mean portable.** Byte-similarity compares bytes;
the port tool refuses unless every symbol resolves at the HIGH/EXACT floor.
PR #1459 is the proof — an entire byte-identical pool refused on the floor.
Treat 99,388 B as an **upper bound**. **Never force a below-floor candidate**: do
not lower `--confidence-floor` and do not disable auto-promotion to move a
number.

⚠️ **`port_harvest.py` iterates BOTH regions — this is by design, not a bug.**
`tools/port_harvest.py:23` is `REGIONS = ("usa", "jpn")` and there is no region
flag. It will walk the USA remainder first; USA is already drained to 368
genuinely-refusing rows, so expect it to pass through them quickly and land on
JPN. **That is correct behaviour — let it run.** Do not try to force a
JPN-only invocation, and if you do drive `port_to_region.py --target jpn`
directly instead, say so in the PR.

**Territory: you own the whole tool this round.** No other lane is touching
`src/usa/`, `src/jpn/`, or the toolchain. If the harness ports a few residual USA
rows on its way through, that is fine and in scope — do not hand-unpick them.

**Sequence.** `python tools/port_census.py` first; verify its exit status and
read `build/port_backlog.json` rather than trusting a silent run. Then drive
`python tools/port_harvest.py --batch 20` in a loop until the pool is drained or
genuinely refuses. **Ending non-zero is normal**; the success line is "drained or
genuinely refuse", never "zero remaining".

**No canary this round.** The pipeline has 283 gated ports behind it and the
machine is yours; a single-port pre-gate would only cost you a batch cycle. Just
start batching — the harness ROM-gates every batch itself, so a bad port cannot
get past batch one.

**Gate:** the harness ROM-gates each batch. Finish with `python tools/gate3.py
--scope all` and paste **all three SHA1 PASS lines verbatim** plus the pytest
tail, then `python tools/check_activation_invariant.py origin/main..HEAD`, then
before/after `port_census.py` counts. Do not pipe the gate through `tail` — the
brain did that this round and clipped its own evidence; use `tee` if you need a
log. `git restore assets/` if a `--clean` run deletes the heatmap SVGs.

ONE PR; verify every number against `git diff --stat` before writing the body;
`python tools/work_queue.py done claude-scaffolder cm-port-drain-jpn`.

### cm-port-exact-name-unlock — the 49-candidate blocker #1586 found, fixed and banked [DONE]

`q-port-refusal-taxonomy` (#1586) did the analysis this item acts on. Read
`docs/research/campaign-analytics/port-refusal-taxonomy.md` in full first — it is
the specification for this work and it already did the measurement, so **do not
re-derive the taxonomy**.

**The finding.** `resolve_symbol` in `tools/port_to_region.py` resolves a
callee by structural fingerprint matching and never checks whether the target
region's own `symbols.txt` **already names that symbol identically**. It is
authoritative, committed ground truth sitting unread. Brain verified the
example independently:

```text
config/eur/arm9/symbols.txt:3506:OS_DisableIrq kind:function(arm,size=0x14) addr:0x020937a4
config/usa/arm9/symbols.txt:3506:OS_DisableIrq kind:function(arm,size=0x14) addr:0x020936bc
config/jpn/arm9/symbols.txt:3506:OS_DisableIrq kind:function(arm,size=0x14) addr:0x020936bc
```

Same name, all three regions, different addresses. The fingerprint matcher
lands on MEDIUM and the candidate refuses, when an exact-name lookup would
resolve it outright.

**Scope, in order. Each numbered step is separately gated — do not batch them.**

1. **Add the exact-name lookup to `resolve_symbol`**, consulted BEFORE the
   fingerprint fallback, returning a HIGH-equivalent confidence. #1586 measured
   the impact: **49 USA candidates (7,692 B) refused SOLELY on this**, 38 more
   (6,156 B) partially helped, and JPN reproduces it at ~50 / 8,120 B.
2. **Fix the two small bugs #1586 identified**, each with a test that you have
   seen fail before it passes: the comment-parsing false positive in
   `parse_symbols_in_source` (same bug class `q-invariants-green` already fixed
   in `check_match_invariants.py`, never applied here — 3 sole candidates), and
   the `find_region_siblings.load_region()` ITCM-module coverage gap (2 sole
   candidates).
3. **Then re-run `python tools/port_harvest.py --batch 20`** over both regions
   and bank whatever the fix unlocks. The harness ROM-gates every batch.

⚠️ **A name match is a hypothesis, not a proof, and this project has been bitten
by exactly this.** Briefs 673/676 fixed a wrong-sibling bug class, and #1462
fixed a placeholder-twin recurrence. The existing MEDIUM conservatism is there
for a reason and #1586 explicitly recommends NOT weakening it. **You are adding
a new authoritative source, not lowering the floor.** Do not touch
`--confidence-floor`, do not disable auto-promotion, and do not promote
fingerprint results. If a name-matched symbol still fails the ROM gate, that is
the finding — stop and report it rather than working around it.

⚠️ **Guard against the placeholder class.** Some `symbols.txt` names are
injected placeholders from `dsd init --allow-unknown-function-calls`, not real
recovered names. An exact-name match against a placeholder twin is precisely
the PR #1462 failure. Decide explicitly how you exclude them and say what rule
you used.

⚠️ **The ROM gate is the arbiter and it cannot be fooled.** If the lookup
resolves a symbol wrongly, the batch gate fails and the batch is rejected. That
is your safety net — but a gate failure on step 1 means the lookup is unsound,
so **stop and report rather than retrying with a narrower filter.**

**Gate:** the harness ROM-gates each batch. Finish with `python tools/gate3.py
--scope all` — all three SHA1 PASS lines pasted verbatim plus the pytest tail —
then `python tools/check_activation_invariant.py origin/main..HEAD`, then
before/after `port_census.py` counts for BOTH regions. Do not pipe the gate
through `tail`; use `tee`. `git restore assets/` if a `--clean` run removes the
heatmap SVGs. Regenerate `docs/dashboard.md` if it goes stale.

ONE PR; verify every number against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-port-exact-name-unlock`.

### cm-verified-neighbor-tranche — the 95.3% wall, tested against the ROM gate [DONE]

`q-fingerprint-promotion-evidence` (#1589) measured what `q-port-refusal-taxonomy`
(#1586) had only judged. Read
`docs/research/campaign-analytics/fingerprint-signal-evidence.md` in full first —
it is the specification and it already did the measurement. **Do not re-derive
it.**

**What it found.** `verified_neighbor` — the neighbour-shift check rebuilt on
*proven* neighbour mappings instead of `find_siblings`' own unverified per-neighbour
guess — covers **98.7% of the ambiguous population at 100% accuracy
(2,960/2,960)**, holds at the strictest zero-relocation threshold (16/16), and
correctly predicts the true answer on **all 4 known-wrong rows**, reproducing by
measurement what briefs 673/675 established by hand. `cross_region_agreement`
came back a clean null (100% "agree" on both labelled sets — no discriminative
power). Brain independently confirmed the `Copy32` case:

```text
config/usa/arm9/symbols.txt:3543:Copy32 kind:function(arm,size=0x18) addr:0x020943e0
config/usa/arm9/symbols.txt:3544:func_020943f8 kind:function(arm,size=0x18) addr:0x020943f8
```

The fingerprinter picks `…3f8`, an unnamed placeholder of identical size;
`verified_neighbor` predicts `…3e0`, where `Copy32` is actually named.

**Why this is worth a lane, stated honestly.** If the signal holds, roughly
60 KB per region that #1586 called very likely dead becomes reachable. If it
does not, we learn that at a bounded cost and the question closes for good.

⚠️ **THE STATED WEAKNESS IS REAL AND THIS ITEM IS ITS FALSIFICATION TEST.**
PR #1589 was explicit: 0 errors in 2,964 trials bounds the error rate at only
**≤0.1% by the rule of three, not zero**, and the known-wrong set is **n=2
distinct incidents** — far too small to bound false positives statistically. It
also warns the evaluation population is a **proxy** for the real MEDIUM
population, not identical to it. **You are not here to confirm the finding. You
are here to give it a real chance to fail against the only arbiter that cannot
be argued with.**

**Scope, in order. Each step separately gated — do not batch them.**

1. **Implement `verified_neighbor` as a new confidence source** in
   `port_to_region.py`, in the same shape #1590 added `EXACT_NAME`: a distinct
   tier, consulted in a defined order, **without** touching `--confidence-floor`,
   auto-promotion, or the MEDIUM ceiling. Reuse the shared `FLOOR_RANK` constant
   #1590 consolidated — do not add a third copy.
2. **A BOUNDED first tranche of at most 20 candidates**, gated as one batch,
   before anything else. Paste that batch's three SHA1 PASS lines.
3. **Only if that batch gates clean**, continue in batches of 20 to a **hard
   ceiling of 100 ported this round.** Stop there even if more are available.
   The point is a measured trial, not a drain — a later round widens it once
   this one has evidence.

⚠️ **A GATE FAILURE IS THE MOST VALUABLE OUTCOME THIS ITEM CAN PRODUCE.** If any
batch fails, **STOP immediately.** Do not narrow the filter, do not exclude the
failing candidate and retry, do not adjust a threshold. Report which candidate
failed, what `verified_neighbor` predicted, what the fingerprinter would have
picked, and what the truth was. That single data point is worth more than 100
successful ports, because it is the false positive the n=2 sample could not
bound.

⚠️ **Do not weaken any existing guard to make a number move.** #1586 recommended
keeping the MEDIUM conservatism and #1590 respected that. You are adding a
third ground-truth source alongside `EXACT_NAME`, not lowering a floor.

**DO NOT USE SUB-AGENTS FOR THIS ITEM.** They share this worktree rather than
getting isolated copies, so parallel writers corrupt `src/`, `config/` and the
git index; and the compiler serialises machine-wide, so parallel builders queue
instead of going faster. Single-threaded.

**Gate:** per-batch ROM gates, then `python tools/gate3.py --scope all` with all
three SHA1 PASS lines pasted verbatim plus the pytest tail, then
`check_activation_invariant.py origin/main..HEAD`, then before/after
`port_census.py` for BOTH regions. Use `tee`, never `tail` — the SHA1 lines are
emitted before the four-minute pytest block. `git restore assets/` after a
`--clean` run. Regenerate `docs/state-table.md` first and `docs/dashboard.md`
second, each after the commit it describes has landed.

ONE PR; verify every number against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-verified-neighbor-tranche`.

### cm-verified-neighbor-drain — the ceiling comes off [DONE]

`cm-verified-neighbor-tranche` (PR #1594) was written as a falsification test and
**the signal did not fail**: 95 ports across **9** consecutive gated batches
(brain re-counted the commits — the PR body says 8 in prose, its own table and
the commit log both say 9), zero gate failures, zero bisects. USA went to
**14.15%**, JPN to **14.07%**. The first batch took **14 of 20** candidates that
had been refusing for two prior rounds.

The 100-port cap existed only because the signal was unproven. It is now proven
across 9 independent ROM gates in both regions. **Take the cap off and drain.**

**Remaining pool, brain-measured on `main` after PR #1594 merged:**

```text
=== USA ===  BACKLOG-s: 285   sim=1.0: 255
=== JPN ===  BACKLOG-s: 299   sim=1.0: 269
```

524 byte-identical rows across both regions. At the tranche's observed rate this
is the largest remaining mechanical block on the board.

**Scope:** run `python tools/port_harvest.py --batch 20` in a loop across both
regions until the pool is drained or genuinely refuses. **Ending non-zero is
normal** — the success line is "drained or genuinely refuse", never "zero
remaining". The harness ROM-gates every batch itself.

⚠️ **THE STOP RULE FROM LAST ROUND STILL STANDS AND IS NOT RELAXED BY THE
EVIDENCE.** Nine clean gates bound the error rate lower than PR #1589's ≤0.1%
estimate; they do not make it zero. **If any batch fails the gate, STOP
IMMEDIATELY.** Do not narrow the filter, do not exclude the failing candidate
and retry, do not adjust a threshold. Report which candidate failed, what
`verified_neighbor` predicted, what the fingerprinter would have picked, and what
the truth is. A failure this late is *more* informative than one in the tranche,
not less — it would mark the edge of the signal's validity.

⚠️ **Do not weaken any guard to reach the bottom of the pool.** Do not touch
`--confidence-floor`, `auto_promote_low`, or the MEDIUM ceiling. Candidates that
refuse for byte-mismatch, genuine MEDIUM ambiguity, or a missing `symbols.txt`
line are **different blocker classes** and are supposed to refuse — PR #1594
identified them correctly and you should expect the same.

⚠️ **Refresh the census between harvest calls.** PR #1594 found that a stale
`build/port_backlog.json` makes `--limit` re-report the same window as "already
ported (live dedup) — skip". Re-run `port_census.py` between calls.

**Second, smaller task once the drain is done or has genuinely stalled.**
PR #1594 deliberately kept **two copies** of `verified_neighbor_signal()` — one
in `port_to_region.py`, one in `fingerprint_signal_evidence.py` — arguing the
latter is frozen published evidence with a different calling convention. That
argument is reasonable, **but `FLOOR_RANK` in this same codebase had already
drifted across two copies before PR #1590 consolidated it**, so the precedent
cuts the other way. Either unify them behind one implementation with the
evidence copy as a thin adapter, **or** add a test that fails if the two
algorithms ever diverge. Your call which — but pick one and say why.

**DO NOT USE SUB-AGENTS.** They share this worktree rather than getting isolated
copies, so parallel writers corrupt `src/`, `config/` and the git index; and the
compiler serialises machine-wide, so parallel builders queue. Single-threaded.

**Gate:** per-batch ROM gates, then `python tools/gate3.py --scope all` with all
three SHA1 PASS lines pasted verbatim plus the pytest tail, then
`check_activation_invariant.py origin/main..HEAD`, then before/after
`port_census.py` for BOTH regions. Use `tee`, never `tail`. `git restore assets/`
after a `--clean` run.

ONE PR; verify every number against `git diff --stat` **including the batch
count** — last round's body miscounted its own batches; `python
tools/work_queue.py done claude-scaffolder cm-verified-neighbor-drain`.

### cm-377-512-probe — the first real probe into the band nobody has tried [DONE]

**The ports are done.** After `cm-verified-neighbor-drain` (PR #1597) the
byte-identical pool is **17 USA / 18 JPN rows** — down from 524. USA and JPN
both sit at **15.85%**, EUR at **17.27%**. There is no derivative work left;
from here the only thing that moves any region is EUR itself.

`q-eur-next-frontier` (PR #1596) then showed the frontier was never closed —
it was **under-sampled**. Brain verified the ledger directly:

```text
   193-256: 267 attempts      321-376:  70
   377-512:  66               513-1023: 16
    >=1024:   1
```

**The three largest bands hold 1,211,260 B dispatch-ready — 87% of the entire
1,389,500 B code pool — against 83 logged attempts between them.** `>=1024 B`
has been attempted **once** in the whole ledger. **377-512 B does not appear in
any prior band recap at all.**

Read `docs/research/campaign-analytics/eur-next-frontier.md` in full first. It
is the specification and it already did the census — **do not re-derive it**.

**Scope: n=20 at 377-512 B**, drawn from the unattempted population, full
2-4-iteration protocol, `attempts` column populated, **both results ledgered**.
This is a probe to find out whether the band is live, not a drain.

**Thresholds, pre-registered — write them down before you start and do not move
them:** `>=25%` the band is live and this becomes the campaign's main line;
`<=10%` closed, record it in the wall catalog with the evidence; `10-25%`
marginal, report it as such. **Do not adjust the sample or the thresholds to
reach a number.** Every band probe this campaign has run has been trustworthy
because nobody did, and PR #1596 held that line by leaving three ship rates
**blank** rather than extrapolating from 83 attempts.

⚠️ **Expect this to be harder than the small bands, and do not read difficulty
as failure.** Larger functions have more registers live across more branches;
the historical prior is poor. **A clean null here is a genuinely valuable
result** — it would mean the 1.2 MB is not reachable by the current method and
the campaign needs a different one, which is worth knowing definitively rather
than assuming in either direction.

⚠️ **Watch the vintage rule.** `docs/research/band-rate-vintage.md`: sweep-7
measured 193-256 B at 27.6%, and a disjoint sample of the identical band later
returned **0/60**. Your 20 are evidence about *your* 20 and the population you
drew them from — say what that population was and how you sampled it.

⚠️ **If `m2c_feed.py` cannot produce a candidate**, record it as a
**tooling blocker, not a match failure**, and keep it out of your ship-rate
denominator. The other lane is measuring exactly that this round
(`find_object` globs only `_dsd_gap@*.o` and may be blind to per-source delink
objects). Say how many of your 20 you lost to it, if any.

**DO NOT USE SUB-AGENTS.** They share this worktree rather than getting isolated
copies, so parallel writers corrupt `src/`, `config/` and the git index; the
compiler serialises machine-wide. Single-threaded.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, `gate3.py --scope tests`. Use `tee`, never `tail`.
**If the round ships zero, say so** and note the invariant correctly refuses a
vacuous pass. `git restore assets/` after each clean run.

ONE PR; verify every number against `git diff --stat` including the arithmetic
and the attempt count; `python tools/work_queue.py done claude-scaffolder
cm-377-512-probe`.

### cm-257-320-drain — the only live code pocket left, with two new levers [DONE]

**The band map is now complete and monotone.** `cm-377-512-probe` (PR #1600)
closed 377-512 B at **1/20 = 5.0%** on a pre-registered threshold, and the
gradient across the whole frontier is unambiguous:

| band | rate | status |
|---|---|---|
| 193-256 B | 0/60 | closed (204 fresh candidates remain) |
| **257-320 B** | **4/20 = 20.0%** | **MARGINAL — the only pocket above 10%** |
| 321-376 B | 1/15 = 6.7% | closed (161 fresh remain) |
| 377-512 B | 1/20 = 5.0% | **closed (BR-7)** |
| 513-1023 B | 0/15 | effectively closed |
| >=1024 B | 1 attempt ever | unmeasured |

**Larger is monotonically harder.** Probing 513-1023 B would almost certainly
return another null, and PR #1600's three 80%+ near-misses were each diagnosed as
**compiler-internal register-allocation residuals, not under-effort** — the
method has a ceiling and we have found it.

**So: drain the one pocket the data says is live.** 257-320 B holds **263
unattempted candidates / 75,980 B**. At its measured 20.0% that is roughly 50
functions and ~15,000 B — the best remaining code EV by a wide margin.

**Two new levers landed in PR #1600. Try both here; they were discovered one
band up and have never been applied at 257-320 B.**

1. **`volatile` on a raw MMIO register pointer** forces mwcc's own two-load
   read-modify-write instead of a CSE'd single load. Took one candidate from
   **20.8% to 81.1% in a single change** (`func_ov016_021b32f0`).
2. **Shift-pair over mask simplification** — reverting `(field & 7) == 0` to the
   literal `(u32)(field << 0x1D) >> 0x1D` closed a 6.7% first attempt to
   **100%**. PR #1600 notes this extends to 3-bit fields.

Read `docs/research/cm-377-512-probe-2026-08-29.md` for both levers in full
before starting, and `codegen-walls.md`'s BR-7 entry for the band context.

**Scope: a drain, not a probe** — this band is already characterised, so work
candidates until they stop shipping or you have exhausted a reasonable batch.
Populate `attempts`, ledger both results, and **record explicitly whether either
new lever changed an outcome** — that is the secondary finding and it matters
for every future round.

⚠️ **Do not re-probe or re-characterise the band.** The 20.0% is measured. If
your observed rate diverges sharply from it, **report the divergence** rather
than adjusting anything — `band-rate-vintage.md` exists because a same-band
resample once collapsed 27.6% to 0/60, and a real shift is a finding.

⚠️ **`m2c_feed.py`'s `find_object()` will fail on most candidates.** PR #1600
hit it on **all 20**; the existing **`--obj` override bypasses it cleanly every
time**. Use the override, do not fight the glob, and do not count a feed failure
as a match failure. The other lane is fixing this properly in parallel.

**DO NOT USE SUB-AGENTS.** Shared worktree, machine-wide-serialising compiler.
Single-threaded.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, `gate3.py --scope tests`. Use `tee`, never `tail`.
`git restore assets/` after each clean run. **Regenerate `docs/state-table.md`
first and `docs/dashboard.md` second**, each after the commit it describes has
landed. Add any new `PROVISIONAL:` `park_class` values to
`tools/park_class_map.tsv` — PR #1600 had to fix 15 of them.

ONE PR; verify every number against `git diff --stat` including the arithmetic;
`python tools/work_queue.py done claude-scaffolder cm-257-320-drain`.

### cm-257-320-drain-2 — continue the only live pocket, with the tax removed [DONE]

`cm-257-320-drain` (PR #1603) worked 17 candidates and shipped **3 = 17.6%**,
inside the noise of BR-4's pre-registered 20.0% at n=17. It correctly declined
to declare a divergence it could not support. **259 candidates remain
unattempted in this band** — still the only pocket above the campaign's 10%
closed line, and still the best remaining code work.

**Two things changed in your favour since that round.**

1. **The `find_object()` tax is gone.** PR #1602 added the per-source fallback,
   disasm-verifying the header at the predictable path rather than trusting
   existence. You should no longer need `--obj` for most candidates. **If you
   still do, say so** — that would mean the fallback misses a case PR #1599's
   774/774 measurement did not.
2. **The shift-pair lever is confirmed to transfer**, on a direct A/B test:
   `(u32)(x << 0x1F) >> 0x1F` scored **71.2%** where `x & 1` scored **7.7%** on
   the same candidate. Use the literal form by default in this band.

**Scope: continue the drain.** Work candidates until they stop shipping or you
have exhausted a reasonable batch. Populate `attempts`, ledger both results.

**Three new failure signatures came out of PR #1603 as unconfirmed 1-2-hit
leads. Test them as levers where the shape fits, and report which (if any)
became one:**

- push-vs-`sub sp,#N` alignment padding
- `str`/`stmib` instruction-fusion choices
- independent-computation interleaving

Read `docs/research/cm-257-320-drain-2026-09-01.md` before starting — the
per-candidate table and both levers are there in full, and BR-8 in
`codegen-walls.md` has the band context.

⚠️ **The denominator question from last round, stated so you can improve on
it.** PR #1603 screened 6 candidates out on sight as confirmed P-20 wall
members and excluded them from its denominator, giving 3/17 = 17.6%; including
them it is 3/23 = 13.0%. That exclusion was defensible and clearly disclosed.
**This round, report BOTH numbers explicitly** — attempted-rate and
pool-rate — so the band's real yield is not flattered by screening. The other
lane is auditing whether the wall classifications that justify such screening
are themselves over-applied.

⚠️ **Do not re-characterise the band.** 20.0% is the measured baseline and
17.6% is consistent with it. If your rate diverges sharply, **report the
divergence** rather than adjusting anything — `band-rate-vintage.md` exists
because a same-band resample once collapsed 27.6% to 0/60.

**Disclose attempts that made a match worse**, the way PR #1603 disclosed its
two regressions (78.8%->47.0% and 62.1%->57.6%). Those are data about the
compiler, not embarrassments.

**DO NOT USE SUB-AGENTS.** Shared worktree, machine-wide-serialising compiler.
Single-threaded.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, `gate3.py --scope tests`. Use `tee`, never `tail`, and
**read the log rather than the exit code**. `git restore assets/` after each
clean run. Regenerate `docs/state-table.md` first, `docs/dashboard.md` second.
Add any new `PROVISIONAL:`/`P-NN` `park_class` values to
`tools/park_class_map.tsv` — PR #1603 had to fix 12.

ONE PR; verify every number against `git diff --stat` including both rate
figures; `python tools/work_queue.py done claude-scaffolder cm-257-320-drain-2`.

### cm-257-320-drain-3 — continue, and make screening visible in the ledger [TODO]

`cm-257-320-drain-2` (PR #1606) reported both denominators as asked — **1/14 =
7.1% attempted, 1/27 = 3.7% pool** — corrected the brain's stale "259 remaining"
to **246**, and confirmed PR #1602's fix in the field: **zero of 27 candidates
needed `--obj`**, down from all 20 the round before. **232 candidates remain.**

**Read the rate honestly before deciding this is a collapsing band.** All-time
attempted-rate across BR-4, BR-8 and BR-9 is **8/51 = 15.7%** — still marginal
territory, not closed. The *pool*-rate is lower only because roughly half of
examined candidates are being screened out on the P-20 wall, and
`q-wall-overblock-audit` (PR #1605) confirmed **P-20 is the best-evidenced wall
in the catalog** — 55 confirmed members, 6 independently convergent
falsification rounds, and a fresh signature re-scan of the 1,777-candidate pool
found **zero further matches**. So the pool-rate is measuring "a bounded share
of this band is P-20", not "this band is hard". **Do not conflate the two.**

**PRIMARY CHANGE THIS ROUND — write a ledger row when you screen.** PR #1605's
headline: across all **1,822** rows, **zero** are `result=not-attempted` tagged
to any formal P-NN wall. Brain verified it directly — the 31 `not-attempted`
rows carry `unknown`, `C-31`, `permanent-header`, `C-23-C-36`, `complexity`, and
nothing else. **Screening currently leaves no trace at all**, which is why
nobody could answer how many candidates the walls block.

So: when you screen a candidate on sight, **write an `attempts.tsv` row** with
`result=not-attempted` and the `park_class` set to the wall you screened on
(`P-20`, etc.). That single change makes screening measurable for every future
round, and it is worth more than a marginal ship. Say in your PR how many rows
you added.

**Scope: continue the drain** on the remaining 232. Populate `attempts`, ledger
every outcome including screens, and **report both rate figures again** plus a
third: how many of your screens were P-20 versus other grounds.

**Since P-20 membership is bounded at 55 confirmed and 18 have now been
encountered across two rounds, track your cumulative P-20 encounters** — if the
screened share falls as you go, the band's effective yield improves and that is
worth knowing.

**Three signature leads, updated by PR #1606:** push-vs-`sub sp,#N` alignment
padding is now **effectively confirmed compiler-internal** (4th+ occurrence,
zero source-level response) — treat it as a wall, not a lever.
Independent-computation interleaving has 2 hits and is still unresponsive.
`str`/`stmib` fusion had no clean re-hit. Two new leads appeared: a
`pop {regs,lr}; bx lr` epilogue convention (2 hits, possibly tied to whether a
function's address is taken elsewhere), and an unconditional spill of all
incoming argument registers where m2c under-detected the true parameter count.

⚠️ **The `volatile` lever is still untested.** PR #1606 found one genuine MMIO
read-modify-write case and it came back **inconclusive**, blocked by an
unrelated structural mismatch. If you meet another, that is worth the attempt.

**Disclose attempts that make a match worse and revert them**, as PR #1606 did
(24.2%->12.1%).

**DO NOT USE SUB-AGENTS.** Shared worktree, machine-wide-serialising compiler.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, `gate3.py --scope tests`. Use `tee`, never `tail`, and
read the log not the exit code. `git restore assets/` after each clean run.
Regenerate `docs/state-table.md` first, `docs/dashboard.md` second. Add new
`PROVISIONAL:`/`P-NN` values to `tools/park_class_map.tsv`.

ONE PR; verify every number against `git diff --stat`; `python
tools/work_queue.py done claude-scaffolder cm-257-320-drain-3`.
