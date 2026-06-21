# Brief 469 — USA/JPN `.s` mechanical drain, wave 2 (two asm_escape/batch_carve fixes)

**Decomper, brief 469.** Scaling the b467 pilot surfaced **two correctness bugs**
in the drain tooling that were silently capping the clean rate and (worse) one
that could re-queue already-delinked symbols. Both are now fixed; the fixes are
the headline deliverable of this wave.

## Ships

- **USA main `.s`: 187 committed** on this branch (135 from b467 + 52 from b469
  waves 1–3, all `[auto, usa sha1 OK]`). Final `ninja sha1` (USA) **green**.
- A speculative wave-4 "salvage" of 11 carves (driver died mid-gate, never
  link-confirmed) was committed then **reverted** — one of the 11 broke the
  USA link (deterministic SHA1 mismatch). Lesson: never trust a batch_carve
  batch whose own gate didn't run to completion; the per-batch `ninja sha1` is
  the only proof. Reverted cleanly; 187 is the solid floor.

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

## Wine dual-lane contention (unchanged blocker, mitigation partial)

The b469 `fcntl.flock` gate-lock in `batch_carve.py` serialises **new-code**
EUR+USA lanes, but the scaffolder ran **old code** (no lock) for this wave, so
the GPTK wineserver `mwldarm.exe` deadlock still bit: concurrent EUR ov002 +
USA main gates each took 3–5 min or hung, and the wave-4 driver was killed
mid-gate by it. Operational note for the brain: **once the scaffolder restarts
on post-b469 code, both lanes honour the lock and the deadlock closes.** Until
then, the decomper lane must grab clear windows (run a USA wave only while no
EUR `ninja sha1` is live) — which is what produced the 187 floor here.

## Runway (unchanged from b467/b469-w1 census)

- USA main: ~2,850 funcs remain (the two fixes meaningfully raise the *clean*
  fraction of these — the thunk/legacy cohort is no longer parked).
- JPN main: ~3,065 funcs (untouched this wave; same recipe, `--version jpn
  --srcdir src/jpn/main --min-addr 0x02000000`).
- USA/JPN overlays (non-ov002): ov004 166, ov011 103, ov000 86, ov008 72,
  ov010 64 candidates (USA dry-run), JPN ≈ equal.

## Recommendation for the brain

Re-run the USA/JPN main drain at scale **on post-b469 code in both lanes** (lock
active) — the two fixes should lift the steady-state clean rate well above the
b467 90–98 %. The tooling, not the codegen, was the cap this wave.
