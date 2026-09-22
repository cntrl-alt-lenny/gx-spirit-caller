### decomper/main-30kb-mega-array

**Goal:** Ship `data_020b6ec4` — the 30 KB main `.rodata`
mega-array that's been the biggest deferred Pattern 1
candidate since brief 130. Single chunk; substantial byte
impact in one wave.

**Context — what's been deferred:**

`data_020b6ec4` has been listed in state.md's data-tier
backlog since brief 130's wave 4 + D-1 wave 2:

> 30 KB main mega-array (`data_020b6ec4`) — biggest deferred
> Pattern 1 candidate.

It's been carried forward through every subsequent backlog
update. Briefs 133 + 135 shipped smaller megas (5 KB, 4632
bytes); brief 163 wave 3 shipped data_020c7b44 (4.9 KB).
Now's the time for the big one.

Pool sizing:

- **`data_020b6ec4`** — main module `.rodata`, ~30 KB single
  chunk. Pattern 1 shape (likely an integer or pointer array
  per Pattern 1 mega precedent).

**Brief 165 deliverables:**

### Part 1 — Inspect + select

Before generating, inspect the mega:

1. Find the byte range — start at 0x020b6ec4, end is the
   next-named-symbol boundary in
   `config/eur/arm9/symbols.txt`. Likely ~0x020be8c4 or
   nearby (give-or-take based on actual neighbour).
2. Inspect orig bytes at the start address via
   `extract/eur/arm9/arm9.bin` to determine the array's
   element shape (4-byte word? pointer? mixed struct?).
3. Verify no cross-TU references TO inner addresses (no
   subsumed-placeholder collisions per brief 158's
   pattern). If any exist, apply brief 161's bundle-alias
   helper.

### Part 2 — Generate + claim

Use brief 144's auto-`.extern` Pattern 3 generator with
brief 159 Part 1's `--section data` (or `rodata`,
depending on detection — likely `.rodata` for a `.rodata`
mega):

```bash
python tools/cluster_c_pattern3_gen.py --version eur \
    --module main --start 0x020b6ec4 --end 0x<end_addr>
```

Add TU claim to `config/eur/arm9/delinks.txt`.

If the generator emits `.word .L_*` references (per brief
163 funnel's local-label gap finding), manually replace
with raw hex literals. Brief 166+ cloud-side will fix the
generator long-term.

### Part 3 — Verify

3-region `ninja sha1` PASS + 27/27 modules OK across EUR /
USA / JPN. Per-chunk objdiff byte-identical at the claim's
vaddr.

**Target: 1 chunk** — `data_020b6ec4` end-to-end at ≥ 20 KB
matched byte size.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
./dsd check modules -c config/eur/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/usa/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/jpn/arm9/config.yaml   # 27/27 OK
```

**Self-extend gate** (same as all decomp-tier briefs since
143): yield ≥ 40% AND bytes-matched ≥ 250.

- Yield: 1/1 = 100% if the chunk lands; 0% if it FAILs.
- Bytes: ≥ 20,000 ≫ 250 trivially.

This is a single-chunk brief; no self-extend needed —
closes after this wave.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 164 has
  patcher work in parallel).
- ❌ Other mega candidates (brief 163 closed cluster D-3 with
  2 hard residues — `data_020c9694` 14.8 KB + `data_020e0e70`
  366 B non-4-aligned — separate brief if either is worth
  cleanup).
- ❌ Cross-region cluster A apply — separate brief.
- ❌ ov004 path-2 scale-up (brief 167+ after brief 164 lands).
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- `data_020b6ec4` shipped as a single Pattern 1 chunk.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- ≥ 20 KB matched byte size.

**Branch:** `decomper/main-30kb-mega-array`

**Priority:** HIGH. Biggest single deferred Pattern 1
candidate. Visible decomp progress in one wave.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 166+ based on remaining backlog:
   - **If brief 164 has landed**: brief 167 = path-2 scale-
     up wave (decomper, ov004 `.rodata` claims).
   - **Cluster D-3 residue** (`data_020c9694` 14.8 KB mega +
     `data_020e0e70` 366 B non-4-aligned) — small cleanup
     wave.
   - **Cross-region cluster A apply** — port 1443 EUR
     cluster A symbols to USA + JPN.
   - **Cluster B 3 deferred value=0 candidates** — wave-2 TU
     rewrite of adjacent single-int TUs.
   - **Local-label generator extension** (brief 163 funnel)
     — small cloud follow-up.
