; Cluster A wave 4 — overlay 023 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 1 .bss symbols, range 0x021b23a8..0x021b2400.
; data_ov023_021b23a0 (the first 8 bytes) carved out to
; src/overlay023/data_ov023_021b23a0.c (cm-bss-carve-scope proof-of-concept).

        .bss

        .global data_ov023_021b23a8
data_ov023_021b23a8:
        .space 0x58
