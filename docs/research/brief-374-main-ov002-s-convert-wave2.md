[//]: # (markdownlint-disable MD013 MD041)

# Brief 374 — main reg-alloc → `.s`, wave 2 (Windows lane)

**Brief:** 374 (scaffolder). Continue the main + ov002 `.s`-bound backlog from
wave 1 (#894, 8 main ships). Take the next batch of the LOW/plateau (reg-alloc)
tier from `docs/research/permuter-worklist.md`, `asm_escape --whole-function`
each, gate on 3-region `ninja sha1`. Target ~8.

## Headline — 8 more main reg-alloc walls `.s`-shipped, 3-region `ninja sha1` green

Wave 1 drained the worklist's *explicitly-listed* main TIER-3 rows, so wave 2
re-harvested the main "walls routed out" sections of waves 2–6 (briefs
351/353/355/357/359), kept the **reg-alloc / dispatch / predicate** walls (the
ones that resisted all three compiler tiers), and left the commutative / peephole
/ scheduling walls for the permuter. **8 byte-exact `.s`, all link-clean.**

## The 8 ships (by class)

| addr | size | class | source |
|---|---|---|---|
| `02064d88` | 0x28 | caller-saved reg choice (`p` in r1 vs orig r2; LL-mul high-word) | brief 353 |
| `0201f68c` | 0x34 | reg-choice | brief 359 |
| `0201be64` | 0x34 | reg-choice | brief 359 |
| `02034810` | 0x34 | switch cmp-chain (15v13) | brief 359 |
| `02084a9c` | 0x28 | guarded `blx` field-fnptr + bit-op | brief 351 |
| `02084ac4` | 0x28 | guarded `blx` field-fnptr + bit-op (sibling, adjacent) | brief 351 |
| `0203cb90` | 0x30 | range + jump-table (14v11) | brief 357 |
| `020908c0` | 0x30 | predicated table-set | brief 359 |

All 8: `asm_escape --whole-function` → `✅ byte-identical vs delinked .o`. Two
reference a `data_` extern (`0201f68c`→`data_021922e0`, `0203cb90`→`data_0219d9c8`)
— both **`kind:bss`**, which links (brief 361's data-reloc false-pass risk is only
for non-bss `kind:data` symbols; none here). The other 6 are bl-reloc-clean.

## Tooling — now turnkey (no PATH stopgap)

The decomper's 371 (#895) landed the binutils-PATH auto-resolve, so
`asm_escape.py` finds `arm-none-eabi-objdump` without a manual `PATH` export —
confirmed: a no-PATH run worked first try. (binutils itself is the gitignored
on-demand `tools/arm-none-eabi/bin` from wave 1.)

## Two asm_escape translation failures (deferred, not mine to fix here)

`02004fb8` (7-arg stack shuffle) emitted a `.s` that **did not assemble**;
`02022580` / `0225a51c` / `02037b04` emitted a `.s` that **did not byte-verify**.
These are `asm_escape` objdump→mwasm translation gaps (complex addressing / pool
rendering), not link issues — flagged for a tool fix, skipped this wave.

## ov002 — deliberately left to the decomper

The brief lists ov002 in scope, but probing it showed its reg-alloc tier is
**already drained or out-of-lane**:

- The reg-mirror / mirror-twin walls (`0220cff8`, `0220cf0c`, `0223b3cc`,
  `02257594`, `022576d8`, `02273b1c`, `022abf88`, …) are **already `.s`-shipped**
  (decomper's 358 routing pass + 369) — `asm_escape` reports "not found in
  delinks (already matched)".
- The remaining uncarved ov002 I could verify (`0223a3b0`, `02211934`,
  `021d81d4`, `021d90c0`, `021df62c`) are **all arg-pack-family callers**
  (they call the `021d479c` sink; `0223a3b0` has the byte-pack shape). 358
  explicitly left the non-byte-pack arg-pack callers for a **future clean-C drain
  wave** — `.s`-converting them would foreclose the clean C and step on the
  decomper's active ov002 lane.

So wave 2 is **main-only**; ov002's residue stays with the decomper, per the
"leave overlays to the decomper" spirit of the lane split.

## Gate — 3-region `ninja sha1`

| region | result | why |
|---|:---:|---|
| EUR | **OK** | the 8 `.s` link clean, ROM byte-identical |
| USA | **OK (unaffected)** | `src/main/*.s` is EUR-only (`_is_region_source_excluded` → `region != "eur"`); USA delinks untouched |
| JPN | **OK (unaffected)** | same |

## Files

`src/main/` +8 `.s`; EUR `arm9/delinks.txt` +8 `complete .text`. No USA/JPN
change. Running total of main reg-alloc `.s` ships: wave 1 (8) + wave 2 (8) = 16.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
