### cloud/cluster-b-scalars-research

**Goal:** Define the **cluster B `.data` scalars
recipe** per brief 113's plan. Brief 114's worklist v2
enumerated **247 cluster B candidates** (size-max=8,
shape=scalar). Average 4 bytes each. The recipe needs
to clarify:

1. Source-form: `.c` or `.s`?
2. Section attribute requirement: does mwcc 2.0/sp1p5
   place `int x = N;` in `.data` automatically, or
   does it need a `__attribute__((section(".data")))`
   marker? Brief 113 flagged this as **workflow wall
   W4**.
3. Per-symbol shape distinctions: scalar (1/2/4 bytes)
   vs near-misses (struct of 1 field, single-element
   array, function pointer, etc.).
4. How the recipe interacts with mwldarm's section
   placement decisions (LCF auto-routing vs explicit
   section directive).

**Context — what brief 115 established for cluster E:**

The DTCM/ITCM cluster (E) uses mwasmarm `.s` files with
dsd LCF auto-routing — section directive in source,
addresses claimed in delinks.txt, dsd places the bytes
in the right output section. No `__attribute__` or
`#pragma` needed.

**Cluster B may differ** because:
- `.data` symbols are typically more numerous (247 vs
  ~5 for DTCM).
- mwcc 2.0 emits `.data` section by default for
  initialized globals (well-known behavior).
- The pool may include some symbols better expressed
  in `.c` (typed values, headers needed) vs `.s`
  (truly bag-of-bytes pattern).

**Method:**

1. **Inventory the cluster B pool.** Run brief 114's
   worklist:
   ```bash
   python tools/data_worklist.py --version eur \
       --cluster B --top 20
   ```
   Inspect the top 20 by reader density. Classify each
   as:
   - Likely-`.c`-suitable (typed value, e.g.
     `int g_HeapSize = 0x40000;`).
   - Likely-`.s`-suitable (bag-of-bytes, addresses,
     non-obvious typing).
   - Edge case (need typedef discovery first).

2. **Source-form sweep on 1-2 representative candidates.**
   Pick the smallest single-wall exemplar. Try both
   approaches:
   - **`.c` approach:** declare the scalar in a new
     `src/main/data/data_scalars.c` (or similar):
     ```c
     /* g_<name> at 0x<addr> */
     int g_<name> = 0x<value>;
     ```
     Test whether mwcc emits the byte sequence at the
     expected address with default routing.
   - **`.s` approach:** add to a new
     `src/main/data/data_scalars.s` using brief 115's
     mwasmarm pattern:
     ```
     .global g_<name>
     .section .data
     g_<name>:
         .word 0x<value>
     ```

3. **Compare byte-identity.** Both approaches should
   produce the same byte sequence in `.data` at the
   target address. Verify by:
   - `ninja rom`
   - byte-comparing the built `.data` against
     `extract/eur/arm9/arm9.bin` at the cluster B
     candidate's address.
   - `dsd check modules` should still report 25/27 OK
     (cluster B work shouldn't regress brief 115's
     DTCM win).

4. **Document the recipe.** Add a cluster B section
   to `docs/research/data-tier-scoping.md` (created
   in brief 113). Include:
   - Which approach (`.c` or `.s`) is the default.
   - When to switch (e.g., typed values → `.c`,
     bag-of-bytes → `.s`).
   - Workflow wall W4 resolution (or what it actually
     is if not what brief 113 hypothesized).

5. **Cross-reference brief 114's worklist output**
   per-shape:
   - Pure `--shape scalar` count.
   - Edge cases that escape scalar filter (struct of 1
     field, etc.).

**Non-scope:**

- ❌ Bulk cluster B application (that's brief 120+
  decomper work — recipe-application waves).
- ❌ Cluster C / D research (sequenced in brief
  119+).
- ❌ Function-tier work.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Cluster B recipe documented** in `data-tier-scoping
  .md` (or a new dedicated doc).
- **1-2 worked examples** (one `.c`, one `.s` if
  applicable) — actual byte-identical recoveries on
  small cluster B candidates.
- **W4 resolution** documented (default mwcc behavior
  vs explicit section attribute).
- Brief 120 candidate pool sized (~247 candidates per
  brief 114's count, minus brief 117's worked examples).
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/cluster-b-scalars-research`

**Priority:** MEDIUM. Decomper brief 116 (cluster A
wave 1 + DTCM parity) is the higher-leverage immediate
move. Brief 117 unblocks brief 120 cluster B scale-out.

**After this brief lands:**

1. **Brief 120 (decomper)** runs cluster B wave 1
   applying the recipe to ~50 of the 247-candidate
   pool. Expected throughput per brief 113: 20-30
   syms/wave for cluster B.
2. **Cluster B scale-out** continues until pool
   drained (~10 waves × 25 syms = 250).
3. **Brief 118 (cluster A scale-out wave 2)** continues
   in parallel.
