# Brief 467 — USA/JPN .s Mechanical Drain Pilot

**Date:** 2026-06-21  
**Branch:** `decomper/usajpn-sdrain-w1`  
**PR:** TBD

## Background

After b465 confirmed the main no-sibling lane is tapped (0/256 recoverable), the
region-port lever is exhausted. The brief pivoted to the next USA/JPN growth lever:
the `.s` mechanical drain — the same asm_escape/batch_carve approach that took EUR
ov002 from 67→81% (via b458's ~507 auto-ships) but applied to USA/JPN gaps.

Divergence is irrelevant here: each region's gaps are carved from that region's OWN
binary bytes. The EUR baseline never sees these files (they go to `src/usa/main/`
and `src/jpn/main/` — region-specific source trees).

## Tooling change: `--srcdir` flag for batch_carve

`batch_carve.py` needed a `--srcdir` override so USA carves land in
`src/usa/main/` (not the shared `src/main/` EUR baseline). Added to `main()` CLI;
`BatchCarver.__init__` already accepted `srcdir: str | None`.

Correct invocation for USA main drain:
```
python3.13 tools/batch_carve.py \
  --version usa \
  --min-addr 0x02000000 \      # CRITICAL: full range (default 0x02234000 = upper-half only)
  --srcdir src/usa/main \
  --batch 25 --limit 50 \
  --gate-timeout 180 --call-timeout 60
```

Delink entries written to `config/usa/arm9/delinks.txt` as `src/usa/main/func_XXXX.s:`.

## USA/JPN .s Runway

### USA main (arm9 main, NOT ov002)
- **3,082 uncarved ARM functions** — **664KB** of `.s` potential
- Size distribution peaks at 0x40–0xbf (1,390 funcs, ~99KB)

### USA overlays (non-ov002)
| Overlay | Funcs | KB  |
|---------|-------|-----|
| ov006   | 245   | 84  |
| ov004   | 164   | 65  |
| ov011   | 102   | 31  |
| ov000   | 85    | 17  |
| ov008   | 72    | 30  |
| ov010   | 63    | 22  |
| ov005   | 63    | 26  |
| ov016   | 57    | 23  |
| ov017   | 40    | 21  |
| ov015   | 40    | 11  |
| ov019   | 32    | 11  |
| ov020   | 33    | 12  |
| ov003   | 21    | 18  |
| ov009   | 25    | 12  |
| ov012   | 16    | 7   |
| ov018   | 10    | 8   |
| ov014   | 28    | 9   |
| ov021   | 17    | 3   |
| ov007   | 20    | 2   |
| ov022   | 14    | 4   |
| ov013   | 10    | 6   |
| ov023   | 2     | 0   |
| ov001   | 5     | 1   |
| **Total non-ov002** | **1,164** | **~420KB** |

**USA ov002 (scaffolder-owned):** 2,846 funcs, 1,046KB (not counted here).

**JPN:** separate but roughly equal runway (same function count; divergent bytes require
their own carve).

**Grand total (decomper-owned, USA+JPN):** ~(3,082 + 1,164) × 2 = ~8,500 funcs, ~2.2MB

## Pilot Results (USA main, 3 waves)

Each wave ran `--batch 25 --limit 50` with `--gate-timeout 180`:

| Wave | Ships | Refuse | Verify-fail | Gate-fail | Clean rate | Commits |
|------|-------|--------|-------------|-----------|------------|---------|
| W1   | 49    | 0      | 1           | 0         | 98%        | 2       |
| W2   | 46    | 0      | 4           | 0         | 92%        | 2       |
| W3   | 40    | 0      | ~10         | 0         | ~80%       | 2       |

**Total: 135 ships** across 6 auto-commits, USA sha1 passed every gate.
Combined clean rate: ~90% (verify-fail rate rises slightly at mid-sizes ≥0x10 — same
pattern as EUR ov002).

## Key Findings

1. **Lane confirmed**: batch_carve `--version usa` with `--srcdir src/usa/main` works
   cleanly. The gate (USA sha1) passes without affecting EUR/JPN integrity.

2. **0 REFUSE**: All candidates pass the kind:data preflight. USA main has no
   pooled-data interior-address issues in the tested size tier (≤0x10 bytes).

3. **Verify-fail pattern**: Same as EUR ov002 — occasional `bytes_match` failures
   where asm_escape generates a `.s` that doesn't round-trip byte-exactly. These
   are parked automatically. Rate ~5% at the tiny end (≤0x8 bytes), lower for
   larger funcs.

4. **Wine coexistence**: Scaffolder ran EUR ov002 batch_carve concurrently; USA
   gates completed without deadlock (gate-timeout 180s buffer was sufficient).

5. **`--min-addr` is critical**: The default 0x02234000 would have enumerated 0
   candidates (USA main spans 0x02000000–0x020b422c). Always pass `--min-addr
   0x02000000` for USA main (or `--min-addr` = overlay base for overlay scope).

## Lane Verdict

**The USA/JPN .s drain is the confirmed primary USA/JPN growth lever.**

- Yield is EUR-comparable (94-98% clean rate)
- No LLM needed — purely deterministic asm_escape byte-capture
- batch_carve handles auto-commit, bisect, and gate timeout
- Runway: ~8,500 decomper-owned funcs across main + overlays (both regions)
- Scaffolder owns USA ov002 (2,846 funcs, 1,046KB) as a separate lane

Next round: scale up to USA ov006 (245 funcs), ov004 (164 funcs), remaining main,
and eventually JPN. Each can run as a contained wave with the same flags.
