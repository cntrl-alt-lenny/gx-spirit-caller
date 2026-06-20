[//]: # (markdownlint-disable MD013 MD041)

# Brief 459 — region-port wave 12 — cleanup ports + porter bug fixes

**Brief:** 459 (decomper). Wave 12 of the USA/JPN region-port lane. Continues
`port_to_region.py` across remaining portable overlay funcs after wave 11 (b455)
covered 21 overlays.

## Result

- **10 USA + 10 JPN `.c` ports** (20 total) across 5 overlays: ov000/010/011/012/013.
- **2 porter bugs found and fixed** in `build/_port_overlay.py` — both were
  write-failed parks in previous waves that this wave finally resolved.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`.**

## Per-overlay port / park

| Overlay | ports | parked (no-sibling) | notes |
|---------|------:|--------------------:|-------|
| ov000   | 1     | 25 (no-sibling) + 1 (divergent) | 1 was write-failed in b455 |
| ov010   | 3     | 8                               | all 3 were write-failed in b455 |
| ov011   | 4     | 11                              | all 4 were write-failed in b455 |
| ov012   | 1     | 0                               | 1 was write-failed in b455 |
| ov013   | 1     | 1                               | clean ship |

All other overlays (ov001–009, ov014–022) showed 0 new ports — their candidates
are fully processed (already-ported or no-sibling).

## Why this wave is small

Wave 11 (b455) was the big sweep — 582/region across 21 new overlays. Wave 12
captures two classes of residual:

1. **Recently added EUR `.c` files** — the decomper added new `.c` files to
   ov010/011/012/013 between b455 and now (wave 1 clean-C work from briefs 308–322).
   These were not in b455's "already-ported" set because they existed before b455.
   
   Wait — actually re-analysis: ALL of these ov010/011 files existed in the EUR
   source tree before b455. The b455 porter found them as `clean ports: 3/4` but
   then they all hit `write-failed`. This wave FIXED the bugs that caused the
   write-failures.

2. **Porter bugs fixed (the real story):** The 10 ports here are not new EUR
   source; they're b455 `write-failed` ports that now succeed after two fixes.

## Porter bug fixes (both in `build/_port_overlay.py`)

### Fix 1: `overlays(5,9)` plural form in `_norm_mod`

**Root cause:** dsd's reloc table sometimes uses `overlay(N)` (singular) and
sometimes `overlays(N,M,...)` (plural, for overlay-swap groups). The `_norm_mod`
helper only handled the singular form, so `overlays(5,9)` remained as-is in the
amap key. When the source referenced `func_ov005_021ab32c`, the parsed ref had
module `"ov005"` but the amap key was `("overlays(5,9)", 0x021ab32c)` — lookup
failed → fell through to raw-addr check → no `0x021ab32c` literal in source →
write-failed park.

**Fix:** Extend `_norm_mod` to handle the plural form by taking the first overlay:
```python
mm2 = re.match(r"overlays\(([\d,]+)\)", m)
if mm2:
    return f"ov{int(mm2.group(1).split(',')[0]):03d}"
```

Affected: `func_ov010_021b4090` and `func_ov010_021b6868` (which call
`func_ov005_021ab32c`, in the overlays(5,9) swap zone).

### Fix 2: `_unk` suffix symbols invisible to SYMBOL_RE

**Root cause:** dsd generates `func_ov000_021b3810_unk` (size=0, unknown) for
cross-overlay calls from overlays where the target overlay isn't loaded. The
`SYMBOL_RE` in port_to_region.py uses `\b` word boundary, which does NOT fire
between the hex address and `_unk` (both are `\w` characters). So
`func_ov000_021b3810_unk` wasn't parsed as a symbol reference → the EUR address
0x021b3810 wasn't in `sym_addr_keys` → the amap divergent-addr check tried raw
literals → not found → write-failed park.

**Fix:** In the raw-addr fallback section, after exhausting literal forms, also
check for the `_unk` suffix pattern and substitute:
```python
mod_prefix = f"_{mod}" if mod != "main" else ""
for kind in ("func", "data"):
    unk_eur = f"{kind}{mod_prefix}_{ea:08x}_unk"
    if unk_eur in source_text:
        sub_map[unk_eur] = f"{kind}{mod_prefix}_{ra:08x}_unk"
        unk_found = True
```

Affected: `func_ov012_021cbeb4` (calls `func_ov000_021b3810_unk` = a dsd
placeholder for an ov000 function that hasn't been named yet).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`.**

The `_port_overlay.py` fixes are gitignored build-dir scripts — banked here for
future reference if the script is reset or re-run.

## Runway

The mechanical ARM-function overlay port lane is now essentially exhausted:
- All 22 in-use overlays (ov000–ov021) have been processed
- Remaining "no-sibling" parks are genuinely region-divergent (different layouts)
- The next new ports require: (a) new EUR `.c` files from decomper/scaffolder
  work on ov010/011/012/013/etc., or (b) the Thumb `.c` overlay port lane
  (ov004 has 36 `.thumb.c` files not yet attempted for USA/JPN)
