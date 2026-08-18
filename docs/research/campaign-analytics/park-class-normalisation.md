<!-- markdownlint-disable MD013 -->

# Park-class normalisation and family census

Snapshot: 2026-08-17. Source: `docs/research/campaign-analytics/attempts.tsv`. `attempts.tsv` is intentionally unchanged in this PR; this report and the mapping table are derived views only.

## #1505 baseline outcome

The full ledger has **1164 rows**, **283 distinct raw park_class values**, and **91 canonical families**. The mapping is explicit in [tools/park_class_map.tsv](../../../tools/park_class_map.tsv); the normalizer reads that table and does not rewrite the source ledger. The parked population is **744 rows**.

The top five parked families, including the explicit unknown bucket, cover **520 / 744 = 69.89%**. The top five *classified* families (excluding `UNCLASSIFIED:unknown`) cover **310 / 744 = 41.67%**. Unknown alone is the largest parked bucket at 231 rows, so a wall-family selector must not treat unknown as a real wall family.

## Round 0818 remap

The current append-only ledger census is **1547 rows**, **776 parked rows**, **293 distinct raw values**, and **96 canonical families**. These are printed census values, not test cardinality assertions. Before this remap, the parked non-empty unmapped list was exactly `OQ-1`, `P-17`, `P-20`, `P-36`, `P-4`, `P-42`, `strength-reduction`, and `tool-anomaly`; shipped `''` and `n/a` values are intentionally outside the invariant.

Bare catalog anchors now use an identity rule for `C-<number>`, `P-<number>`, and `OQ-<number>`, so new anchors do not require mapping-table rows. `strength-reduction` maps to `C-65`, the catalog family covering strength-reduction walls. `tool-anomaly` maps to `UNCLASSIFIED:tool-anomaly`: it records a fastmatch-versus-SHA1 tooling discrepancy rather than a compiler/code-generation wall. Other parked free text remains an explicit unmapped value and fails the reviewed-mapping invariant.

## Controlled vocabulary

Formal C/P tags are anchored exactly when the raw value contains one unambiguous catalog code. Compound raw tags remain compound families rather than being silently assigned to one wall. The three register-numbering spellings are the deliberate exception requested by the canary: they normalize to `P-30`, with the raw spelling preserved as `qualifier`. Values without a defensible catalog anchor receive a named `PROVISIONAL:` family; the raw value remains in the mapping table and in the qualifier.

| Canary | Normalized result |
|---|---|
| `register-numbering-permutation-cascade`, `register-numbering-permutation-cascade-P36-adjacent`, `P-30-adjacent-register-choice` | all `P-30`; each qualifier retains its raw spelling |
| `C-32`, `C-32-cross-overlay-bl` | both `C-32`; the latter qualifier is `cross-overlay-bl` |
| `P-36-instruction-scheduling` vs `P-30-adjacent-register-choice` | `P-36` vs `P-30`; scheduling and register-choice remain separate |

## Normalizer

`python tools/normalise_park_class.py --value <raw>` returns JSON with `raw`, `family`, and `qualifier`. `--census` emits the full raw enumeration and both all-ledger and parked-family censuses. Unknown future values fail closed to `PROVISIONAL:unmapped`; they are not silently merged into an existing family.

## Canonical-family census

| Canonical family | All ledger rows | Parked rows | Parked share |
|---|---:|---:|---:|
| `UNCLASSIFIED:none` | 324 | 0 | 0.0000% |
| `UNCLASSIFIED:unknown` | 259 | 231 | 31.0484% |
| `PROVISIONAL:register-allocation` | 162 | 159 | 21.3710% |
| `P-36` | 60 | 59 | 7.9301% |
| `P-20` | 40 | 40 | 5.3763% |
| `PROVISIONAL:register-choice` | 31 | 31 | 4.1667% |
| `PROVISIONAL:T-1` | 3 | 3 | 0.4032% |
| `PROVISIONAL:predication/branch` | 23 | 21 | 2.8226% |
| `C-55` | 22 | 4 | 0.5376% |
| `P-30` | 21 | 21 | 2.8226% |
| `PROVISIONAL:register-pressure/cascade` | 18 | 18 | 2.4194% |
| `P-31` | 13 | 13 | 1.7473% |
| `PROVISIONAL:instruction-selection` | 12 | 12 | 1.6129% |
| `PROVISIONAL:constant-materialization` | 11 | 10 | 1.3441% |
| `PROVISIONAL:structural` | 9 | 8 | 1.0753% |
| `PROVISIONAL:frame/epilogue` | 9 | 5 | 0.6720% |
| `PROVISIONAL:ledger-mistag` | 7 | 0 | 0.0000% |
| `PROVISIONAL:pool/address-cse` | 7 | 7 | 0.9409% |
| `PROVISIONAL:bitfield/bit-pack` | 6 | 3 | 0.4032% |
| `PROVISIONAL:canary-residual` | 6 | 6 | 0.8065% |
| `C-60` | 5 | 3 | 0.4032% |
| `C-44` | 5 | 1 | 0.1344% |
| `C-65` | 5 | 5 | 0.6720% |
| `C-61` | 4 | 2 | 0.2688% |
| `PROVISIONAL:guard-chain-double-deref-p1reg` | 4 | 4 | 0.5376% |
| `PROVISIONAL:changed-bool-family-r0-reuse` | 4 | 4 | 0.5376% |
| `C-32` | 4 | 4 | 0.5376% |
| `PROVISIONAL:register-allocation+scheduling` | 4 | 4 | 0.5376% |
| `PROVISIONAL:inline-asm` | 3 | 1 | 0.1344% |
| `PROVISIONAL:memory-order/fusion` | 3 | 3 | 0.4032% |
| `P-27` | 3 | 3 | 0.4032% |
| `P-17` | 3 | 1 | 0.1344% |
| `P-40` | 3 | 3 | 0.4032% |
| `PROVISIONAL:changed-bool-reg-reuse` | 3 | 3 | 0.4032% |
| `PROVISIONAL:xor-order` | 2 | 0 | 0.0000% |
| `C-34` | 2 | 1 | 0.1344% |
| `P-6` | 2 | 0 | 0.0000% |
| `C-56` | 2 | 1 | 0.1344% |
| `C-64` | 2 | 2 | 0.2688% |
| `P-34` | 2 | 2 | 0.2688% |
| `P-37` | 2 | 2 | 0.2688% |
| `P-33` | 2 | 2 | 0.2688% |
| `P-1` | 2 | 2 | 0.2688% |
| `P-2` | 2 | 2 | 0.2688% |
| `PROVISIONAL:ov004-core-changed-bool-family-partial` | 2 | 2 | 0.2688% |
| `PROVISIONAL:unsigned-cast` | 1 | 0 | 0.0000% |
| `PROVISIONAL:combined-levers` | 1 | 0 | 0.0000% |
| `C-31` | 1 | 0 | 0.0000% |
| `PROVISIONAL:permanent-header` | 1 | 0 | 0.0000% |
| `C-23+C-36` | 1 | 0 | 0.0000% |
| `PROVISIONAL:complexity` | 1 | 0 | 0.0000% |
| `PROVISIONAL:memory-width` | 1 | 1 | 0.1344% |
| `PROVISIONAL:unclear` | 1 | 1 | 0.1344% |
| `P-23` | 1 | 1 | 0.1344% |
| `C-59` | 1 | 0 | 0.0000% |
| `C-58` | 1 | 0 | 0.0000% |
| `P-4+P-11` | 1 | 1 | 0.1344% |
| `C-23` | 1 | 0 | 0.0000% |
| `C-63` | 1 | 0 | 0.0000% |
| `PROVISIONAL:compound-compare-same-reg` | 1 | 1 | 0.1344% |
| `PROVISIONAL:compound-compare-3way` | 1 | 1 | 0.1344% |
| `PROVISIONAL:64bit-compare-reg-pressure` | 1 | 1 | 0.1344% |
| `PROVISIONAL:struct-by-value-return-abi` | 1 | 1 | 0.1344% |
| `P-35` | 1 | 1 | 0.1344% |
| `PROVISIONAL:oq-1-dead-branch-preservation` | 1 | 1 | 0.1344% |
| `PROVISIONAL:ands-vs-tst-instruction-choice` | 1 | 1 | 0.1344% |
| `P-32` | 1 | 1 | 0.1344% |
| `PROVISIONAL:and-shift-pair-collapse` | 1 | 1 | 0.1344% |
| `PROVISIONAL:sibling-constant-arithmetic-reuse` | 1 | 1 | 0.1344% |
| `P-38` | 1 | 1 | 0.1344% |
| `P-39` | 1 | 1 | 0.1344% |
| `PROVISIONAL:new-imm-offset-truncation-fold` | 1 | 1 | 0.1344% |
| `PROVISIONAL:register-spill-pressure-8-live-values` | 1 | 1 | 0.1344% |
| `PROVISIONAL:rsb-immediate-constant-fusion-resists-source` | 1 | 1 | 0.1344% |
| `PROVISIONAL:switch-jumptable-inline-bxlr-vs-shared-branch-consolidation` | 1 | 1 | 0.1344% |
| `PROVISIONAL:cross-call-self-and-result-persistence-reg-alloc-mismatch` | 1 | 1 | 0.1344% |
| `PROVISIONAL:missing-char-reload-spill` | 1 | 1 | 0.1344% |
| `PROVISIONAL:dead-param-preservation-move-not-elided` | 1 | 1 | 0.1344% |
| `PROVISIONAL:mla-operand-order-register-numbering-p17-adjacent` | 1 | 1 | 0.1344% |
| `PROVISIONAL:cross-overlay` | 1 | 1 | 0.1344% |
| `PROVISIONAL:reciprocal-division-register-numbering-cascade` | 1 | 1 | 0.1344% |
| `PROVISIONAL:control-flow-tail-merge` | 1 | 1 | 0.1344% |
| `P-3` | 1 | 1 | 0.1344% |
| `PROVISIONAL:fixed-point-blend-structural-mismatch` | 1 | 1 | 0.1344% |
| `PROVISIONAL:control-flow-structural-mismatch` | 1 | 1 | 0.1344% |
| `P-32+P-33+C-45` | 1 | 1 | 0.1344% |
| `PROVISIONAL:ov011-core-documented-1reg-wall` | 1 | 1 | 0.1344% |
| `PROVISIONAL:ov011-core-documented-multifield-rmw-wall` | 1 | 1 | 0.1344% |
| `PROVISIONAL:tier-verification-inferior` | 1 | 1 | 0.1344% |
| `PROVISIONAL:changed-bool` | 1 | 1 | 0.1344% |
| `P-29` | 1 | 1 | 0.1344% |

## Full raw-value enumeration

This is the complete distinct-value enumeration produced by `--census`; the fourth column is the qualifier retained for review.

| Raw park_class | Rows | Canonical family | Qualifier |
|---|---:|---|---|
| `none` | 324 | `UNCLASSIFIED:none` | no park class |
| `unknown` | 259 | `UNCLASSIFIED:unknown` | raw value is unknown |
| `reg-alloc` | 144 | `PROVISIONAL:register-allocation` | reg-alloc |
| `c-55` | 21 | `C-55` | formal anchor |
| `predication` | 13 | `PROVISIONAL:predication/branch` | predication |
| `P-36-pipeline-interleaving` | 11 | `P-36` | pipeline-interleaving |
| `register-numbering-permutation-cascade-P36-adjacent` | 9 | `P-30` | register-numbering-permutation-cascade-P36-adjacent |
| `structural` | 9 | `PROVISIONAL:structural` | structural |
| `instruction-selection` | 8 | `PROVISIONAL:instruction-selection` | instruction-selection |
| `large-diff-register-realloc` | 6 | `PROVISIONAL:register-pressure/cascade` | large-diff-register-realloc |
| `P-31` | 5 | `P-31` | formal anchor |
| `P-36-poolhoist` | 5 | `P-36` | poolhoist |
| `c-44` | 5 | `C-44` | formal anchor |
| `register-choice` | 5 | `PROVISIONAL:register-choice` | register-choice |
| `register-role-rotation-plus-LS-vs-EQ-mnemonic` | 5 | `PROVISIONAL:register-choice` | register-role-rotation-plus-LS-vs-EQ-mnemonic |
| `c-61` | 4 | `C-61` | formal anchor |
| `canary-lever-residual` | 4 | `PROVISIONAL:canary-residual` | canary-lever-residual |
| `changed-bool-family-r0-reuse` | 4 | `PROVISIONAL:changed-bool-family-r0-reuse` | changed-bool-family-r0-reuse |
| `epilogue-shape` | 4 | `PROVISIONAL:frame/epilogue` | epilogue-shape |
| `guard-chain-double-deref-p1reg` | 4 | `PROVISIONAL:guard-chain-double-deref-p1reg` | guard-chain-double-deref-p1reg |
| `mistagged-c34` | 4 | `PROVISIONAL:ledger-mistag` | mistagged-c34 |
| `reg-alloc-mul-dest-swap-plus-LS-vs-EQ-condcode-persistent` | 4 | `PROVISIONAL:register-allocation` | reg-alloc-mul-dest-swap-plus-LS-vs-EQ-condcode-persistent |
| `C-32` | 3 | `C-32` | formal anchor |
| `C-60` | 3 | `C-60` | formal anchor |
| `P-27-post-call` | 3 | `P-27` | post-call |
| `P-30-adjacent-register-choice` | 3 | `P-30` | P-30-adjacent-register-choice |
| `P-30-whole-function-register-rotation` | 3 | `P-30` | whole-function-register-rotation |
| `changed-bool-reg-reuse` | 3 | `PROVISIONAL:changed-bool-reg-reuse` | changed-bool-reg-reuse |
| `mistagged-brief294` | 3 | `PROVISIONAL:ledger-mistag` | mistagged-brief294 |
| `off-mul-scratch-register-swap` | 3 | `PROVISIONAL:register-choice` | off-mul-scratch-register-swap |
| `pool-const-materialize` | 3 | `PROVISIONAL:constant-materialization` | pool-const-materialize |
| `register-allocation-scheduling` | 3 | `PROVISIONAL:register-allocation+scheduling` | register-allocation-scheduling |
| `C-34` | 2 | `C-34` | formal anchor |
| `P-2-stm-fusion` | 2 | `P-2` | stm-fusion |
| `P-20-bf94-result-register` | 2 | `P-20` | bf94-result-register |
| `P-20-operand-order-swap` | 2 | `P-20` | operand-order-swap |
| `P-20-plus-C81-register-number` | 2 | `P-20` | plus-C81-register-number |
| `P-34-prologue-pad-fold` | 2 | `P-34` | prologue-pad-fold |
| `P-36-postinc-pair` | 2 | `P-36` | postinc-pair |
| `P-6-routing` | 2 | `P-6` | routing |
| `asm-int` | 2 | `PROVISIONAL:inline-asm` | asm-int |
| `bitfield` | 2 | `PROVISIONAL:bitfield/bit-pack` | bitfield |
| `c-56` | 2 | `C-56` | formal anchor |
| `c-60` | 2 | `C-60` | formal anchor |
| `c-64` | 2 | `C-64` | formal anchor |
| `dead-value-register-reuse-changed-bool-P36-adjacent` | 2 | `PROVISIONAL:register-choice` | dead-value-register-reuse-changed-bool-P36-adjacent |
| `frame-shape` | 2 | `PROVISIONAL:frame/epilogue` | frame-shape |
| `induction-strength-reduction` | 2 | `C-65` | induction-strength-reduction |
| `lo-hi-register-swap` | 2 | `PROVISIONAL:register-choice` | lo-hi-register-swap |
| `new-repeated-addr-cse-vs-target-recompute` | 2 | `PROVISIONAL:pool/address-cse` | new-repeated-addr-cse-vs-target-recompute |
| `ov004-core-changed-bool-family-partial` | 2 | `PROVISIONAL:ov004-core-changed-bool-family-partial` | ov004-core-changed-bool-family-partial |
| `p-17` | 2 | `P-17` | formal anchor |
| `predication-resistance-new` | 2 | `PROVISIONAL:predication/branch` | predication-resistance-new |
| `reg-alloc-stack-footprint-mismatch` | 2 | `PROVISIONAL:register-allocation` | reg-alloc-stack-footprint-mismatch |
| `register-numbering-permutation-cascade` | 2 | `P-30` | register-numbering-permutation-cascade |
| `scheduling-wall` | 2 | `P-36` | scheduling-wall |
| `sp3-dead-store-stack-pad-reg-pressure` | 2 | `PROVISIONAL:frame/epilogue` | sp3-dead-store-stack-pad-reg-pressure |
| `xor-order` | 2 | `PROVISIONAL:xor-order` | xor-order |
| `64bit-compare-reg-pressure` | 1 | `PROVISIONAL:64bit-compare-reg-pressure` | 64bit-compare-reg-pressure |
| `ANDS-vs-TST-instruction-choice` | 1 | `PROVISIONAL:ands-vs-tst-instruction-choice` | ANDS-vs-TST-instruction-choice |
| `C-23-C-36` | 1 | `C-23+C-36` | C-23-C-36 |
| `C-31` | 1 | `C-31` | formal anchor |
| `C-32-cross-overlay-bl` | 1 | `C-32` | cross-overlay-bl |
| `C-55-observed` | 1 | `C-55` | observed |
| `C-65-store-strength-reduction-confirmed` | 1 | `C-65` | store-strength-reduction-confirmed |
| `C-65-strength-reduction` | 1 | `C-65` | strength-reduction |
| `CSE-resistant-reverse-direction` | 1 | `PROVISIONAL:pool/address-cse` | CSE-resistant-reverse-direction |
| `OQ-1-dead-branch-preservation` | 1 | `PROVISIONAL:oq-1-dead-branch-preservation` | OQ-1-dead-branch-preservation |
| `P-1-adjacent-shift-pair-permanent` | 1 | `P-1` | adjacent-shift-pair-permanent |
| `P-1-shift-pair-vs-mask-collapse-halfword-zeroextend` | 1 | `P-1` | shift-pair-vs-mask-collapse-halfword-zeroextend |
| `P-17-commutative-add-operand-order` | 1 | `P-17` | commutative-add-operand-order |
| `P-20-3register-permutation` | 1 | `P-20` | 3register-permutation |
| `P-20-base-ptr-rescratch-after-calls` | 1 | `P-20` | base-ptr-rescratch-after-calls |
| `P-20-cmp-operand-r0-r1-swap` | 1 | `P-20` | cmp-operand-r0-r1-swap |
| `P-20-confirmed` | 1 | `P-20` | confirmed |
| `P-20-dead-stackword-register` | 1 | `P-20` | dead-stackword-register |
| `P-20-dual-register-swap` | 1 | `P-20` | dual-register-swap |
| `P-20-final-add-register-choice` | 1 | `P-20` | final-add-register-choice |
| `P-20-guard-merge-residual` | 1 | `P-20` | guard-merge-residual |
| `P-20-leaf-r0r1-choice` | 1 | `P-20` | leaf-r0r1-choice |
| `P-20-lr-reuse-vs-r5-allocation` | 1 | `P-20` | lr-reuse-vs-r5-allocation |
| `P-20-lr-vs-ip` | 1 | `P-20` | lr-vs-ip |
| `P-20-mla-dest-register` | 1 | `P-20` | mla-dest-register |
| `P-20-mul-dest-cascade` | 1 | `P-20` | mul-dest-cascade |
| `P-20-r0-vs-ip` | 1 | `P-20` | r0-vs-ip |
| `P-20-r0-vs-r1` | 1 | `P-20` | r0-vs-r1 |
| `P-20-r0-vs-r2` | 1 | `P-20` | r0-vs-r2 |
| `P-20-r0-vs-r3-scratch` | 1 | `P-20` | r0-vs-r3-scratch |
| `P-20-r1-vs-r2-and-r2-vs-r3-double-swap` | 1 | `P-20` | r1-vs-r2-and-r2-vs-r3-double-swap |
| `P-20-r2-vs-ip` | 1 | `P-20` | r2-vs-ip |
| `P-20-r2r3-swap` | 1 | `P-20` | r2r3-swap |
| `P-20-r2r3-swap-post-doubleshift` | 1 | `P-20` | r2r3-swap-post-doubleshift |
| `P-20-r3-vs-ip` | 1 | `P-20` | r3-vs-ip |
| `P-20-r4-lr-swap` | 1 | `P-20` | r4-lr-swap |
| `P-20-r4-vs-lr` | 1 | `P-20` | r4-vs-lr |
| `P-20-r4r5-swap` | 1 | `P-20` | r4r5-swap |
| `P-20-r8-vs-r9-const-vs-masked-swap` | 1 | `P-20` | r8-vs-r9-const-vs-masked-swap |
| `P-20-redundant-const-preserve` | 1 | `P-20` | redundant-const-preserve |
| `P-20-reg-alloc` | 1 | `P-20` | reg-alloc |
| `P-20-regalloc-plus-imm-fold` | 1 | `P-20` | regalloc-plus-imm-fold |
| `P-20-register-permutation` | 1 | `P-20` | register-permutation |
| `P-20-register-swap-plus-scheduling` | 1 | `P-20` | register-swap-plus-scheduling |
| `P-20-scratch-reg-swap` | 1 | `P-20` | scratch-reg-swap |
| `P-20-scratch-register` | 1 | `P-20` | scratch-register |
| `P-20-self-overwrite-deref` | 1 | `P-20` | self-overwrite-deref |
| `P-23-confirmed` | 1 | `P-23` | confirmed |
| `P-29-mirror-mla-fusion-resistant` | 1 | `P-29` | mirror-mla-fusion-resistant |
| `P-3-constant-materialization` | 1 | `P-3` | constant-materialization |
| `P-30-adjacent-reg-pressure` | 1 | `P-30` | adjacent-reg-pressure |
| `P-30-parameter-register-rotation` | 1 | `P-30` | parameter-register-rotation |
| `P-30-scratch-register-choice` | 1 | `P-30` | scratch-register-choice |
| `P-31-canary-shape-negative` | 1 | `P-31` | canary-shape-negative |
| `P-31-if-conversion` | 1 | `P-31` | if-conversion |
| `P-31-if-conversion-mirrored` | 1 | `P-31` | if-conversion-mirrored |
| `P-31-inverted-partial-predication` | 1 | `P-31` | inverted-partial-predication |
| `P-31-mirror-C55` | 1 | `P-31` | mirror-C55 |
| `P-31-reverse-wants-predication-got-branch` | 1 | `P-31` | reverse-wants-predication-got-branch |
| `P-31-tail-guard-if-conversion` | 1 | `P-31` | tail-guard-if-conversion |
| `P-31-tier-independent` | 1 | `P-31` | tier-independent |
| `P-32-scope-caveat` | 1 | `P-32` | scope-caveat |
| `P-32/P-33/C-45-ext` | 1 | `P-32+P-33+C-45` | P-32/P-33/C-45-ext |
| `P-33-adjacent-register-reuse` | 1 | `P-33` | adjacent-register-reuse |
| `P-33-bidirectional-mirror` | 1 | `P-33` | bidirectional-mirror |
| `P-35-subs-flag-fusion` | 1 | `P-35` | subs-flag-fusion |
| `P-36-address-hoist-across-branch` | 1 | `P-36` | address-hoist-across-branch |
| `P-36-adjacent` | 1 | `P-36` | adjacent |
| `P-36-adjacent-const-materialization` | 1 | `P-36` | adjacent-const-materialization |
| `P-36-adjacent-field-chain-interleave` | 1 | `P-36` | adjacent-field-chain-interleave |
| `P-36-adjacent-source-invariant` | 1 | `P-36` | adjacent-source-invariant |
| `P-36-adjacent-strength-reduction-plus-param-register-order` | 1 | `P-36` | adjacent-strength-reduction-plus-param-register-order |
| `P-36-argument-eval-order` | 1 | `P-36` | argument-eval-order |
| `P-36-boolean-materialization-order` | 1 | `P-36` | boolean-materialization-order |
| `P-36-call-adjacent-scheduling` | 1 | `P-36` | call-adjacent-scheduling |
| `P-36-cand-cmp-moveq-movne-order` | 1 | `P-36` | cand-cmp-moveq-movne-order |
| `P-36-cand-field-read-order` | 1 | `P-36` | cand-field-read-order |
| `P-36-cmp-vs-movs-canonicalization` | 1 | `P-36` | cmp-vs-movs-canonicalization |
| `P-36-condition-code-family` | 1 | `P-36` | condition-code-family |
| `P-36-const-hoist-across-loop` | 1 | `P-36` | const-hoist-across-loop |
| `P-36-eq-neg1-materialize-order` | 1 | `P-36` | eq-neg1-materialize-order |
| `P-36-instruction-scheduling` | 1 | `P-36` | instruction-scheduling |
| `P-36-ldm-fusion` | 1 | `P-36` | ldm-fusion |
| `P-36-literal-store-order` | 1 | `P-36` | literal-store-order |
| `P-36-load-pair-scheduling` | 1 | `P-36` | load-pair-scheduling |
| `P-36-param-materialize-scheduling` | 1 | `P-36` | param-materialize-scheduling |
| `P-36-pool-load-hoist` | 1 | `P-36` | pool-load-hoist |
| `P-36-ptr-increment-recompute-vs-persist` | 1 | `P-36` | ptr-increment-recompute-vs-persist |
| `P-36-redundant-branch-vs-predication-register-cascade` | 1 | `P-36` | redundant-branch-vs-predication-register-cascade |
| `P-36-reginterleave` | 1 | `P-36` | reginterleave |
| `P-36-store-postindex-fusion` | 1 | `P-36` | store-postindex-fusion |
| `P-36-sub2-pipeline-interleave` | 1 | `P-36` | sub2-pipeline-interleave |
| `P-36-sub5-call-adjacent-pool-schedule` | 1 | `P-36` | sub5-call-adjacent-pool-schedule |
| `P-36-sub9-addr-vs-load-hoist-cascade` | 1 | `P-36` | sub9-addr-vs-load-hoist-cascade |
| `P-36-tail-fallthrough-register-shift` | 1 | `P-36` | tail-fallthrough-register-shift |
| `P-37-free-lr-register-reuse` | 1 | `P-37` | free-lr-register-reuse |
| `P-37-scope-broadening-candidate` | 1 | `P-37` | scope-broadening-candidate |
| `P-38-tentative-void-loop-trailing-epilogue` | 1 | `P-38` | tentative-void-loop-trailing-epilogue |
| `P-39-tentative-dead-eor-flags-downgrade` | 1 | `P-39` | tentative-dead-eor-flags-downgrade |
| `P-4,P-11` | 1 | `P-4+P-11` | P-4,P-11 |
| `P-40-adjacent-mvn-vs-poolload-constant-materialization` | 1 | `P-40` | adjacent-mvn-vs-poolload-constant-materialization |
| `P-40-constant-materialization` | 1 | `P-40` | constant-materialization |
| `P-40-immediate-materialization-add-vs-sub-encoding` | 1 | `P-40` | immediate-materialization-add-vs-sub-encoding |
| `RSB-immediate-constant-fusion-resists-source` | 1 | `PROVISIONAL:rsb-immediate-constant-fusion-resists-source` | RSB-immediate-constant-fusion-resists-source |
| `T-1-r1-vs-r2-scratch-register-renaming` | 1 | `PROVISIONAL:T-1` | T-1-r1-vs-r2-scratch-register-renaming |
| `T-1-r2-vs-r3-scratch-register-renaming` | 1 | `PROVISIONAL:T-1` | T-1-r2-vs-r3-scratch-register-renaming |
| `T-1-r4-vs-r5-first-call-result-register-choice` | 1 | `PROVISIONAL:T-1` | T-1-r4-vs-r5-first-call-result-register-choice |
| `and-shift-pair-collapse` | 1 | `PROVISIONAL:and-shift-pair-collapse` | and-shift-pair-collapse |
| `bitfield-branch` | 1 | `PROVISIONAL:bitfield/bit-pack` | bitfield-branch |
| `bitfield-insert-lowering-and-vs-shift-fusion` | 1 | `PROVISIONAL:bitfield/bit-pack` | bitfield-insert-lowering-and-vs-shift-fusion |
| `bitfield-model` | 1 | `PROVISIONAL:bitfield/bit-pack` | bitfield-model |
| `bitfield-read-lowering-and-vs-shift-plus-r3-push-alloc` | 1 | `PROVISIONAL:bitfield/bit-pack` | bitfield-read-lowering-and-vs-shift-plus-r3-push-alloc |
| `boolean-collapse-vs-orig-double-cmp` | 1 | `PROVISIONAL:predication/branch` | boolean-collapse-vs-orig-double-cmp |
| `branch-polarity-cse` | 1 | `PROVISIONAL:predication/branch` | branch-polarity-cse |
| `byte-pack-mask-form-plus-pool-refold` | 1 | `PROVISIONAL:pool/address-cse` | byte-pack-mask-form-plus-pool-refold |
| `c-23` | 1 | `C-23` | formal anchor |
| `c-58` | 1 | `C-58` | formal anchor |
| `c-59` | 1 | `C-59` | formal anchor |
| `c-63` | 1 | `C-63` | formal anchor |
| `canary-lever-residual-2nd-access` | 1 | `PROVISIONAL:canary-residual` | canary-lever-residual-2nd-access |
| `canary-lever-residual-iplr` | 1 | `PROVISIONAL:canary-residual` | canary-lever-residual-iplr |
| `changed-bool` | 1 | `PROVISIONAL:changed-bool` | changed-bool |
| `cmpne-predication-nonadjacent-or` | 1 | `PROVISIONAL:predication/branch` | cmpne-predication-nonadjacent-or |
| `combined-levers` | 1 | `PROVISIONAL:combined-levers` | combined-levers |
| `complex-216B-leaf-extra-scratch-registers` | 1 | `PROVISIONAL:register-pressure/cascade` | complex-216B-leaf-extra-scratch-registers |
| `complex-372B-global-register-shift` | 1 | `PROVISIONAL:register-pressure/cascade` | complex-372B-global-register-shift |
| `complex-372B-multi-loop-reg-cascade` | 1 | `PROVISIONAL:register-pressure/cascade` | complex-372B-multi-loop-reg-cascade |
| `complex-388B-large-register-pressure-mismatch` | 1 | `PROVISIONAL:register-pressure/cascade` | complex-388B-large-register-pressure-mismatch |
| `complexity` | 1 | `PROVISIONAL:complexity` | complexity |
| `compound-compare-3way` | 1 | `PROVISIONAL:compound-compare-3way` | compound-compare-3way |
| `compound-compare-same-reg` | 1 | `PROVISIONAL:compound-compare-same-reg` | compound-compare-same-reg |
| `condition-fusion-redundant-cmp` | 1 | `PROVISIONAL:predication/branch` | condition-fusion-redundant-cmp |
| `constant-decomposition` | 1 | `PROVISIONAL:constant-materialization` | constant-decomposition |
| `constant-fold-mask-collapse-register-cascade` | 1 | `PROVISIONAL:register-pressure/cascade` | constant-fold-mask-collapse-register-cascade |
| `constant-materialization` | 1 | `PROVISIONAL:constant-materialization` | constant-materialization |
| `constant-materialization-peephole` | 1 | `PROVISIONAL:constant-materialization` | constant-materialization-peephole |
| `constant-zero-register-materialization-not-reproduced` | 1 | `PROVISIONAL:constant-materialization` | constant-zero-register-materialization-not-reproduced |
| `control-flow-structural-mismatch` | 1 | `PROVISIONAL:control-flow-structural-mismatch` | control-flow-structural-mismatch |
| `control-flow-tail-merge` | 1 | `PROVISIONAL:control-flow-tail-merge` | control-flow-tail-merge |
| `cross-call-scratch-reg-reuse-r3-subrow-not-source-forceable` | 1 | `PROVISIONAL:register-choice` | cross-call-scratch-reg-reuse-r3-subrow-not-source-forceable |
| `cross-call-self-and-result-persistence-reg-alloc-mismatch` | 1 | `PROVISIONAL:cross-call-self-and-result-persistence-reg-alloc-mismatch` | cross-call-self-and-result-persistence-reg-alloc-mismatch |
| `cross-overlay-bl-module-none` | 1 | `PROVISIONAL:cross-overlay` | cross-overlay-bl-module-none |
| `dead-call-result-register-reuse` | 1 | `PROVISIONAL:register-choice` | dead-call-result-register-reuse |
| `dead-param-preservation-move-not-elided` | 1 | `PROVISIONAL:dead-param-preservation-move-not-elided` | dead-param-preservation-move-not-elided |
| `dead-until-later-param-register-choice-plus-bitpack` | 1 | `PROVISIONAL:register-choice` | dead-until-later-param-register-choice-plus-bitpack |
| `extra-2-register-cascade` | 1 | `PROVISIONAL:register-pressure/cascade` | extra-2-register-cascade |
| `field-pool-base212-known-wall` | 1 | `PROVISIONAL:pool/address-cse` | field-pool-base212-known-wall |
| `fixed-point-blend-structural-mismatch` | 1 | `PROVISIONAL:fixed-point-blend-structural-mismatch` | fixed-point-blend-structural-mismatch |
| `fn-ptr-field-pool-b6c-dispatch` | 1 | `PROVISIONAL:pool/address-cse` | fn-ptr-field-pool-b6c-dispatch |
| `fold-predication-alloc` | 1 | `PROVISIONAL:predication/branch` | fold-predication-alloc |
| `instr-selection` | 1 | `PROVISIONAL:instruction-selection` | instr-selection |
| `instr-selection-const-materialize` | 1 | `PROVISIONAL:instruction-selection` | instr-selection-const-materialize |
| `large-diff-materialized-bool-mismatch` | 1 | `PROVISIONAL:constant-materialization` | large-diff-materialized-bool-mismatch |
| `large-diff-scheduling-mismatch` | 1 | `P-36` | large-diff-scheduling-mismatch |
| `legacy-prologue-r3-pad-vs-subsp4-register-pressure` | 1 | `PROVISIONAL:register-pressure/cascade` | legacy-prologue-r3-pad-vs-subsp4-register-pressure |
| `load-fusion` | 1 | `PROVISIONAL:memory-order/fusion` | load-fusion |
| `load-order` | 1 | `P-36` | load-order |
| `load-scheduling-interleave` | 1 | `P-36` | load-scheduling-interleave |
| `loop-index-count-register-role-swap-plus-stack-spill-risk` | 1 | `PROVISIONAL:register-choice` | loop-index-count-register-role-swap-plus-stack-spill-risk |
| `loop-invariant-hoist-register-cascade-P36-adjacent` | 1 | `PROVISIONAL:register-pressure/cascade` | loop-invariant-hoist-register-cascade-P36-adjacent |
| `loop-strength-reduction-plus-uncertain-div256-idiom` | 1 | `C-65` | loop-strength-reduction-plus-uncertain-div256-idiom |
| `loop-strength-reduction-register-role-cascade-P36-adjacent` | 1 | `PROVISIONAL:register-choice` | loop-strength-reduction-register-role-cascade-P36-adjacent |
| `materialized-bool-global` | 1 | `PROVISIONAL:constant-materialization` | materialized-bool-global |
| `memory-width` | 1 | `PROVISIONAL:memory-width` | memory-width |
| `missing-char-reload-spill` | 1 | `PROVISIONAL:missing-char-reload-spill` | missing-char-reload-spill |
| `mla-operand-order-register-numbering-P17-adjacent` | 1 | `PROVISIONAL:mla-operand-order-register-numbering-p17-adjacent` | mla-operand-order-register-numbering-P17-adjacent |
| `multi-table-reg-numbering` | 1 | `P-30` | multi-table-reg-numbering |
| `neg1-materialization-reg-swap` | 1 | `PROVISIONAL:constant-materialization` | neg1-materialization-reg-swap |
| `new-bitswap-scratch-register-pressure` | 1 | `PROVISIONAL:register-pressure/cascade` | new-bitswap-scratch-register-pressure |
| `new-imm-offset-truncation-fold` | 1 | `PROVISIONAL:new-imm-offset-truncation-fold` | new-imm-offset-truncation-fold |
| `optimizer-collapse` | 1 | `PROVISIONAL:instruction-selection` | optimizer-collapse |
| `ov011-core-documented-1reg-wall` | 1 | `PROVISIONAL:ov011-core-documented-1reg-wall` | ov011-core-documented-1reg-wall |
| `ov011-core-documented-multifield-rmw-wall` | 1 | `PROVISIONAL:ov011-core-documented-multifield-rmw-wall` | ov011-core-documented-multifield-rmw-wall |
| `ov011-core-multifield-rmw-wall-stack-variant` | 1 | `PROVISIONAL:frame/epilogue` | ov011-core-multifield-rmw-wall-stack-variant |
| `permanent-header` | 1 | `PROVISIONAL:permanent-header` | permanent-header |
| `permuter-class-register-mirror` | 1 | `PROVISIONAL:register-choice` | permuter-class-register-mirror |
| `pool-constant-caching-resistance` | 1 | `PROVISIONAL:constant-materialization` | pool-constant-caching-resistance |
| `post-call-scratch-scheduling-cascade` | 1 | `P-36` | post-call-scratch-scheduling-cascade |
| `preamble-sink-scheduling` | 1 | `P-36` | preamble-sink-scheduling |
| `predicated-flag-scheduling-interleave` | 1 | `PROVISIONAL:predication/branch` | predicated-flag-scheduling-interleave |
| `predicated-pointer-vs-value-choice-on-final-compare` | 1 | `PROVISIONAL:predication/branch` | predicated-pointer-vs-value-choice-on-final-compare |
| `predication-vs-branch-dual-assignment` | 1 | `PROVISIONAL:predication/branch` | predication-vs-branch-dual-assignment |
| `reciprocal-division-register-numbering-cascade` | 1 | `PROVISIONAL:reciprocal-division-register-numbering-cascade` | reciprocal-division-register-numbering-cascade |
| `reg-alloc-2nd-loop-addressing` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-2nd-loop-addressing |
| `reg-alloc-arg-spill-mismatch` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-arg-spill-mismatch |
| `reg-alloc-diverge-stmia-merge` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-diverge-stmia-merge |
| `reg-alloc-early-coordinate-swap-persistent-across-phrasings` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-early-coordinate-swap-persistent-across-phrasings |
| `reg-alloc-extra-mov` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-extra-mov |
| `reg-alloc-instr-scheduling` | 1 | `PROVISIONAL:register-allocation+scheduling` | reg-alloc-instr-scheduling |
| `reg-alloc-interleaved-bitfield-extraction-forces-r5-spill` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-interleaved-bitfield-extraction-forces-r5-spill |
| `reg-alloc-missing-store-reload-roundtrip-for-multi-read-bitfield` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-missing-store-reload-roundtrip-for-multi-read-bitfield |
| `reg-alloc-preamble-mismatch` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-preamble-mismatch |
| `reg-alloc-predication` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-predication |
| `reg-alloc-preexisting-global-asm-wall` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-preexisting-global-asm-wall |
| `reg-alloc-scratch-register-choice-ip-vs-r0-persistent` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-scratch-register-choice-ip-vs-r0-persistent |
| `reg-alloc-single-load-dest-choice-persistent` | 1 | `PROVISIONAL:register-allocation` | reg-alloc-single-load-dest-choice-persistent |
| `regalloc-cascade-unresolved` | 1 | `PROVISIONAL:register-pressure/cascade` | regalloc-cascade-unresolved |
| `register-choice-post-call-mov-before-const` | 1 | `PROVISIONAL:register-choice` | register-choice-post-call-mov-before-const |
| `register-choice-post-guard` | 1 | `PROVISIONAL:register-choice` | register-choice-post-guard |
| `register-choice-residual-v-flags-swap` | 1 | `PROVISIONAL:register-choice` | register-choice-residual-v-flags-swap |
| `register-pressure-cascade-dual-advancing-pointers` | 1 | `PROVISIONAL:register-pressure/cascade` | register-pressure-cascade-dual-advancing-pointers |
| `register-pressure-passthrough-args-vs-computed` | 1 | `PROVISIONAL:register-pressure/cascade` | register-pressure-passthrough-args-vs-computed |
| `register-reuse-preference` | 1 | `PROVISIONAL:register-choice` | register-reuse-preference |
| `register-role-rotation-field2-holder` | 1 | `PROVISIONAL:register-choice` | register-role-rotation-field2-holder |
| `register-role-rotation-side-count-array-idx` | 1 | `PROVISIONAL:register-choice` | register-role-rotation-side-count-array-idx |
| `register-role-rotation-side-rec-cat-idx` | 1 | `PROVISIONAL:register-choice` | register-role-rotation-side-rec-cat-idx |
| `register-spill-pressure-8-live-values` | 1 | `PROVISIONAL:register-spill-pressure-8-live-values` | register-spill-pressure-8-live-values |
| `row-address-mla-add-operand-register-order-not-source-forceable` | 1 | `PROVISIONAL:pool/address-cse` | row-address-mla-add-operand-register-order-not-source-forceable |
| `scheduler-interleave-reg-swap` | 1 | `P-36` | scheduler-interleave-reg-swap |
| `scheduling-cmp-reuse` | 1 | `P-36` | scheduling-cmp-reuse |
| `scheduling-order` | 1 | `P-36` | scheduling-order |
| `self-vs-scratch-register-swap` | 1 | `PROVISIONAL:register-choice` | self-vs-scratch-register-swap |
| `sibling-constant-arithmetic-reuse` | 1 | `PROVISIONAL:sibling-constant-arithmetic-reuse` | sibling-constant-arithmetic-reuse |
| `smulbb-instruction-selection-and-r5-reuse-residual` | 1 | `PROVISIONAL:instruction-selection` | smulbb-instruction-selection-and-r5-reuse-residual |
| `statement-order` | 1 | `P-36` | statement-order |
| `stm-burst-needs-asm` | 1 | `PROVISIONAL:inline-asm` | stm-burst-needs-asm |
| `stmib-grouping-scheduling` | 1 | `P-36` | stmib-grouping-scheduling |
| `stmib-grouping-scheduling-p7-split` | 1 | `P-36` | stmib-grouping-scheduling-p7-split |
| `store-coalescing` | 1 | `PROVISIONAL:memory-order/fusion` | store-coalescing |
| `store-order` | 1 | `PROVISIONAL:memory-order/fusion` | store-order |
| `struct-by-value-return-abi` | 1 | `PROVISIONAL:struct-by-value-return-abi` | struct-by-value-return-abi |
| `switch-jumptable-inline-bxlr-vs-shared-branch-consolidation` | 1 | `PROVISIONAL:switch-jumptable-inline-bxlr-vs-shared-branch-consolidation` | switch-jumptable-inline-bxlr-vs-shared-branch-consolidation |
| `tier-verification-inferior` | 1 | `PROVISIONAL:tier-verification-inferior` | tier-verification-inferior |
| `unclear` | 1 | `PROVISIONAL:unclear` | unclear |
| `unsigned-cast` | 1 | `PROVISIONAL:unsigned-cast` | unsigned-cast |
