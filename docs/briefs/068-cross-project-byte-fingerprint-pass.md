### cloud/cross-project-byte-fingerprint-pass

**Goal:** Extend `tools/find_external_source.py` from name-only
matching (v0 prototype, PR #429) to **byte-fingerprint matching**:
disassemble each unmatched function in our config, compute the
same fingerprint over each upstream `.o`'s functions, rank
candidates by combined similarity. Output a ranked CSV of
`(our_func, source_repo, source_file, source_func, confidence,
sp_distance)` for decomper brief 069 to consume.

**Context:**

Brief 066 (PR #429) shipped the v0 prototype and feasibility
verdict (**GO**). The name-only matcher hit 6/10 on guessed-name
queries against `pret/pokediamond` (819 indexed NitroSDK
functions). Once byte-fingerprint matching surfaces the *correct*
upstream names — not just the guessed-correct ones — the hit rate
is expected to climb substantially.

PR #418's `function_byte_similarity()` + `_mask_relocs()` library
primitives are already shipped; this brief is the cross-project
application of the same algorithm. The reuse symmetry is the
reason brief 066's implementation cost projection is genuinely
smaller than starting from scratch.

Per brief 066's SP-distance matrix:

| Target | mwccarm SP | Δ vs `2.0/sp1p5` | Expected hit rate |
|---|---|---:|---|
| `pret/pokediamond` | `2.0/sp1` | one SP rev | 80–95% |
| `pret/pokeheartgold` | `2.0/sp2p2` (+ `1.2/sp2p3` for nitrocrypto) | SP-level shift | 50–70% |
| `pret/pokeheartgold` (nitrocrypto only) | `1.2/sp2p3` | **exact match** to our `.legacy.c` SP | **≥ 95%** |
| `AetiasHax/st` | `dsi/1.2p1` | different ISA family | <20% — skip |

**Method:**

1. **Build external `.o` files for each target's already-matched
   functions.** Two options per brief 066's architecture sketch:
   - (a) Build via the target's own toolchain (requires their
     mwccarm SP; `download_tool.py` pulls `2.0/sp1` for
     pokediamond — cheap).
   - (b) Inline disassembly from prebuilt object files in the
     vendored tree if they ship them.

   Pick (a) for pokediamond since SP-distance is small and the
   build is well-trodden. (b) only if (a) hits unexpected
   friction.

2. **Compute fingerprints over upstream `.o`s.** Same shape as
   `find_region_siblings.py` v2: function size + reloc-masked
   bytes. Cache the fingerprint table under
   `tools/_vendor/<repo>/.fingerprint_cache.json` so the sweep
   doesn't re-disassemble on every invocation.

3. **Sweep our unmatched pool.** For each of our ~5000 unmatched
   `func_<addr>` entries (mixed across `config/eur/**/`), compute
   the same fingerprint from our disassembly, score against each
   upstream candidate.

4. **Rank + bucket.**
   - HIGH: byte-similarity ≥ 0.95 AND name-match OR
     same-SP-tier match.
   - MEDIUM: byte-similarity ≥ 0.85.
   - LOW: 0.70 ≤ byte-similarity < 0.85.
   - DROP: < 0.70 (not worth surfacing).

5. **Hit-rate validation.** Re-run brief 066's 10-guess sample
   plus 100 random unmatched functions; report per-SP-distance
   bucket precision.

6. **Output deliverables:**
   - `tools/find_external_source.py` v1: byte-fingerprint mode
     via `--byte-fingerprint` flag (default on once validated;
     keep name-only via `--name-only` for backward-compat).
   - Ranked CSV at `docs/research/cross-project-candidates.csv`
     for decomper brief 069 to consume.
   - Update to `docs/research/cross-project-feasibility.md` with
     per-SP-distance bucket precision results.

**Non-scope:**

- ❌ Building the bulk-port pipeline (`tools/port_external_
  source.py`) — that's brief 069.
- ❌ Auto-applying ports. Output is ranked candidates; decomper
  picks per discretion.
- ❌ Cloning additional upstream repos beyond pokediamond +
  pokeheartgold. `AetiasHax/st` excluded per brief 066's
  SP-distance verdict. Add later only if brief 069 drains the
  top-tier pool and SP-distance tolerance improves.
- ❌ Modifying our `config/eur/symbols.txt` to "name" the
  matched functions — that's a downstream symbol-archaeology
  step, not gating brief 069.

**Success:**

- ≥ 80% HIGH-confidence precision on a 100-sample validation
  (matches brief 066's headline projection for pokediamond's
  one-SP-rev distance).
- Ranked CSV with ≥ 200 HIGH-confidence candidates surfaced
  across pokediamond + pokeheartgold. The lower bound matches
  brief 066's "300-600 EUR ports from pokediamond alone"
  conservative estimate.
- All unit tests + integration test pass; full suite remains
  green.
- Fingerprint cache rebuilds idempotently.

**Branch:** `cloud/cross-project-byte-fingerprint-pass`

**Priority:** MEDIUM-HIGH. Unblocks brief 069 (decomper
bulk-port wave) which is where the 360-1500 cross-region +
cross-project matches actually land. Independent of brief 065
wave 3 (which decomper may run autonomously per the brief's
self-extend clause).

**After this brief lands:**

1. Brain queues brief 069 (decomper bulk-port wave consuming
   the ranked CSV). Same shape as brief 065 wave 1 but with
   `libs/` as the destination instead of `src/<region>/`.
2. Once brief 069 wave 1 validates the byte-fingerprint match
   rate end-to-end, brain re-scopes brief 070+ for the
   remaining HIGH pool.
3. If the v1 byte-fingerprint pass returns < 60% precision in
   any SP-distance bucket, brain pauses and queues a cloud
   research brief to investigate. Specifically: pokediamond
   SP-distance is one rev (sp1 → sp1p5); if even that returns
   poor precision, the codegen-walls.md C-15-style peephole
   shifts are biting harder than expected and a per-target
   coercion pass is needed.
