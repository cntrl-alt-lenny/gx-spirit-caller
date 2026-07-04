[//]: # (markdownlint-disable MD013 MD041)

# Brief 523 — overlay-tail C-match wave

**Brief:** 523 (Claude scaffolder, four-lane round 521-524). Owns overlay-tail
delinks: ov000/005/006/011/013/016/019/022. Work `safe-queue-v3.md` §4 rows
filtered to these modules, confirm containment, reshape, port EUR → USA/JPN,
gate per-region `ninja sha1`.

## What shipped — 2 EUR matches, USA/JPN port-blocked (data-symbol gap)

| addr | module | size | result |
|---|---|---:|---|
| `021b8d9c` | ov006 | 68B | **MATCHED (EUR)** — port blocked |
| `021ab460` | ov022 | 80B | **MATCHED (EUR)** — port blocked |

Both are byte-identical EUR matches confirmed via `containment_check.py`
(0-byte diff, CONTAINED) — the real brief-514 ARM9-diff pre-gate against the
built `arm9.bin`, not just a local objdiff/fastmatch read.

## Infrastructure finding — shared-worktree collision (four-lane round)

**The four-lane round assigns two lanes to the same physical directory.**
`git worktree list` at round start showed only 3 worktrees (`brain`,
`decomper`, `scaffolder`) for 4 concurrent lanes (521/522/523/524). Brief
521 (Codex, `main` c-match) and brief 523 (this lane, overlay-tail) were
both pointed at `/Users/leo/Dev/spirit-caller/scaffolder`. Module-level file
partitioning (521 owns `config/*/arm9/delinks.txt`, 523 owns the overlay
delinks) does **not** protect against this: partway through this wave, the
reflog showed unattended `git checkout` calls moving the shared working tree
from `claude/cmatch-overlays-523` → `main` → `codex/cmatch-main-521` —
almost certainly Codex's own lane switching branches in the same checkout.
A `git checkout` swaps the *entire* working tree regardless of which files
"belong" to which lane, so it silently discarded my two uncommitted, already
byte-verified matches before I could commit them (the branch ref itself was
untouched — only the uncommitted working-tree content was lost).

**Recovery:** `git worktree add ../scaffolder-claude-523
claude/cmatch-overlays-523` — a genuinely separate worktree for my branch —
then recreated both matched files (their exact content was still in-session,
verified byte-identical seconds earlier, so nothing was actually re-derived
blind). Finished the wave from there, undisturbed. Codex's in-flight 3-region
gate in the original directory was never touched or interrupted.

**For the brain:** future four-lane (or any >3-concurrent-lane) rounds need
one worktree per lane, not per role-name. `scaffolder`/`decomper`/`brain` as
directory names stopped being 1:1 with "concurrent agent" once two agents
both got a `scaffolder`-labeled brief in the same round.

## Second infrastructure finding — bd74e172 collateral-damage gap (blocks USA/JPN for ALL four lanes)

Getting my own USA gate green (needed regardless of the port-block above,
since the *overall* 3-region build must stay healthy) hit a link failure
unrelated to anything in this lane: `mwldarm.exe: Specified file
'build/usa/src/usa/main/func_02005be0.o' not found`. Root cause, confirmed
via `git show bd74e172 --stat`: commit `bd74e172` ("feat(502): wave 3 batch
7 USA+JPN ports", 2026-06-28 — **the exact commit the four-lane brief's own
warning already names**: *"the bd74e172 neighbor-sweep latently broke JPN
for 5 days"*) legitimately ported 2 functions (`02005b1c`, `020062b0`) but
**also deleted 6 unrelated, already-matched files as collateral** —
`src/{usa,jpn}/main/{func_02005be0,func_0200620c,func_020062f8}.c` — without
updating `delinks.txt`, which still lists all 6 as `complete`.

**JPN's copy of this damage was already repaired in a later commit**
(matches the brief's "latently broke JPN for **5 days**" — past tense; `git
diff HEAD -- src/jpn/main/func_02005be0.c` etc. show no diff, all 3 JPN
files are already correctly tracked). **USA's identical 3-file damage was
never fixed** and is still broken at `origin/main` HEAD (`669f9f37`) —
meaning every one of the four lanes forked from this round's base has a
broken USA gate, not just this one.

Restored the 3 missing USA files from the parent commit (`git show
bd74e172^:<path> > <path>` — byte-for-byte recovery of previously-matched
code, zero new content) **locally, uncommitted**, to validate my own gate
honestly rather than reporting a false green. Confirmed USA `ninja sha1`
passes with the restoration in place (JPN already passed unmodified).
**Did not include the restored files in this PR** — `src/usa/main/` is
brief 521's module, not this lane's — but recommend the brain cherry-pick
this exact 3-file USA restoration as its own minimal, zero-risk fix
(essentially replaying whatever fixed JPN, onto USA) so all four lanes'
USA gates unblock at once.

## Queue correction — brief 523's named MED-tier examples were already parked

The brief named rows 4/9/10/11/12 (`021b28f4` ov016, `021ca518`/`021cab6c`
ov006, `021b4f1c` ov019, `021ceebc` ov011) as the lane's candidates. **All
five were already attempted and PARK: avalanche'd by brief 519** two rounds
earlier (see `brief-519-cmatch-ov-w7.md`) — `safe-queue-v3.md`'s `status:
carried` bookkeeping hadn't been updated to reflect that outcome. Verified
by checking each file is still `.s` (expected either way) cross-referenced
against 519's own per-candidate result table, not just re-attempting them
blind. **Pivoted to the RETRIAGE-tier rows for my modules instead** (brief
519 explicitly skipped all RETRIAGE overlay rows), which is where this
wave's 2 matches came from.

## Match notes

**`func_ov006_021b8d9c`** (card sort-key → stride-bitmask-table bit test).
First draft (flattened `table[key*2+word_idx]` 1D indexing) reproduced the
correct VALUE but scheduled 2 fewer/reordered instructions than the
original — the original computes `key*8` and `word_idx*4` as two
**separate** scaled offsets against the same base (`add r0,ip,r0,lsl#3`
then `ldr r0,[r0,r3,lsl#2]`), not one combined index. Rewriting as a
genuine 2D array access (`((int(*)[2])table)[key][word_idx]`) reproduced
that exact two-step addressing and closed the diff to 0 — same shape as
Recipe 1 in the catalog but for a *row-stride* array, not accumulator
order.

**`func_ov022_021ab460`** (`Ov022_DispatchPhase`, per the KB — audio-phase
fn-ptr stepper). First draft's null-check-then-fallthrough (`if(fn==0)
return 1; ...; return 0;`) compiled to conditional-execution (`moveq`/
`popeq`), 4 bytes shorter than the original's explicit branch-to-trailing-
block shape. Restructuring as `if (fn != 0) { ...; return 0; } return 1;`
(null case as the trailing fallthrough, not an early guard) reproduced the
original's exact branch structure and closed the diff to 0. The dossier's
own sibling recipe (`func_ov001_021ca2f8`, a peer candidate in a different
module, also unmatched) uses this same nested-if shape — worth carrying
forward as the default template for this whole fn-ptr-stepper family.

## Key finding — data-symbol port gap blocks both matches

`port_to_region.py --dry-run` resolved every **function** symbol at HIGH
confidence for both matches, but the **data globals** both functions
reference resolved to `NONE` for USA and/or JPN:

- `021b8d9c` → `data_ov006_0224f3e0`: NONE for USA (JPN not reached —
  refused on USA first). Tool's own note: *"no usa/ov006 data symbol at
  0x0224f3e0 (parallel-reloc map didn't cover this address)."*
- `021ab460` → `data_ov022_021ab9bc`: NONE for **both** USA and JPN. The
  sibling main-arm9 global (`data_021040ac`) in the same function resolved
  fine (`EXACT_ADDR`) — only the overlay-local, newly-discovered fn-ptr
  table is unmapped.

Both dossiers independently flag their data dependency as a **"NEW
undocumented global"** — these are globals that only became visible once
retriage read the `.s` body closely; they were never referenced by name
from any C before, so `port_to_region.py`'s region-sibling map (built from
symbols that already have USA/JPN names) has no entry for them yet. I did
**not** hand-guess a shifted address to force the port through — a wrong
guess would either fail sha1 (safe but wastes a build) or, worse, is the
kind of unverified shortcut the containment/port discipline exists to
prevent. Manually cross-checking nearby ov006 BSS symbol pairs showed the
region shift is **not uniform even within one overlay** (adjacent symbols
differed by 0x2a0 vs 0x2a4), confirming a hand-derived guess would be
unreliable, not just slower.

**This is likely a systemic gap for the RETRIAGE tier specifically** — its
whole value proposition is surfacing structs/globals no prior pass named,
which is exactly the population `port_to_region.py`'s sibling map hasn't
caught up to. Future RETRIAGE-tier waves in any module should expect this;
flagging for the brain as a possible `port_to_region.py` improvement (e.g.
a fallback consensus search scoped to the *overlay's own* BSS ordering
rather than requiring a pre-existing named sibling).

**Resolution this wave:** shipped EUR-only. This does not regress USA/JPN
— both keep their own unaffected, already-passing `.s` for these exact
address ranges (region sources are physically separate files; my EUR-only
`.c` change touches nothing outside `config/eur/...` and
`src/overlay0{06,22}/...`). Final gate is still the full 3-region `ninja
sha1`.

## Candidates tried and parked

| addr | module | size | result | reason |
|---|---|---:|---|---|
| `021b79ac` | ov006 | 116B | avalanche-free, near-miss | Contained; value-correct but a 2-register role swap (dst/table base) resisted 4 reordering attempts — genuine reg-alloc near-miss, not a logic error. Left as `.s`. |
| `021ac91c` | ov005 | 104B | avalanche-free, near-miss | Contained; nested-loop logic fully correct (nailed the exact instruction-position match after fixing an extra register spill), but a 2-role register swap (row-counter vs the two loop indices) persisted across 5 attempts. Left as `.s`. |
| `021ac098` | ov000 | 172B | not attempted | 6-way branch classifier depending on `func_ov000_021abe64` (itself unmatched); deprioritized in favor of smaller/cleaner candidates given wave time budget. |

Both near-misses are semantically 100% correct (confirmed via manual
instruction-by-instruction disassembly comparison) — purely mwcc register-
allocator tie-breaking that surface-level C restructuring couldn't shift.
Worth a permuter pass or a fresh pair of eyes with more reshape-catalog
levers; not re-grinding further this wave.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

🤖 Generated with [Claude Code](https://claude.com/claude-code)
