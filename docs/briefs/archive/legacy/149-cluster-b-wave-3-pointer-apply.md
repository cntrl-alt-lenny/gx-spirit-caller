### decomper/cluster-b-wave-3-pointer-apply

**Goal:** Apply cloud's brief 148 pointer recipe to the ~20
remaining cluster B pointer candidates, plus optionally
falsify one of cloud's 3 size-1/2 workaround sketches. Closes
the cluster B pool to its structural floor.

**Context — what brief 148 landed:**

Cloud's PR #573 shipped:

1. **Pointer pool survey** — `docs/research/cluster-b-pointer-
   pool.md`: 23 pointer candidates enumerated (15 data-pointers
   + 8 code-pointers, 22 in main + 1 in ov004). Each row has
   slot vaddr, slot name, pointee value/section/symbol/type.
2. **Recipe (verified, SHA1 PASS)**:

   ```c
   extern char <pointee>;          /* opaque forward-decl */

   void *<slot_name> = &<pointee>;
   ```

   Same shape as brief 121 / 130 D-1 wave 2. Cloud verified on
   3 worked examples (one per edge case: unclaimed pointee /
   claimed-with-typed-array pointee / code-pointer).
3. **Size-1/2 spot-check FAIL** — naive `unsigned char data_X =
   0xAB;` failed with EUR SHA1 mismatch (1308 byte diffs).
   Diagnosis: mwcc default 4-byte section alignment ≠ orig's
   byte-tight emission. 3 workaround sketches filed for this
   brief to falsify.

**Scope:**

### Part 1 — Apply pointer recipe to remaining ~20 candidates

20 of the 23 surveyed candidates not yet claimed:

- 15 data-pointers (singletons + small contiguous clusters).
  Cloud's brief 148 hand-off suggests bundling 11 of these
  into 3 contiguous-table claims (4+4+3 pointers each).
- 8 code-pointers (function pointers).

Per-claim shape per the locked recipe. Per-slot smoke test:
objdiff byte-identical. Wave smoke test: 3-region SHA1 PASS +
27/27 modules OK.

**Target: ≥ 15 cluster B pointer claims** across data +
code-pointer subsets.

### Part 2 (optional) — Size-1/2 workaround falsification

Cloud's research note documents 3 workaround sketches for the
size-1 alignment failure. **Falsify exactly one** as a
stretch (not required for wave success):

1. **`.s` recipe with explicit `.byte`** — mwasmarm should
   emit byte-tight without compiler alignment hints. Most
   likely to work; least invasive.
2. **`__attribute__((aligned(1)))`** on the C decl — relies on
   mwcc honouring the alignment override (not certain;
   mwcc 2.0/sp1p5 sometimes ignores).
3. **Group claim** — bundle the 4-byte alignment slot as
   `unsigned int` covering the size-1 scalar plus its
   neighbours.

Pick whichever decomper's intuition says is most likely.
Report PASS or FAIL with the exact mwcc output diff in the
PR funnel. If FAIL, the next size-1/2 workaround moves to a
follow-up brief.

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

**Self-extend gate** (same as brief 143 wave 1/2):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250 (note: pointer claims are 4 B each so
  ~15 claims hits this trivially).

If both hold, wave 2 self-extend is authorised. Up to 3 total
waves before the brief closes.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 150 below
  handles the patcher v3 fix).
- ❌ Cluster B value=0 sub-pool (separate research; needs
  BSS handling).
- ❌ ov004 `.rodata` wave 2 — gated on cloud brief 150 patcher
  v3 unlocking n<9.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR opens with ≥ 15 cluster B pointer claims.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Optional: ≥ 1 size-1/2 workaround sketch falsified (PASS or
  FAIL clearly reported).
- Self-extend runs as far as gates allow.

**Branch:** `decomper/cluster-b-wave-3-pointer-apply`

**Priority:** HIGH. Cloud's recipe locked; mechanical apply
phase. Expected to drain the cluster B pool to its
structural floor.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes next decomper wave based on residue:
   - If size-1/2 workaround worked: brief 151 cluster B size-
     1/2 wave.
   - If pointer pool is exhausted and size-1/2 still
     blocked: cluster D-2 or D-3 (Pattern 3-flavoured) work
     on EUR main.
3. Brief 150 (cloud, parallel-track) closes the ov004
   patcher v3 to unblock ov004 `.rodata` wave 2.
