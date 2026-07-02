[//]: # (markdownlint-disable MD013)

# Brief 516 - HIGH C-match wave 9

Branch: `scaffolder/c-match-high-516`

Scope: HIGH tier class A/B candidates only; containment pre-gate plus bounded reshaping.

## Outcome

- Attempted EUR candidates: **7**
- EUR matches accepted: **4**
- Avalanche parked: **1**
- Reshape parked: **2**
- USA ports kept: **3**
- JPN ports kept: **3**
- Ports deferred: **1 EUR match** (`0200592c`, USA sha1 failed after objdiff; JPN was reverted un-gated)

This wave used the Brief 514 containment diagnosis directly. Candidates whose uncompressed `arm9.bin` diff escaped their delinked range were parked instead of reshaped. Candidates with contained diffs were driven from byte-level instruction differences and then accepted only after `ninja -j4 sha1`.

## Accepted EUR matches

| EUR addr | Region ports | Containment result | Reshape note |
|---|---|---|---|
| `0200b1bc` | USA/JPN kept as `0200b1a0` | contained, 2-byte add operand-order diff -> zero | Rewrote the additive loop with an accumulator temp so mwcc emitted `add r0, r5, r0`. |
| `0200a454` | USA/JPN kept as `0200a438` | contained, 5-byte pool/register diff -> zero | Bound only the destination base as a local to recover the original literal/register assignment. |
| `0200592c` | ports deferred | contained, 12-byte MMIO register diff -> zero | Rewrote the MMIO zero stores as direct stores plus a single `0x4001014` base local. |
| `0200b0c8` | USA/JPN kept as `0200b0ac` | contained, 61-byte loop/count diff -> zero | Bound `p->count` once, used branch-to-tail null shape, then adjusted variable lifetime to match the original callee-saved allocation. |

All four accepted EUR candidates passed `ninja -j4 sha1` after their local reshapes.

## Parked candidates

| EUR addr | Bucket | Evidence | Next action |
|---|---|---|---|
| `02001e5c` | avalanche | Initial C attempt produced 604,225 uncompressed ARM9 diff bytes / 73,908 runs; first run at `0x020008f8`, before the candidate range `0x02001e5c-0x02001e84`. | Requires layout-containment work before instruction shaping. |
| `02007f58` | reshape | Contained 11-byte early store scheduling/register diff persisted after several bounded shapes. | Revisit with a narrower register-allocation recipe for the `r2` one/`r1` 500 sequence. |
| `0200a40c` | reshape | Contained 57-byte bitfield/register diff; a direct-shift rewrite briefly avalanched by moving the literal pool, and the safer bitfield form stayed contained but unchanged. | Needs a dedicated bitfield/register-allocation recipe for `r0` return accumulator plus `r2/r3/r1` pointer/counter/temp roles. |

## Port notes

- `0200b1bc`, `0200a454`, and `0200b0c8` were ported to USA and JPN, then gated with target-region `ninja -j4 rom`, fresh `ninja -j4 objdiff`, and `ninja -j4 sha1`.
- `0200592c` was kept for EUR only. The target port used a MEDIUM callee mapping and USA passed objdiff but failed sha1, so both USA/JPN port files and delinks flips were reverted.

## Yield and runway

- EUR yield this wave: **4 / 7 attempted = 57.1%**.
- Contained-candidate yield: **4 / 6 = 66.7%**.
- Approximate HIGH A/B runway after this branch: **1,016** unconverted candidates still have `.s` sources in the index scan, before subtracting this wave's parked/stubborn notes.

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Other checks:

```text
python tools/generate_research_index.py --check
docs\research\README.md is current.

Markdown lint: not run; no local markdownlint/markdownlint-cli/mdl command was installed.
```
