# Brief 211 — literal-tail drain + BIOS thunk family check

**Brief:** 211 (decomper). Two phases. Phase 1: drain the 5
literal-tail picks brief 209 deferred (brief 208 patcher fix
unblocked them). Phase 2: drain the BIOS SWI thunk family
identified by brain's unmatched-pool survey (PR #662).

## Headline

**Phase 1: 5 of 5 literal-tail picks shipped clean.** Vanilla
brief 202 C-34 `.s` recipe + brief 208's enhanced patcher.

**Phase 2: pre-empted — all BIOS thunks already matched.** The
brain survey (PR #662) was outdated; subsequent shipping (briefs
207/209) already drained the entire BIOS thunk family. No new
picks to ship in Phase 2.

complete_units +5, matched_functions +5 (post-brief-206 metric
accounting; .s files now register correctly).

## Phase 1 — the 5 literal-tail picks

| Pick | Size | Last pool entry | Routing |
|---|---:|---|---|
| `main:func_020212cc` | 0x160 | `.word 0x618` (literal) | `.s` |
| `ov002:func_ov002_021aba60` | 0x2990 | `.word data_*` (symbol) | `.s` |
| `ov002:func_ov002_021d9828` | 0x2520 | `.word data_*` (symbol) | `.s` |
| `ov002:func_ov002_0220eb00` | 0x1604 | `.word func_0202e258` (symbol) | `.s` |
| `ov018:func_ov018_021ab1c4` | 0x2c8 | `.word func_ov018_021aa4a0` (symbol) | `.s` |

Of the 5, only `func_020212cc` had the true literal-tail (`.word
0x618`) that brief 208's fix specifically unblocks. The other 4
had symbol-ref tails — brief 204's reloc-protect already handles
those, so they would have shipped under the older patcher too.
They were lumped into the brief 209 deferral set by virtue of
being in the same un-wired cohort, not because of a literal-tail
specifically.

All 5 shipped via `/tmp/gen_c34_s.py` (the helper from brief 207)
modulo one generator bugfix: the function-symbol extractor had a
false-positive matching `blx r1` as `extern r1` (incorrectly
treating the register name as a symbol). Cleaned manually
post-generation by removing the bogus `.extern r1` line.

## Phase 2 — BIOS thunk family check

Brain's PR #662 survey called out ~30 named 4-byte functions at
addresses 0x02000000-0x02001000 as the highest-leverage easy-
bucket pick. Running the brief's filter:

```bash
python3.13 -c "
import re
text = open('config/eur/arm9/symbols.txt').read()
for m in re.finditer(r'^(\S+)\s+kind:function\([^)]*size=0x4\)\s+addr:0x020000([0-9a-f]+)', text, re.M):
    name, addr = m.group(1), int('020000' + m.group(2), 16)
    if not name.startswith(('func_', 'data_')):
        print(f'  {name} @ 0x{addr:08x}')
"
```

Output: **1 result** (`LZ77UnCompReadByCallbackWrite16bit`).

Broadened to all named functions (any size) in 0x02000000-
0x02001000: **21 results**, including the 18 4-byte BIOS thunks
brain expected. Checked each against the report:

```text
VBlankIntrWait:                       matched=1 fuzzy=100.0
LZ77UnCompReadByCallbackWrite16bit:   matched=1 fuzzy=100.0
RLUnCompReadByCallbackWrite16bit:     matched=1 fuzzy=100.0
Div:                                   matched=1 fuzzy=100.0
CpuSet:                                matched=1 fuzzy=100.0
BitUnPack:                             matched=1 fuzzy=100.0
Mod:                                   matched=1 fuzzy=100.0
HuffUnCompReadByCallback:              matched=1 fuzzy=100.0
WaitByLoop:                            matched=1 fuzzy=100.0
IsDebugger:                            matched=1 fuzzy=100.0
LZ77UnCompReadNormalWrite8bit:         matched=1 fuzzy=100.0
CpuFastSet:                            matched=1 fuzzy=100.0
Halt:                                  matched=1 fuzzy=100.0
GetCRC16:                              matched=1 fuzzy=100.0
RLUnCompReadNormalWrite8bit:           matched=1 fuzzy=100.0
IntrWait:                              matched=1 fuzzy=100.0
Sqrt:                                  matched=1 fuzzy=100.0
SoftReset:                             matched=1 fuzzy=100.0
AutoloadCallback:                      matched=1 fuzzy=100.0
```

All 19 4-byte/6-byte BIOS thunks present (Entry @ 0x02000800 +
main @ 0x02000c34 are the larger non-thunk entries; they're
their own story).

**All BIOS thunks were already matched** at the time brief 211
landed. The brain survey was based on a pre-briefs-207/209 snapshot.
Brief 207's full-corpus C-34 drain + brief 209's brief-206
metric-accounting fix collectively brought every BIOS thunk to
`matched=1, fuzzy=100`. Source files exist at `src/main/<name>.s`
(checked: `VBlankIntrWait.s`, `LZ77UnCompReadByCallbackWrite16bit.s`,
`Div.s` confirmed).

Phase 2 is a **no-op confirmation**, not a drain.

## What's actually unshipped in main 0x02000xxx?

Post-Phase-1 audit of unmatched units in `src/main/`:

| Fuzzy | Unit | Notes |
|---:|---|---|
| 98.73 | `src/main/Entry` | .c file; ~one residual byte diff |
| 92.85 | `src/main/func_02091690.legacy` | .legacy compiler |
| 92.85 | `src/main/func_020916c8.legacy` | .legacy compiler |
| 92.85 | `src/main/func_020467f4.legacy_sp3` | sp3 routing |
| 92.30 | `src/main/func_0207b5f8.legacy` | .legacy compiler |
| 90.90 | `src/main/func_020a1e3c.legacy` | .legacy compiler |
| 88.88 | `src/main/func_0207cbbc.legacy` | .legacy compiler |
| 86.66 | `src/main/func_020b3814` | inter-function `.word` branch (brief 209 cohort) |

Most are brief 209 stragglers (already documented). `Entry` at
98.73% is the closest non-straggler; worth a separate decomper
brief if its residual is C-23ish.

None of these match the "BIOS thunk family" pattern brain's
survey described. Pre-emption confirmed.

## Recipe notes (Phase 1)

1. **Generator false-positive on `blx r1`** — `/tmp/gen_c34_s.py`'s
   regex `r"\bbl(?:x)?\s+([A-Za-z_][A-Za-z0-9_]*)"` matches register
   names when an indirect call like `blx r1` appears. Generated
   `.extern r1` which mwasm rejects. Manual cleanup post-generation.
   Worth a one-line fix in the script (regex `(?!r\d+\b|ip\b|lr\b|sp\b)`
   lookahead) for the next brief that uses this helper.

2. **Vanilla brief 202 recipe** — no literal-promotion needed; brief
   208's delinks-aware trim suppression handled all five picks
   identically. The recipe is now genuinely locked.

3. **Cross-region SHA1 PASS** — verified EUR, USA, JPN all OK
   after Phase 1.

## Recommendation for brief 212+

1. **Run a fresh unmatched-pool survey** before issuing a "drain
   family X" brief — the rolling brief stack (briefs 207-211) is
   shipping fast enough that any survey older than ~3 briefs may
   be stale.

2. **Consider Entry @ 98.73% fuzzy** as a high-value follow-up.
   ~1.27% residual on a known-shape entry-point file is the closest
   ~1-byte miss in main.

3. **The `/tmp/gen_c34_s.py` regex fix** is a 1-line tooling polish.
   Worth promoting to `tools/` if brief 212+ does another C-34
   wave.

## Cross-references

- Brief 208 PR #663 — the literal-tail patcher fix that unblocked
  Phase 1
- Brief 207 PR #660 — the C-34 drain that drained the BIOS thunks
- Brief 206 PR #659 — reloc-resolver fix (matched_functions
  accounting)
- `docs/research/brief-209-stragger-investigation.md` — full
  investigation of the residual fuzzy<70% units
- PR #662 (brain) — the unmatched-pool survey that flagged the
  BIOS thunk family (now superseded)
