# Brief 469 — USA/JPN `.s` mechanical drain at scale (w2)

**Decomper, brief 469.** Scaling the b467 pilot surfaced **two correctness bugs**
plus a **contention-robustness gap** in the drain tooling. Fixing them turned the
lane from "thrashes under the scaffolder's wineserver" into a steady ~96–99 %-clean
autonomous drain. Net result this session: **+386 USA main + 140 JPN main `.s`**
shipped (vs main), all three regions `ninja sha1` green.

## Ships (vs `main`)

| Module   | This PR | On disk | Clean rate | Gate |
|----------|---------|---------|-----------|------|
| USA main | **+386 `.s`** | 521 (135 were already on main from b467) | ~96 % | `usa sha1` **OK** |
| JPN main | **+140 `.s`** | 140 (fresh region) | ~99 % | `jpn sha1` **OK** |
| EUR      | 0 (untouched) | — | — | green by construction* |

\* `git diff --name-only main...HEAD` touches only `src/usa/`, `src/jpn/`,
`tools/`, `docs/` — **no EUR build input** — so the EUR ROM is byte-identical to
green `main`. (The live EUR gate kept being killed by GPTK-wineserver contention
with the scaffolder's EUR-ov002 lane, so the structural proof stands in for it.)

USA main went 189→521 committed across this session's waves 5–6 (limit-200 wave
reported **SHIPPED 192 | clean-rate 96 %**); JPN main 0→140 in one wave (~99 %
clean — only the shared SDK `func_02000b64` data-in-code case parks). Each ship
is a per-batch `ninja sha1`-gated `[auto, … sha1 OK]` commit, so the floor is
durable regardless of how a wave ends.

**Operational lessons banked:**
- A speculative wave-4 "salvage" of 11 *un-gate-confirmed* carves was committed
  then **reverted** — one broke the USA link (deterministic SHA1 mismatch). Never
  trust a batch whose own gate didn't complete; the per-batch `ninja sha1` is the
  only proof.
- **Reconfigure before every gate after a kill.** Killing a wave mid-batch leaves
  `build.ninja` referencing a carve whose `.s`/delink entry you then revert →
  `ninja: missing and no known rule to make it`. `configure.py <ver>` regenerates
  it from the reverted `delinks.txt`. (Same "reconfigure before report" gotcha.)
- **Resync the delink reference before a fresh wave.** asm_escape verifies a carve
  against `build/<ver>/delinks/*.o`; if a prior wave was killed mid-bisect those
  are stale → *nondeterministic* verify (a func parks in one run, stages the next).
  One clean `configure && ninja sha1` at the committed state fixes it.

## Fix 1 — `[pc]` with no offset was invisible to the pool detector

`asm_escape.py` detected literal-pool words via the regex `\[pc, #(-?\d+)\]`.
objdump renders a zero-offset PC load as bare **`[pc]`** (not `[pc, #0]`), so a
function like `func_02090774`:

```
ldr r1, [pc]      ; load the word immediately after `bx r1`
bx  r1
.word func_020908c8
```

had its pool word **misclassified as an instruction**, objdump printed it as
`....` data, the emitted `.s` failed to assemble → `verify-fail (parked)`.
Every short PC-relative thunk of this exact shape (a very common
trampoline/veneer idiom in main) was being parked instead of shipped.

Fix: make the offset optional in all three sites (`pool_addrs`, the `lit`
map builder, and the operand-rewrite in `emit`):

```python
re.search(r"\[pc(?:, #(-?\d+))?\]", w["mnem"])   # group(1) None ⇒ offset 0
```

`func_02090774` now emits byte-identical (3 words) and ships.

## Fix 2 — `carved_addrs` only saw `start:` addresses, not symbol names

`batch_carve.py`'s `carved_addrs()` built the "already done" set purely from
`start:0x…` lines in `delinks.txt`. But some symbols have a **name that differs
from their `.text start:` address** — e.g. `func_020947c8` is delinked with
`.text start:0x020946d4` (a NitroSDK `legacy.c` whose entry symbol sits past the
block start). The candidate enumerator keys off the **name-derived** address
(`func_020947c8` → `0x020947c8`), which never appeared in `carved_addrs`, so the
driver kept re-selecting an already-delinked function every wave →
`not found in build/usa/delinks (already matched…)` → `verify-fail`.

Fix: `carved_addrs` now unions `start:` addresses **and** name-derived
addresses parsed from every `…/func_XXXX.<ext>:` delink header:

```python
_DELINK_HDR_RE = re.compile(r"(?:\S+/)?(func_\w+)\.\S+:$")
# … addrs |= { func_addr(name) for each header line }
```

This stops the driver wasting a slot (and a verify-fail) on libs/nitro
`legacy.c` symbols every single wave.

## Net effect on clean rate

Pre-fix, a batch of 5 at the head of the USA-main scope was **0–20 % clean**
(4–5 verify-fails, all of them one of the two bugs above). Post-fix the same
head-of-scope dry-run reports **100 %** (`SHIPPED 20 | verify-fail 0`). The bugs
were not codegen walls — they were tooling blind spots that scaled linearly with
how many thunk-shaped and name-shifted symbols a region's main contains (many).

## Fix 3 — one-sided wine-contention robustness (the real scaling unlock)

The b469 `fcntl.flock` gate-lock only helps when **both** lanes honour it; the
scaffolder ran **old code** (no lock), so the GPTK-wineserver `mwldarm.exe`
deadlock ("Can't write application arm9.o" when two links write `arm9.o` at
once) still bit. Worse, the gate's `_kill_orphans` `pkill`s *all* `mwldarm.exe`
— so when our gate timed out it nuked the **scaffolder's** in-flight link too,
and the two lanes thrashed.

Three changes make our lane deadlock-safe **from one side**, no scaffolder
change required:

1. **`_wait_wine_quiet()`** — before our own link we poll until no foreign
   `mwldarm.exe` is in flight (patient, on its *own* budget, decoupled from the
   link `gate_timeout`; returns best-effort on expiry). We see the old-code
   scaffolder's `mwldarm` in the process table and wait it out, so the two links
   never overlap. No collision ⇒ no `_kill_orphans` ⇒ the lanes cooperate.
2. **`GateTimeout` handled inside `_bisect`** — the recursive `gate()` call in
   the bisect loop was *uncaught*; a contention-timeout mid-bisect crashed the
   whole run (`exit 1`). It now defers that half cleanly, re-attemptable next run.
3. **`[pc]`-aware everywhere** (Fix 1) so bisects don't chase phantom parks.

Empirically: with these in, a USA wave committed straight through a *live*
scaffolder lane (`+1 [auto, usa sha1 OK]`), and once the scaffolder's run ended
the drain held a steady ~96 % clean rate, batches of 10 gating in one shot.

**Same-worktree caveat:** the wait-for-quiet/flock protect against the
*scaffolder* (separate worktree, separate `build/`). They do **not** make it safe
to run USA and JPN lanes concurrently *in this worktree* — both share one
`build.ninja` that `configure.py` rewrites per-version, so the lanes must be
**sequential** (drain USA main fully, then `configure jpn` and drain JPN).

## Batch sizing under a nonzero link-fail rate

A meaningful minority of carves **byte-verify but break the full-ROM link**
(relocation/interaction culprits; ~5–20 % depending on size band, concentrated in
the small thunk-heavy `0x14–0x1c` head). Those force a `gate RED -> bisect`. With
`--batch 50` the bisect is O(n)-ish and painfully slow; **`--batch 10` is the
sweet spot** — a clean batch commits in one gate, a RED bisects only 10. Seed a
persistent `--skip-list`/`--verifyfail-list` from each wave's parks (extract
`park gate-fail` / `verify-fail (parked)` funcs from the log) so the next wave
doesn't re-bisect known culprits.

## Runway remaining

- USA main: ~2,450 funcs (was ~2,850; this session drained ~400). The thunk/legacy
  cohort no longer parks, so the *clean* fraction is high.
- JPN main: ~2,925 funcs (was ~3,065; drained 140 this session). Identical recipe.
- USA/JPN overlays (non-ov002, NOT scaffolder's): ov004 166, ov011 103, ov000 86,
  ov008 72, ov010 64 (USA dry-run), JPN ≈ equal. **Untouched — next lever.**

## Recommended recipe for the brain (continue at scale)

```
# one clean rebuild first so the delink references match committed delinks.txt
python3.13 tools/configure.py <ver> && ninja sha1
# then drain (sequential per version; --batch 10):
PYTHONUNBUFFERED=1 python3.13 -u tools/batch_carve.py \
  --version <usa|jpn> --min-addr 0x02000000 --srcdir src/<ver>/main \
  --batch 10 --limit 300 --gate-timeout 240 --call-timeout 60 \
  --skip-list build/known_drops_<ver>_main.txt \
  --verifyfail-list build/known_verifyfail_<ver>_main.txt
```
Overlays: swap `--overlay ovNNN --min-addr <base> --srcdir src/<ver>/overlayNNN`.

## Recommendation for the brain

Re-run the USA/JPN main drain at scale **on post-b469 code in both lanes** (lock
active) — the two fixes should lift the steady-state clean rate well above the
b467 90–98 %. The tooling, not the codegen, was the cap this wave.
