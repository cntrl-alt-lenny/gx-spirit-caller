### decomper/cluster-d3-wave-3

**Goal:** Close cluster D-3 to its structural floor. Brief 157
+ 158 + 161 bonus shipped 22 chunks; ~12 remain in the main
pool plus 2 deferred mega candidates (data_020c9694 14.8 KB,
data_020c7b44 4.9 KB). Wave 3 ships the remaining 12 + at
least one of the megas if structurally tractable.

**Context — what's shipped so far:**

| Wave | Chunks | Bytes | Modules | Notes |
|---|---:|---:|---|---|
| Brief 157 wave 1 | 9 | 6,664 | main | Smallest first; yield 27% |
| Brief 158 wave 2 | 12 | 5,852 | main + 4 overlays | Broader; yield 50%; data_02101928 deferred |
| Brief 161 bonus | 1 | (~1 KB est.) | main | data_02101928 unblocked by bundle alias |
| **Total to date** | **22** | **~12.5 KB** | 5 modules | |

Pool: ~33 total candidates per brief 121's analysis. 22
shipped, ~11 remain in mid-size range, plus 2 deferred mega
candidates (data_020c9694 14.8 KB, data_020c7b44 4.9 KB).

**Tooling stack now turnkey:**

- Brief 144 — auto-`.extern` emission in generator.
- Brief 152/155 — bundle recipe for value=0 / sub-4-byte
  residue (didn't trigger in waves 1 + 2 but available).
- Brief 159 Part 1 — `--section data` flag (no more manual
  sed).
- Brief 161 — bundle alias helper if any chunk needs to
  reference subsumed placeholders (brief 158's blocker
  pattern; brief 161 unblocked data_02101928).

**Brief 163 deliverables:**

### Part 1 — Ship remaining mid-size candidates

Pick the ~11 remaining D-3 candidates in the main pool.
Same workflow as brief 158 wave 2 but with brief 159 Part 1
flag eliminating the sed step:

```bash
python tools/cluster_c_pattern3_gen.py --version eur \
    --module <module> --start 0x<a> --end 0x<b> \
    --section data
```

Target ≥ 8 chunks in this part.

### Part 2 — Attempt at least one mega chunk

Pick whichever of the 2 deferred megas is more tractable:

- **data_020c9694** (14.8 KB) — main module
- **data_020c7b44** (4.9 KB) — main module

Inspect the byte content + symbol-table neighborhood. If
the mega has substantial cross-reference pressure (many
`.word` references into the chunk) the bundle alias helper
may apply. If the chunk has its own subsumed-placeholder
collision pattern (per brief 158's `data_02101928`-class
finding), apply brief 161's helper to the relevant bundle.

If both megas turn out to be structurally tricky, ship at
least one mid-size mega (something between the brief 158
wave 2 max of ~768 B and the 4.9 KB candidate). Brief
158's funnel suggested this is a reasonable middle
ground.

**Target: ≥ 1 mega chunk** in this part (≥ 4 KB single
chunk).

**Combined target: ≥ 9 chunks total** (8 mid-size + 1
mega; brief target was "remaining 12 plus mega" but
realistically the pool has ~11 candidates not 12).

### Part 3 — Confirm cluster D-3 status

Per the wave 3 outcomes, update `docs/state.md`'s
"Active clusters" cluster D-3 line with the final
shipped count + any final residue. If the pool drained
to 0 (or to just 1-2 hard residues), declare D-3
**EFFECTIVELY CLOSED** matching cluster B's framing.

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

**Self-extend gate** (same as briefs 143 / 147 / 149 /
151 / 153 / 155 / 157 / 158): yield ≥ 40% AND bytes-
matched ≥ 250. Mega chunks hit bytes trivially. Up to 3
waves total per the convention; this IS wave 3, so brief
closes after merge.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory — brief 162 has
  patcher work in parallel).
- ❌ ov004 reclassification (separate brief; brief 162 also
  unblocks path-2 wave for brief 164+).
- ❌ Cluster B residue (3 deferred candidates — separate
  brief if/when worth a wave-2 TU rewrite).
- ❌ Cross-region cluster A apply — separate brief.
- ❌ `AGENTS.md`, `docs/state.md` beyond Part 3's
  cluster-status update.

**Success:**

- Wave 3 PR ships ≥ 9 chunks total (8 mid-size + 1 mega).
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Cluster D-3 effectively closed (or final residue clearly
  named).

**Branch:** `decomper/cluster-d3-wave-3`

**Priority:** HIGH. Closes the last data-tier sub-cluster
to its floor. Tooling stack at maximum maturity (brief 144
+ 152/155 + 159 Part 1 + 161) makes execution low-risk.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Cluster D-3 closure declared in state.md (or final
   residue named).
3. Brain scopes brief 164+ candidates:
   - **If brief 162 has landed**: brief 164 = path-2
     scale-up wave (10-20 ov004 `.rodata` source claims
     dropping n stepwise; each block-level suppression
     drops 0-4 veneers depending on its veneer-block
     binding).
   - **Cross-region cluster A apply** — port 1443 EUR
     cluster A symbols to USA + JPN.
   - **3 cluster B value=0 deferred candidates** — needs
     wave-2 TU rewrite of adjacent single-int TUs.
   - **30 KB main mega-array** (`data_020b6ec4`) if not
     shipped here.
