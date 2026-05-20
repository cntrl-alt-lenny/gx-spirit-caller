### decomper/cluster-d3-wave-1

**Goal:** Open cluster D-3 — complex nested struct arrays
deferred since brief 121's D-cluster recipe research. Brief
144's `.extern`-auto-emitting Pattern 3 generator + brief 152
+ 155's bundle recipe make D-3 mechanically tractable now.

**Context — what brief 121 + 125 established:**

Brief 121's D-cluster taxonomy split D-2 (scalar arrays) from
**D-3 (complex nested structs)**. D-3 was deferred:

> D-3 ~20 deferred or via Pattern 3 generator

Brief 125 shipped `tools/cluster_c_pattern3_gen.py` — the
generator that emits multi-symbol `.s` chunks for contiguous
ranges with mixed types. Brief 144 (PR #565) added auto-
`.extern` emission to the generator, making it fully turnkey
for cross-referencing chunks. Brief 152's bundle recipe (and
brief 155's generalisation) handles the value=0 / sub-4-byte
edge cases inside chunks.

**The D-3 sub-pool** is ~20 candidates per brief 121's
analysis: nested struct arrays where each element is itself a
struct (often 3-5 fields). They're stored contiguously in
`.data` / `.rodata` and typically referenced from multiple
call sites via offset arithmetic.

**Brief 157 deliverables:**

### Part 1 — Survey + selection (small)

Use existing tooling (`tools/data_worklist.py` and/or brief
121's research note `docs/research/cluster-d-recipe.md` if
present) to enumerate the D-3 candidates. Report the count
and pick 5-10 contiguous-range anchors with the highest
expected yield.

If the worklist doesn't surface D-3 cleanly, use brief 121's
sub-classification (the candidates that didn't fit D-1
dispatch-table or D-2 scalar-array shape) plus a manual
inspection of the orig bytes at each candidate's address.

### Part 2 — Generate + claim

For each anchor: run the Pattern 3 generator over the
contiguous range covering the D-3 struct array:

```bash
python tools/cluster_c_pattern3_gen.py --version eur \
    --module <module> --start 0x<chunk_start> --end 0x<chunk_end>
```

Brief 144's auto-`.extern` emission means no per-chunk hand-
edits. Brief 152 / 155 bundle recipe handles any value=0 or
sub-4-byte residue inside the chunk. Add TU claims to
`config/eur/arm9/[overlays/ovNNN/]delinks.txt`.

### Part 3 — Verify

3-region `ninja sha1` PASS + 27/27 modules OK across EUR /
USA / JPN. Per-chunk objdiff byte-identical at the claim's
vaddr.

**Target: ≥ 5 D-3 chunks shipped** (= 5 multi-symbol arrays
covering ~50-150 symbols collectively, depending on struct
element count).

**Self-extend gate** (same as briefs 143 / 147 / 149 / 151 /
153 / 155):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

Pattern 3 mega chunks typically hit the bytes-matched gate
trivially (each chunk is hundreds of bytes). Up to 3 waves.

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

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory).
- ❌ Cluster B residue work (cluster B is effectively closed
  per brief 155; 3 deferred candidates would need wave-2 TU
  rewrite — separate brief).
- ❌ ov004 reclassification (cloud brief 156 territory).
- ❌ 30 KB main mega-array (`data_020b6ec4`) — separate brief.
- ❌ Cross-region cluster A apply — separate brief.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR ships ≥ 5 D-3 chunks.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Self-extend chain runs as far as gates allow.

**Branch:** `decomper/cluster-d3-wave-1`

**Priority:** HIGH. Opens the last unopened data-tier sub-
cluster; Pattern 3 generator turnkey means low execution risk.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 158+ based on D-3 pool depth + cloud's
   brief 156 findings:
   - If D-3 ships easily and pool remains: D-3 wave 2.
   - If cloud's spot-disasm finds the MEDIUM cohort viable:
     reclassification brief.
   - Otherwise: 30 KB main mega-array, cross-region cluster
     A apply, or reverse-lookup tool research.
