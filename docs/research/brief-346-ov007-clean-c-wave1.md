[//]: # (markdownlint-disable MD013 MD041)

# Brief 346 — ov007 clean-C wave 1 (low-yield flag disproven; +1 new lever)

**Brief:** 346 (decomper, Windows lane). Pivot to ov007 (16 funcs `<0x100`).
Survey by symbols.txt sizes; verify clone families by reading seeds. Reshape
register-CHOICE inline; catalogue the recurring Mac-lane shapes and note WHICH
recur (Mac-phase dedup worklist). Target ~6; flag if thin. (Scaffolder's on
ov013.)

## Headline — 6 matched (at target); the "low-yield" flag was pessimistic

**6 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** An early
survey flagged ov007 as low-yield, but the open/teardown/init call-wrapper
subset matched cleanly (4 of 6 first-try). No clone families (all 16 `<0x100`
funcs have unique sizes), yet the recipe library carried the wave to target.

## The 6 picks

| func | size | shape | recipe |
|---|---|---|---|
| `021b2d0c` | 0x30 | control-block init | open file + reset cursor |
| `021b24a4` | 0x3c | overlay teardown call-chain | — (first try) |
| `021b24e0` | 0x80 | overlay shutdown; `(a&&b)` + MMIO | **orr-shifted-operand-first** lever |
| `021b2920` | 0x7c | sub-screen BG3 bring-up | volatile BGCNT RMW + VRAM/palette |
| `021b2b74` | 0xd0 | cell-config setter (7× `func_020216b0`) | ldrsh descriptor fields |
| `021b2c58` | 0x90 | cell open (table + fn-ptr bind + colour pack) | **`(unsigned char)x << 8`** lever |

## Levers (one re-proven cross-agent, one new)

- **orr-shifted-operand-first** (`021b24e0`, 90.6→100): for `*p = A | (B << 1)`,
  write `(B << 1) | A` so mwcc puts the un-shifted operand in the `orr` rd-reuse
  slot. Independently found by the scaffolder on ov009 `021ad6bc` — same value,
  two agents, same fix. Solid.
- **NEW — `(unsigned char)x << k` forces the explicit mask** (`021b2c58`,
  94.4→100): under a `(u16)` cast, `(a3 & 0xff) << 8` folds to `lsl#24; lsr#16`
  (mwcc knows the result is truncated). Casting the byte field — `(unsigned
  char)a3 << 8` — forces the orig's `and #0xff; lsl#8`. Explicit `& 0xff`, named
  temps, and OR-into-temp all failed; only the char cast worked.

## Mac-phase dedup worklist — the recurring shapes (one fix clears many sites)

ov007's residue is the same Mac-lane shapes seen overlay after overlay. Routing
these to the Mac permuter as *shapes* (not per-site) is the high-value play:

| shape | ov007 | also at | count |
|---|---|---|---|
| script-step dispatcher post-blx increment rotation | `021b2280` | ov017 `021b2c8c`, ov019 `021b26d0`, ov014 `021b26ec` | **4 overlays** |
| switch-discriminant r0/r1 (state machine) | `021b25a0` | ov017 `021b33dc`, ov014 `021b2eec` | **3 overlays** |
| BGCNT bit-manip caller-saved field-reg dance | `021b28c4` | ov014 `021b4810`/`021b41b8` | 3 overlays |
| caller-saved address-computation reg swap | `021b2e84` (83%) | (general) | — |

The dispatcher rotation is now in **four** overlays — the single highest-value
Mac fix. The switch-discriminant is in three.

## Recommendation

ov007 met target (6) despite the low-yield flag — the call-wrapper / init /
teardown / cell-config subset is productive even without clone families. Pivot
the next clean-C wave to another fresh overlay. For the Mac phase, dedup by
shape: the dispatcher rotation (4 sites) and switch-discriminant (3 sites) are
single fixes that clear many functions at once.
