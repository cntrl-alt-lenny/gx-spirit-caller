[//]: # (markdownlint-disable MD013 MD041)

# Brief 439 — region port, wave 9 — main `.c` clean-port lane DRAINED (phase boundary)

**Brief:** 439 (decomper). Wave 9 of the USA/JPN region-port lane (briefs 421
scout, 423–437). The brain asked to flag — with a rough count — when JPN's
clean + MEDIUM tier thins, as the cue to plan the next phase. **This is that
flag.** Mechanism: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **16 JPN (MEDIUM) + 0 USA** = 16 `.c` ports this wave, gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`**.
- **🚩 THINNING FLAG: the main `.c` clean+MEDIUM region-port lane is DRAINED for
  both regions.** USA mop-up yielded 0 of 58; JPN MEDIUM yielded only 16 of 75.
  Lane totals: **USA 330, JPN 330 (660 total, briefs 421-439).**

## What's left on `main` (the rough count the brain asked for)

After this wave, the un-ported EUR `main` `.c` funcs split cleanly into three
buckets:

| Bucket | USA | JPN | Nature | Path forward |
|--------|----:|----:|--------|--------------|
| **SDK-name-blocked** | 47 | 47 | byte-portable; only call `Fill32`/`OS_RestoreIrq`, which are *named* in EUR but address-named in-region → undefined symbol | **alias 2 symbols × 2 regions** → unblocks all 94 |
| **sub-LOW / mismatch** | 14 | 14 | a called symbol won't resolve even at MEDIUM, or a duplicate-shape mismatch | marginal; mostly leave |
| **divergent (`sim < 1.000`)** | 283 | 283 | source genuinely differs between EUR and region (the `-244`/0xf4 drift band + region-specific code) | **real per-region decomp** — not portable |

(The `.c` numbers; the full `main` divergent set incl. `.s`-matched funcs is
~881/region per the brief-421 scout.)

## Next phase — the easy-port lane isn't dead, it MOVED

Straight `main` `.c` porting is essentially done, but two **easy-port (gate-safe,
mechanical)** continuations remain before we reach the genuinely-hard residue:

1. **SDK-name alias** (94 funcs). The code is byte-portable; only the symbol name
   is missing. A verified `Fill32`/`OS_RestoreIrq` alias in each region's
   `symbols.txt` unblocks all 94 at once (+ every future SDK-leaf caller). Their
   `find_region_siblings` confidence is LOW (tiny 0x14/0x18 leaves) so it needs a
   careful by-hand map, but it's only 2 symbols × 2 regions, sha1-validated.
2. **Overlay region-port pivot** (large, untouched). The brief-421 scout found
   the overlay pools **mostly port-clean** (e.g. ov002 1299/1375, ov004 243/276,
   ov011 171/193). `port_to_region` works on overlay `.c` the same way (output to
   `src/<region>/overlayNNN/`, delinks in `config/<region>/.../ovNNN/`). This is
   the **biggest remaining easy-port lane** — likely many hundreds of clean ports.

The **genuinely-hard tail** is the 283/region divergent `main` `.c` (real
per-region decomp) — defer it, or redirect that effort to EUR-module decomp (the
`.s`/clean-C backlog), per the brain's note.

**Recommendation:** next phase = **overlay region-port pivot** (bulk easy-port
volume) **+ the SDK-name alias** (94 quick main wins). Hold the divergent-`main`
decomp for a deliberate later brief.

## MEDIUM health

Cumulative MEDIUM across waves 6-9: **145/146 byte-identical** (one gate-caught
wrong-sibling at wave 7). Safe because every wave is sha1-gated.

## Method / validation

JPN MEDIUM + USA MEDIUM mop-up. Both delinks `sort_delinks.py`-canonicalised;
static collision scan clean; `KNOWN_BAD_OUTPUTS` held; proactive MD018 doc sweep.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
