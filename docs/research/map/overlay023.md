# Module: overlay023

## Summary

overlay023 is a tiny 3-function overlay (0x021b2280–0x021b236b) that implements a
self-contained callback-dispatch state machine, structurally identical to the
dispatcher families seen in ov004, ov006, and related overlays. The overlay owns a
small BSS block: `data_ov023_021b23a0` (8 bytes — state index + reset slot) and
`data_ov023_021b23a8` (0x58 bytes — scratch/context buffer), plus a rodata-like
`data_ov023_021b2380` function-pointer table.

`func_ov023_021b2280` is the **init** entry point: it registers the context buffer,
extracts a 5-bit field from a shared global (`data_02104f4c[1]` bits [4:0]) to
configure two subsystems (`func_0202ae1c`, `func_0202c070`), zeroes the 0x14-byte
`data_02105989` region via a byte-fill helper, and then calls an ov005 routine with
slot id 4. Returns 1 on success. `func_ov023_021b22e4` is the **exit/teardown**
entry: it resets the shared Fill32 state, flushes pending task callbacks via
`func_0202c1ac`, calls a larger cleanup (`func_0202af40`), runs a 3-slot loop
clearing another table (`func_02006918`), and finally registers `func_ov004_021d6ed0`
as a new callback slot (id 4, kind 1). Returns 1. `func_ov023_021b2314` is the
**dispatch step**: it indexes into the overlay's function-pointer table
(`data_ov023_021b2380`) by the current state index (`data_ov023_021b23a0[0]`),
calls the slot via `blx`, and if the callback returns nonzero advances the index and
clears the auxiliary slot — the same pattern as `func_ov006_021b2280` and
`func_ov004_021d6ed0`.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021b2280 | 0x64 | SHIP | func_ov023_021b2280 | Ov023_Init | HIGH | stores context buf; configures two subsystems from a bitfield; clears data region; calls ov005 slot-4 setup; returns 1 — canonical overlay init shape |
| 0x021b22e4 | 0x30 | SHIP | func_ov023_021b22e4 | Ov023_Exit | HIGH | Fill32-reset + flush callbacks + large cleanup + 3-slot loop clear + re-registers ov004 callback as slot 4 — canonical overlay teardown shape, returns 1 |
| 0x021b2314 | 0x58 | SHIP | func_ov023_021b2314 | Ov023_StepDispatch | HIGH | table[state[0]] blx + advance-on-nonzero + return 0/1 — byte-identical pattern to func_ov006_021b2280 and func_ov004_021d6ed0 callback-dispatch step |

## Call graph (top hub functions)

No `bl` calls originate *within* overlay023's own functions to each other; the
module's 3 functions are leaf-like entries called from outside. External callee
frequencies within the overlay's own .s bodies:

| addr | proposed_name | call count |
|---|---|---|
| 0x0202adf8 | func_0202adf8 (context register) | 1 |
| 0x0202ae1c | func_0202ae1c (subsystem config A) | 2 |
| 0x0202c070 | func_0202c070 (subsystem config B) | 1 |
| 0x020945f4 | func_020945f4 (byte-fill helper) | 1 |
| 0x021ad018 | func_ov005_021ad018 (ov005 slot setup) | 1 |
| 0x02001ba4 | func_02001ba4 (Fill32 reset) | 1 |
| 0x0202c1ac | func_0202c1ac (flush task callbacks) | 1 |
| 0x0202af40 | func_0202af40 (large cleanup) | 1 |
| 0x02006918 | func_02006918 (3-slot loop clear) | 1 |
| 0x020071a4 | func_020071a4 (callback slot write) | 1 |

## Stats

Total: 3 | Named: 0 | Matched: 0 | Ship: 3 | Proposals: HIGH/MED/LOW = 3/0/0
