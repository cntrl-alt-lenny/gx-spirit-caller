# q-port-residual-recover

**Asked:** Characterise the USA/JPN sim==1.0 port residual, recover compiler-error classes where the tools prove them safe, and establish the exact treatment of the alias and missing-symbol cases.

**Result:** 60 ports shipped: 30 USA and 30 JPN. The 23 D016C and 8 CE288 gate-fail classes were not byte mismatches. Twenty D016C functions and all eight CE288 functions became byte-exact after the region-header compatibility aliases; three D016C functions per region remain blocked by the compiler's declaration-order syntax. The data-alias and missing-symbol cases were also recovered after adding the required target metadata/linker labels.

## Reproducible census

The starting residual was obtained from `brief-1397`'s tool output: 32 gate-fails per region, consisting of 23 D016C compiler errors, 8 CE288 compiler errors, and one `data_0219a92c_alias` undefined-symbol link error. The separate one-row `needs-symbols.txt-line` case was `func_ov002_022aaea8` in each region.

The direct MWCC census used the same compiler flags as `configure.py`, with `port_to_region.py --json` as the source generator and the target-region header include path. It produced this histogram for each region:

| Source trigger | USA | JPN | Result |
|---|---:|---:|---|
| Bare EUR `D016C` macro, target header had only `D008C` | 20 compile | 20 compile | shipped and ROM-gated |
| Same `D016C` macro plus declaration after executable statement | 3 compile errors | 3 compile errors | parked: MWCC reports expression syntax / undefined local |
| Bare EUR `CE288` macro, target header had only `CE1A8` | 8 compile | 8 compile | shipped and ROM-gated |
| `data_0219a92c_alias` link reference | 1 link error | 1 link error | shipped after BSS export alias |
| `data_022cc4b4` synthesized symbol line | 1 needs-symbol row | 1 needs-symbol row | shipped after symbols.txt line |

The three remaining D016C source patterns are mechanically identifiable:

| Function | Trigger after the macro alias is present |
|---|---|
| `func_ov002_021b00a4` | declares `unsigned short packed` inside a block after executable statements |
| `func_ov002_021eab98` | declares `char *row` after an executable `if`/`return` |
| `func_ov002_02280604` | declares `int i` after the first assignment |

These are compiler-language/syntax failures, not byte mismatches. No hand reshape was attempted in this mechanical lane.

## Exact D016C and CE288 cohorts

The 20 shipped D016C targets were:

```text
021b1c10 021bbeb8 021c3c10 021e2be4 021ff480 02202b9c
02202c18 02203bc4 02204920 02205bb0 022061f0 02207da4
0220d9b0 0221b5e4 02224aa0 02255f9c 022592c0 0226ba08
0226c494 02286ce0
```

The three D016C parks are `021b00a4`, `021eab98`, and `02280604` in both USA and JPN. The eight CE288 targets, all shipped in both regions, were:

```text
021e72b4 022318a4 02233114 02234560
02234a5c 0223b07c 0225761c 02257844
```

## Header root cause and fix

The generated EUR bodies include `ov002_core.h` and retain the EUR context macro spellings:

```c
D016C->...
CE288->...
```

USA and JPN already had the same struct layouts under their region-specific data addresses, but named them `D008C` and `CE1A8`. The build-neutral compatibility fix was therefore:

```c
#define D016C D008C
#define CE288 CE1A8
```

No struct layout or target data address was copied from EUR. The 20+8 direct compilations and all corresponding ROM gates passed with this alias-only header change.

## The alias and the missing symbols

`port_to_region.py` identified the data reference at target address `0x0219a84c`, but the generated C retained the source alias name `data_0219a92c_alias`. A `symbols.txt` entry alone did not export a linker symbol: MWLD still reported the alias undefined. The safe target-side implementation was:

```asm
.global data_0219a92c_alias
data_0219a92c_alias:
```

immediately at the existing `data_0219a84c` BSS label, with no additional `.space`. The matching `symbols.txt` alias line is `data_0219a92c_alias kind:bss addr:0x0219a84c`. The generated C keeps two distinct extern/pointer names, so MWCC preserves the original register/literal schedule. USA and JPN each passed the full ROM gate with this change.

For `func_ov002_022aaea8`, `port_to_region.py --json` emitted the exact new line for each target:

```text
data_022cc4b4 kind:data addr:0x022cc4b4
```

The repository's accepted symbols grammar spells this as `kind:data(any)`, so that mechanically equivalent form was added to both `config/usa/arm9/symbols.txt` and `config/jpn/arm9/symbols.txt`. The candidate then compiled, linked, and passed the ROM gate in both regions.

## Ports and verification

`batch_port.py` auto-committed the green batches. The resolved prefilter plus gate results were:

| Region | D016C shipped | CE288 shipped | alias shipped | missing-symbol shipped | total |
|---|---:|---:|---:|---:|---:|
| USA | 20 | 8 | 1 | 1 | 30 |
| JPN | 20 | 8 | 1 | 1 | 30 |

`python tools/check_activation_invariant.py` reported `function .c added: 60`, `function .s deleted: 60`, `delinks activations: 60`, and `OK`.

`python tools/gate3.py --scope all` passed with individual lines for `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, and `[jpn] SHA1 PASS`.

The whole test suite was run before and after the change:

| Run | Result |
|---|---|
| before | 3128 passed, 17 skipped, 63 subtests passed |
| after | 3129 passed, 16 skipped, 63 subtests passed |

Progress was captured with `python tools/progress.py --version usa|jpn` from the pre-recovery worktree and this worktree:

| Region | Natural-C before | Natural-C after |
|---|---:|---:|
| USA | 221,752 bytes (9.30%) | 236,304 bytes (9.91%) |
| JPN | 221,324 bytes (9.28%) | 235,876 bytes (9.89%) |

