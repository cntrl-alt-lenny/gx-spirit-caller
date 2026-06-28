## overlay023

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov023_Init | HIGH | registers context buf; configures subsystems from bitfield in data_02104f4c; zeros data_02105989; calls ov005 slot-4 setup; returns 1 — canonical overlay init |
| 0x021b22e4 | Ov023_Exit | HIGH | Fill32-reset + flush-callbacks + large-cleanup + 3-slot-loop + re-registers ov004 callback as slot 4; returns 1 — canonical overlay teardown |
| 0x021b2314 | Ov023_StepDispatch | HIGH | table[state[0]] blx; advance index on nonzero return; return 0/1 — byte-identical callback-dispatch step pattern to func_ov006_021b2280 and func_ov004_021d6ed0 |
