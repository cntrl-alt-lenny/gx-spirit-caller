### cloud/cluster-b-size-1-2-workarounds

**Goal:** Try cloud's size-1/2 alignment workarounds #2 and #3
(brief 148's research note), report findings, and lock the
working recipe (or document falsification of all three). Brief
149 (PR #575) already falsified workaround #1 — the `.s`
recipe with explicit `.byte` produces the same 1308-byte / 32-
byte cascade as brief 148's naive `.c` attempt because
mwasmarm respects the same LCF section-alignment cascade.

**Context — what's already known:**

Cluster B residue includes ~14 size-1 / size-2 scalars where
the naive recipe fails:

```c
unsigned char data_021020b4 = 0x80;   // FAILS — 1308 byte diff
```

mwcc 2.0/sp1p5 emits `.data` sections with 4-byte default
alignment. The orig ROM has these size-1/2 scalars packed
byte-tight (no padding). The 4-byte alignment cascade shifts
every downstream byte by N bytes per skipped padding slot.

Brief 148 filed 3 workaround sketches:

1. **`.s` recipe with explicit `.byte`** — **FALSIFIED by brief
   149.** Same cascade.
2. **`__attribute__((aligned(1)))`** — untested. Relies on mwcc
   honouring the alignment override. mwcc 2.0/sp1p5 is known to
   sometimes ignore alignment hints.
3. **Group claim** — bundle a 4-byte alignment slot as `unsigned
   int` (or struct) covering the size-1/2 scalar plus its
   neighbours.

**Scope (research + worked examples):**

Three deliverables, in order:

### Part 1 — Try workaround #2

Test `__attribute__((aligned(1)))` on `data_021020b4` (the same
test target brief 148 + 149 used). C decl shape:

```c
__attribute__((aligned(1))) unsigned char data_021020b4 = 0x80;
```

Run 3-region `ninja sha1`. Report PASS or FAIL. If FAIL,
diagnose by inspecting the mwcc-emitted alignment in the
object file (e.g., `objdump -h build/eur/.../data_021020b4.o`).

### Part 2 — Try workaround #3

Group claim — bundle a 4-byte slot as `unsigned int` covering
size-1 scalar + neighbours. Two sub-shapes to try:

- **Bundle as `unsigned int`** — `unsigned int data_021020b4_pack
  = 0x0102030480;` (where the upper bytes are the actual size-1
  neighbours).
- **Bundle as struct** — `struct { unsigned char a; unsigned char
  b; unsigned char c; unsigned char d; } data_021020b4_pack = { ...
  };`

The struct-bundle is closer to the orig source likely existed
as. The `unsigned int` bundle is simpler but loses per-byte
symbol identity.

Determine which neighbours to bundle by inspecting the orig
ROM bytes at `data_021020b4`'s 4-byte aligned slot.

Run 3-region `ninja sha1`. Report PASS or FAIL per sub-shape.

### Part 3 — Document findings + lock recipe

Update `docs/research/cluster-b-pointer-pool.md` (or add a
sibling `docs/research/cluster-b-size-1-2-recipe.md`) with:

- Workaround #1: FAILED (brief 149 result).
- Workaround #2: PASS / FAIL + diagnosis.
- Workaround #3a (unsigned int bundle): PASS / FAIL + diagnosis.
- Workaround #3b (struct bundle): PASS / FAIL + diagnosis.
- **If any workaround PASSES**: ship 1-2 worked examples with
  3-region SHA1 PASS. Lock the recipe so brief 153 (decomper)
  can mechanically apply to the remaining ~13 size-1/2 candidates.
- **If all 4 workarounds FAIL**: document the falsifications.
  Brief 153 candidates: investigate mwcc compiler-flag overrides
  (e.g., `-align packed` if it exists) or LCF script changes.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved across whatever worked
  examples ship.
- All existing tests still green (1784+ baseline post-brief
  150).
- Markdownlint clean on the new / extended research note.

**Non-scope:**

- ❌ Shipping a full size-1/2 wave (that's brief 153 / decomper
  if this brief finds a working recipe).
- ❌ Cluster B value=0 sub-pool (separate BSS recipe research).
- ❌ ov004 cluster work (brief 151 / decomper).
- ❌ `AGENTS.md`, `docs/state.md`, decomper-owned paths.

**Success:**

- Workaround #2 and #3 (both sub-shapes) tested on
  `data_021020b4`.
- Findings documented in research note with diagnoses.
- If any workaround PASSES: ≥ 1 worked example shipped + 3-
  region SHA1 PASS.
- If all FAIL: clean falsification documented; brief 153 candi-
  dates listed.

**Branch:** `cloud/cluster-b-size-1-2-workarounds`

**Priority:** MEDIUM. Not blocking 3-region SHA1 PASS (already
green). Unblocks ~13 size-1/2 candidates if a workaround works.

**After this brief lands:**

1. If a recipe locks: brain scopes brief 153 (decomper) to
   apply it to remaining ~13 size-1/2 cluster B candidates.
2. If all workarounds fail: brain scopes a follow-up
   investigation brief (LCF script edit, mwcc flag survey, or
   wait for upstream dsd improvements).
3. Cluster B residue narrows further. After this + brief 151,
   the remaining backlog is cluster D-3 (Pattern 3 generator
   on complex nested structs), 30 KB mega-array, cross-region
   applies, and cluster B value=0 (BSS handling).
