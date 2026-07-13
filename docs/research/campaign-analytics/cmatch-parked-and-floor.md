# C-match parked and permanent floor ledger

Brief 568 · 2026-07-13  
Scope: build-free transcription of committed research findings. Parked rows
remain `.s`; no source or delink changes are implied by this catalog.

## NEAR-MISS PARKED families

These rows are documented near-misses or permuter-class parks, not fresh
attempts. Distances are copied only where the source states them.

| Family / candidate | Addresses | Exact diff-type | Byte-distance / source |
|---|---|---|---|
| Branch-table constant-return | `02047fb8`, `02048880`, `0204ab88` | mwcc constant-rematerialization: `sub` from a live register instead of independent `mvn`; source order cannot force both value order and emission order | 24 bytes; Brief 562 |
| Guard-chain clone | `02089df8`, `02089e70`, `02089ee8` | stack-layout codegen coin-flip: push/pop-folded outgoing slot vs explicit `sub/add sp`; residual fused guard also remained | 12 bytes; Brief 562 |
| MMIO-extract quad | `0208df0c`, `0208df60`, `0208e1cc`, `0208e220` | after C-23 MMIO base-folding was fixed through `.legacy.c`, residual register-numbering mismatch in MMIO load destination | 4 bytes; Brief 562 |
| 64-bit LCG state update | `0207103c` | mwcc 64-bit scheduling/permuter wall; `orr` register-copy overhead before `adds/adc` | 69 diff bytes / 6 runs; Briefs 520, 527 |
| Volatile-load destination | `02078ebc` | `ldrh r1` vs `ldrh r0` volatile-load destination wall | 1 diff byte / 1 run; Brief 520 |
| Main MED immediate decomposition | `0202e5ac` | compiler-internal jump-table immediate decomposition: one `add+sub` in original vs two `sub`s in C | distance not stated; permuter-class; Brief 527 |
| Park-Miller mask lowering | `02054b44` | low-halfword mask lowering: original AND-with-pool constants vs mwcc shift pairs | distance not stated; compiler-fixed idiom; Brief 527 |
| DISPCNT/BG3CNT scheduling | `0208ddec` | `ldrh bg` scheduled early in C instead of after `cmp mode,#3`; explicit park criterion | distance not stated; permuter-class; Brief 527 |
| Register-substitution loop | `02010a98` | systemic `ip/r12` vs `lr/r14` and related register-field substitutions across loop body | 20 bytes; Brief 528 |
| Jump-table construction | `0201934c` | case-body sharing/direct-`bx lr` target selection differs; dense case-label reshapes had no effect | 17 bytes; Brief 528 |
| Byte-swap chain | `0201d620` | 15-instruction scheduling/register-allocation mismatch | distance not stated; permuter-class; Brief 528 |
| Overlay role-swap pair | `021b79ac`, `021ac91c` | contained, value-correct register-role swaps; `dst/table base` and `row-counter/loop-index` assignments resist reordering | distance not stated; Brief 523 |
| Overlay register-choice follow-up | `021b5f60` | call-ordering fixed, one register-choice issue remains | 60 → 28 byte diff during investigation; Brief 525 |
| Overlay contained reg-alloc pair | `021ac91c`, `021b7a20` | contained register-allocation schedule mismatch; semantically correct | 38 bytes / 8 runs each; Brief 529 |
| Bitfield Pattern-B candidate | `0200dd58` | stable register-role swap (`r0/r1` vs `r1/r2`) after shape fix; natural C reshapes identical | 20 bytes / 11 runs; permuter-class; Briefs 533, 535 |
| Main register-pressure candidate | `02072444` | first-instruction register-choice difference in `n/q` computation; reorder had no effect | 35 bytes; Brief 530 |
| Main prologue footprint candidate | `0205340c` | prologue register-footprint difference; reshape worsened contained miss into avalanche | 90-byte contained miss; Brief 530 |
| Overlay tail register swap | `021ae218` | persistent `r0↔r1` swap for `f270` across bit-test sequence | 6 bytes; Brief 536 |
| Main loop register-role candidate | `020384e8` | `sum` loop `n`/scratch pair remains `r1↔r2` after three restructurings | distance not stated; Brief 536 |
| Overlay parity-tail candidate | `021b0a30` | tail stuck between over-optimized predicated `eorNE` and duplicated-branch form; neither matches original | alternate form 208B vs 224B around 220B target; Brief 536 |
| Overlay type-dispatch candidate | `0228791c` | mwcc fuses a bit-XOR sequence that original leaves un-fused | final 4 bytes; Brief 536 |

The rows above are the parked near-miss/permuter catalog. Older notes also
contain avalanche parks and explicitly untried candidates; those are not
near-miss families and are intentionally not relabeled as such here.

## PERMANENT FLOOR

The exact build-free command requested for this ledger:

```text
git grep -lE '\b(mcr|mrc|swi|msr|mrs)\b' -- 'src/**/*.s'
```

These files carry coprocessor/SWI/system-register instructions that have no C
operator equivalent. Mark them **ISA-permanent: inline-asm-wrapper only; do
not spend lever/permuter effort**.

The command returned **94 files**: **42** canonical `src/main` files, **26**
JPN files, and **26** USA files.

### Canonical `src/main` (42)

- `src/main/BitUnPack.s`
- `src/main/Div.s`
- `src/main/GetCRC16.s`
- `src/main/IsDebugger.s`
- `src/main/LZ77UnCompReadByCallbackWrite16bit.s`
- `src/main/Mod.s`
- `src/main/OS_DisableIrq.s`
- `src/main/OS_RestoreIrq.s`
- `src/main/RLUnCompReadByCallbackWrite16bit.s`
- `src/main/RLUnCompReadNormalWrite8bit.s`
- `src/main/SoftReset.s`
- `src/main/VBlankIntrWait.s`
- `src/main/func_02000950.s`
- `src/main/func_020009fc.s`
- `src/main/func_02000a78.s`
- `src/main/func_020922d8.s`
- `src/main/func_02092324.s`
- `src/main/func_0209286c.s`
- `src/main/func_02092898.s`
- `src/main/func_020928cc.s`
- `src/main/func_020928e8.s`
- `src/main/func_02092904.s`
- `src/main/func_02092940.s`
- `src/main/func_02092e38.s`
- `src/main/func_02092e90.s`
- `src/main/func_02092f18.s`
- `src/main/func_02092fa8.s`
- `src/main/func_02093790.s`
- `src/main/func_020937d0.s`
- `src/main/func_020937e4.s`
- `src/main/func_020937fc.s`
- `src/main/func_02093808.s`
- `src/main/func_020b2978.s`
- `src/main/func_020b2a10.s`
- `src/main/func_020b2ab4.s`
- `src/main/func_020b2b50.s`
- `src/main/func_020b2bdc.s`
- `src/main/func_020b2c68.s`
- `src/main/func_020b2cc4.s`
- `src/main/func_020b41c0.s`
- `src/main/func_020b41d4.s`
- `src/main/func_020b41e8.s`

### JPN (26)

- `src/jpn/main/func_02000950.s`
- `src/jpn/main/func_020009fc.s`
- `src/jpn/main/func_02000a78.s`
- `src/jpn/main/func_020921f0.s`
- `src/jpn/main/func_0209223c.s`
- `src/jpn/main/func_02092784.s`
- `src/jpn/main/func_020927b0.s`
- `src/jpn/main/func_020927e4.s`
- `src/jpn/main/func_02092800.s`
- `src/jpn/main/func_0209281c.s`
- `src/jpn/main/func_02092858.s`
- `src/jpn/main/func_02092d50.s`
- `src/jpn/main/func_02092da8.s`
- `src/jpn/main/func_02092e30.s`
- `src/jpn/main/func_02092ec0.s`
- `src/jpn/main/func_020936a8.s`
- `src/jpn/main/func_020936e8.s`
- `src/jpn/main/func_020936fc.s`
- `src/jpn/main/func_02093714.s`
- `src/jpn/main/func_020b2884.s`
- `src/jpn/main/func_020b291c.s`
- `src/jpn/main/func_020b29c0.s`
- `src/jpn/main/func_020b2a5c.s`
- `src/jpn/main/func_020b2ae8.s`
- `src/jpn/main/func_020b2b74.s`
- `src/jpn/main/func_020b2bd0.s`

### USA (26)

- `src/usa/main/func_02000950.s`
- `src/usa/main/func_020009fc.s`
- `src/usa/main/func_02000a78.s`
- `src/usa/main/func_020921f0.s`
- `src/usa/main/func_0209223c.s`
- `src/usa/main/func_02092784.s`
- `src/usa/main/func_020927b0.s`
- `src/usa/main/func_020927e4.s`
- `src/usa/main/func_02092800.s`
- `src/usa/main/func_0209281c.s`
- `src/usa/main/func_02092858.s`
- `src/usa/main/func_02092d50.s`
- `src/usa/main/func_02092da8.s`
- `src/usa/main/func_02092e30.s`
- `src/usa/main/func_02092ec0.s`
- `src/usa/main/func_020936a8.s`
- `src/usa/main/func_020936e8.s`
- `src/usa/main/func_020936fc.s`
- `src/usa/main/func_02093714.s`
- `src/usa/main/func_020b2884.s`
- `src/usa/main/func_020b291c.s`
- `src/usa/main/func_020b29c0.s`
- `src/usa/main/func_020b2a5c.s`
- `src/usa/main/func_020b2ae8.s`
- `src/usa/main/func_020b2b74.s`
- `src/usa/main/func_020b2bd0.s`

