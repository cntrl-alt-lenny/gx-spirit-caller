### decomper/cluster-prop-020085d4

**Goal:** Round 3 of the cluster-propagation pilot. Pick the cluster
the decomper's brief 016 PR explicitly recommended: an **offset-0,
no-literal anchor**, where `propagate_template`'s missing
`--substitute-imm` mode doesn't matter. Anchor is
`main / func_020085d4` (size 0x10, **130 unmatched siblings**, 39
already matched as of main `1ee0935`).

**Context:**

- Brief 015 yielded 18/144 (12.5%) on the same shape (`return *data`
  singleton-pointer getter); brief 016 yielded 2/70 (2.9%) on a
  different shape (`*data->field_NNN = arg`, where the hardcoded
  field offset was the problem). Decomper's PR #241 nailed the
  diagnosis: `(size, sig_len)` cluster fingerprint is too coarse,
  AND `propagate_template` doesn't substitute numeric literals.
- This brief is the workaround: pick a cluster whose anchor has
  **no hardcoded numeric literals** so literal substitution isn't
  needed. Offset-0 `return *data` is exactly that — the only
  variable is the pool-pool-relocation target (which is what the
  reloc shape captures).
- Anchor is already matched (`src/main/func_020085d4.c`):

  ```c
  extern void *data_02104f3c;
  void *func_020085d4(void) { return data_02104f3c; }
  ```

- Cluster #1 in current `find_pattern_clusters` ranking after #241:

  ```
  main   func_020085d4  size=0x10  sig=1  matched=39  unmatched=130
  ```

  (It became #1 because brief 015 promoted 18 siblings into the
  matched-anchor pool; brief 016's anchor was different shape.)
- **Calibrated yield expectation: 12-15% ≈ 15-20 actual matches**
  out of the 130. Higher would be great, lower means the offset-0
  shape isn't actually as homogeneous as we think and brief 018
  (cloud's tooling fix) becomes the only path.

**Approach (mechanical, brief 015 style):**

1. **Confirm anchor matched.** It is — `src/main/func_020085d4.c`,
   100% in `report.json`. No new anchor work.
2. **Inspect cluster:**
   `python tools/find_pattern_clusters.py --version eur main 0x020085d4`
   for the per-anchor list of 130 unmatched siblings.
3. **Propagate:**
   ```
   python tools/propagate_template.py apply \
     --template src/main/func_020085d4.c \
     --cluster main 0x020085d4 \
     --version eur
   ```
   Likely emits 130 `.c` files. Most will fail byte-compare.
4. **Build + report.** `ninja rom`, `ninja objdiff` (if it doesn't
   panic — see brief 016 PR's note about objdiff-cli upstream),
   `ninja report`. Drop any sibling that doesn't hit 100%.
5. **Delinks.** Use `tools/scaffold_batch.py --apply-delinks` for
   the `complete` blocks. The cluster spans modules (per brief 016
   precedent — clusters propagate wherever they reach, not just
   the anchor's module), so delinks blocks may land in
   `config/eur/arm9/delinks.txt` and any `config/eur/arm9/overlays/
   ov<NN>/delinks.txt` per kept sibling.

**Updated rule from brief 016 PR (please absorb):**

If `propagate_template`'s output is the right *shape* but a single
**numeric literal** differs from the baserom byte (e.g. an `_pad`
size, struct field offset, or load offset), the decomper **may
patch the literal alone** as long as:

- The patch is exclusively integer-literal substitution (and the
  field name following from it).
- The byte-compare against the baserom comes out 1/1 match.
- The PR body discloses the patch and lists the affected files.

This is the only documented exception to "drop, don't patch". It
exists because brief 016 surfaced that the propagation tool can't
yet substitute literals; once brief 018 ships
`--substitute-imm`, this exception goes away.

**Scope:**

- `src/main/<addr>.c` and `src/overlay<NN>/<addr>.c` for kept
  siblings.
- `config/eur/arm9/delinks.txt` and `config/eur/arm9/overlays/
  ov<NN>/delinks.txt` (append-only `complete` blocks).

**Non-scope:**

- ❌ Any sibling whose post-build bytes don't match. Drop, don't
  patch (except for the literal-substitution case above).
- ❌ ov004 candidates (failing module).
- ❌ Tools changes — the cluster fingerprint and
  `--substitute-imm` work is brief 018 (cloud).
- ❌ Other top-N clusters — brief 019+ territory.

**Success:**

- 15-20 propagated siblings at 100% objdiff (per the calibrated
  band). If yield drops below 5, **stop and report** — that means
  even the offset-0 shape isn't homogeneous enough for the current
  tooling, and brief 018's tooling fix is now blocking.
- `./dsd.exe check modules` still **24/27 OK**.
- `python tools/check_match_invariants.py --version eur` exits 0
  (placeholder-name warnings are fine and expected).
- `find_pattern_clusters` shows the cluster's unmatched count drop
  by the kept count.
- One PR. Body lists kept + dropped siblings (with one-line "why"
  per drop) like #237 / #241 did.

**Branch:** `decomper/cluster-prop-020085d4`.

**After this brief lands:**

1. **Brief 019** depends on brief 018's tooling. If brief 018
   ships first: re-run brief 016's cluster (`func_ov000_021aa4a0`,
   68 still unmatched) with `--substitute-imm` — predicted yield
   jumps from 2.9% to ~80% if literal substitution is the real
   bottleneck. If brief 017 ships first and 018 hasn't: pick
   another offset-0 cluster (the "no-literal" set) until 018
   arrives.
2. **Brain follow-up** — after brief 017 + 018 both land, audit
   `find_pattern_clusters` for which clusters are still pure
   offset-0 (safe today) vs literal-bearing (needs --substitute-imm).
   The ratio tells us how much of the easy-tier 765 unmatched is
   reachable by current tooling alone vs needs the upgrade.
