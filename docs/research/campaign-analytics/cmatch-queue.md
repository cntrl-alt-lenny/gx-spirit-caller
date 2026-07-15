# Unified readable-C C-match queue (Brief 580)

Build-free merge of the main-module census (brief 559), overlay census
(brief 564), and parked/floor ledger (brief 568). Statuses below were
rechecked against tracked `src/**/func_<address>*.s` and `.c` files on
2026-07-15; the older census status prose was not used as the source of
truth. A `.legacy.c` file counts as a `.c` file for the requested wildcard.

`Prep dossier = y` means at least one listed member has a tracked
`docs/research/c-match-prep/<address>.c` dossier; `n` means none do. The
permanent-floor row is placed in the required parked bucket even though its
diff-type is an ISA wall rather than a compiler near-miss.

Ranking is mechanical: open anchored families first, then open anchorless
families, then active overlay work, then parked near-misses/floor, with DONE
families at the bottom for recordkeeping. `IN-FLIGHT` is used only for the
overlay families covered by brief 579. For family-level status, DONE requires
every listed member in its stated module to have a tracked `.c` and no tracked
`.s`.

| Rank | Family | Member addresses | Module | Prep dossier | STATUS | ANCHORED? |
|---:|---|---|---|:---:|---|:---:|
| 1 | ov020 parameter-pack sibling quad | `ov020:021ab8f8`, `ov020:021ab964`, `ov020:021aba54`, `ov020:021abac0` | `overlay020` | y | IN-FLIGHT | no |
| 2 | RGB555 min/max sibling trio | `ov018:021ace68`, `ov020:021ada74`, `ov022:021ab4b0` | `overlay018`, `overlay020`, `overlay022` | y | IN-FLIGHT | no |
| 3 | HSV/RGB magic-multiply sibling trio | `ov018:021acf80`, `ov020:021adb8c`, `ov022:021ab5c8` | `overlay018`, `overlay020`, `overlay022` | y | IN-FLIGHT | no |
| 4 | Cross-overlay 472B dialog-setup siblings | `ov009:021aaaec`, `ov016:021b5dd0` | `overlay009`, `overlay016` | n | IN-FLIGHT | no |
| 5 | ov017/ov019 divmod-pack siblings | `ov017:021b7dac`, `ov019:021b5948` | `overlay017`, `overlay019` | y | IN-FLIGHT | no |
| 6 | ov010/ov015 double-switch siblings | `ov010:021b32ac`, `ov015:021b2df8` | `overlay010`, `overlay015` | n | IN-FLIGHT | no |
| 7 | ov010/ov015 guard/store siblings | `ov010:021b6b58`, `ov010:021b46a8`, `ov015:021b3f98` | `overlay010`, `overlay015` | y | IN-FLIGHT | no |
| 8 | Branch-table constant-return | `02047fb8`, `02048880`, `0204ab88` | `main` | y | PARKED-NEAR-MISS | no |
| 9 | Guard-chain clone | `02089df8`, `02089e70`, `02089ee8` | `main` | y | PARKED-NEAR-MISS | no |
| 10 | MMIO-extract quad | `0208df0c`, `0208df60`, `0208e1cc`, `0208e220` | `main` | y | PARKED-NEAR-MISS | no |
| 11 | 64-bit LCG state update | `0207103c` | `main` | y | PARKED-NEAR-MISS | no |
| 12 | Volatile-load destination | `02078ebc` | `main` | y | PARKED-NEAR-MISS | no |
| 13 | Main MED immediate decomposition | `0202e5ac` | `main` | y | PARKED-NEAR-MISS | no |
| 14 | Park-Miller mask lowering | `02054b44` | `main` | y | PARKED-NEAR-MISS | no |
| 15 | DISPCNT/BG3CNT scheduling | `0208ddec` | `main` | y | PARKED-NEAR-MISS | no |
| 16 | Register-substitution loop | `02010a98` | `main` | y | PARKED-NEAR-MISS | no |
| 17 | Jump-table construction | `0201934c` | `main` | y | PARKED-NEAR-MISS | no |
| 18 | Byte-swap chain | `0201d620` | `main` | y | PARKED-NEAR-MISS | no |
| 19 | Overlay role-swap pair | `ov006:021b79ac`, `ov005:021ac91c` | `overlay006`, `overlay005` | n | PARKED-NEAR-MISS | no |
| 20 | Overlay register-choice follow-up | `ov006:021b5f60` | `overlay006` | n | PARKED-NEAR-MISS | no |
| 21 | Overlay contained reg-alloc pair | `ov005:021ac91c`, `ov006:021b7a20` | `overlay005`, `overlay006` | n | PARKED-NEAR-MISS | no |
| 22 | Bitfield Pattern-B candidate | `0200dd58` | `main` | y | PARKED-NEAR-MISS | no |
| 23 | Main register-pressure candidate | `02072444` | `main` | y | PARKED-NEAR-MISS | no |
| 24 | Main prologue footprint candidate | `0205340c` | `main` | y | PARKED-NEAR-MISS | no |
| 25 | Overlay tail register swap | `ov000:021ae218` | `overlay000` | n | PARKED-NEAR-MISS | no |
| 26 | Main loop register-role candidate | `020384e8` | `main` | y | PARKED-NEAR-MISS | no |
| 27 | Overlay parity-tail candidate | `ov002:021b0a30` | `overlay002` | n | PARKED-NEAR-MISS | no |
| 28 | Overlay type-dispatch candidate | `ov002:0228791c` | `overlay002` | n | PARKED-NEAR-MISS | no |
| 29 | ISA-permanent system-instruction floor | `main`: `02000950`, `020009fc`, `02000a78`, `020922d8`, `02092324`, `0209286c`, `02092898`, `020928cc`, `020928e8`, `02092904`, `02092940`, `02092e38`, `02092e90`, `02092f18`, `02092fa8`, `02093790`, `020937d0`, `020937e4`, `020937fc`, `02093808`, `020b2978`, `020b2a10`, `020b2ab4`, `020b2b50`, `020b2bdc`, `020b2c68`, `020b2cc4`, `020b41c0`, `020b41d4`, `020b41e8`; `jpn/main`: `02000950`, `020009fc`, `02000a78`, `020921f0`, `0209223c`, `02092784`, `020927b0`, `020927e4`, `02092800`, `0209281c`, `02092858`, `02092d50`, `02092da8`, `02092e30`, `02092ec0`, `020936a8`, `020936e8`, `020936fc`, `02093714`, `020b2884`, `020b291c`, `020b29c0`, `020b2a5c`, `020b2ae8`, `020b2b74`, `020b2bd0`; `usa/main`: `02000950`, `020009fc`, `02000a78`, `020921f0`, `0209223c`, `02092784`, `020927b0`, `020927e4`, `02092800`, `0209281c`, `02092858`, `02092d50`, `02092da8`, `02092e30`, `02092ec0`, `020936a8`, `020936e8`, `020936fc`, `02093714`, `020b2884`, `020b291c`, `020b29c0`, `020b2a5c`, `020b2ae8`, `020b2b74`, `020b2bd0` | `main`, `jpn/main`, `usa/main` | y | PARKED-NEAR-MISS | no |
| 30 | VRAM threshold-dispatch family (16) | `0208f6b0`, `0208f718`, `0208f780`, `0208f7e8`, `0208f850`, `0208f8b8`, `0208f920`, `0208f988`, `0208f9f0`, `0208fa58`, `0208fac0`, `0208fb28`, `0208fb90`, `0208fbf8`, `0208fc60`, `0208fcc8` | `main` | y | DONE | yes |
| 31 | Literal-base dispatch sibling quad | `0208fdf0`, `0208feb4`, `0208ff1c`, `0208ff84` | `main` | y | DONE | no |

The `usa/main` permanent-floor member list in rank 29 is the same explicit
26-address list shown for `jpn/main`: `02000950`, `020009fc`, `02000a78`,
`020921f0`, `0209223c`, `02092784`, `020927b0`, `020927e4`, `02092800`,
`0209281c`, `02092858`, `02092d50`, `02092da8`, `02092e30`, `02092ec0`,
`020936a8`, `020936e8`, `020936fc`, `02093714`, `020b2884`, `020b291c`,
`020b29c0`, `020b2a5c`, `020b2ae8`, `020b2b74`, `020b2bd0`.

## Parked diff-types

The PARKED-NEAR-MISS rows retain the exact diff-type from brief 568:

- `02047fb8` family — mwcc constant-rematerialization, 24 bytes.
- `02089df8` family — stack-layout codegen coin-flip, 12 bytes.
- `0208df0c` family — residual MMIO load-destination register numbering, 4 bytes.
- `0207103c` — 64-bit scheduling/permuter wall; `orr` copy overhead.
- `02078ebc` — `ldrh r1` versus `ldrh r0` volatile-load destination wall.
- `0202e5ac` — compiler-internal jump-table immediate decomposition.
- `02054b44` — compiler-fixed low-halfword mask lowering idiom.
- `0208ddec` — early `ldrh bg` scheduling relative to `cmp mode,#3`.
- `02010a98` — systemic `ip/r12` versus `lr/r14` register-field substitutions.
- `0201934c` — case-body sharing/direct-`bx lr` target selection.
- `0201d620` — 15-instruction scheduling/register-allocation mismatch.
- `021b79ac`/`021ac91c` — contained overlay register-role swaps.
- `021b5f60` — one overlay register-choice issue after call ordering was fixed.
- `021ac91c`/`021b7a20` — contained overlay register-allocation schedule mismatch.
- `0200dd58` — stable Pattern-B register-role swap.
- `02072444` — first-instruction `n/q` register-choice difference.
- `0205340c` — prologue register-footprint difference.
- `021ae218` — persistent `r0`/`r1` swap across the bit-test sequence.
- `020384e8` — `sum` loop `n`/scratch register-role swap.
- `021b0a30` — predicated-tail versus duplicated-branch shape mismatch.
- `0228791c` — fused bit-XOR sequence versus original unfused form.
- ISA floor — `mcr`/`mrc`/`swi`/`msr`/`mrs`; inline-asm-wrapper only.

## Counts

- Open anchored families: **0**.
- Open anchorless families: **0** (the two formerly open main families are
  parked near-misses in the unified ledger).
- In-flight overlay families (all anchorless): **7**.
- Parked families: **22** (21 near-miss rows plus the permanent floor row).
- Done families: **2**.

The overlay rows are counted separately because their required status is
`IN-FLIGHT`, not `OPEN`; they remain `.s`-backed while brief 579 is active.
No build, compiler, baserom, or generated index step is required for this
doc-only queue.
