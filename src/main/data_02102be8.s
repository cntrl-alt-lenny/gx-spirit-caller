; Brief 117 cluster B worked example — multi-scalar contiguous run via .s.
;
; Pool: 13 of 247 cluster B candidates (--cluster B per brief 113 taxonomy).
; Range 0x02102be8-0x02102c1c (13 × 4 bytes = 0x34 total).
;
; EDGE CASE: brief 114's worklist classifies these as shape=scalar (size=4),
; but inspection of the bytes reveals they're 4-byte ASCII string buffers
; containing power-of-2 number strings ("1", "2", "4", ..., "256", plus
; "625"/"125"/"25"/"5" near the start). The shape heuristic in
; data_worklist.py v2 can't distinguish 4-byte int from 4-byte char[]
; without semantic context — this confirms the "near-miss" edge case
; brief 117 anticipated.
;
; Recipe: multi-symbol .s file (mwasmarm) with address-ordered .global +
; .ascii (or .byte) directives. Matches brief 115's DTCM pattern.
;
; Why .s and not .c: mwcc 2.0/sp1p5 reorders multi-global .c files by
; an internal heuristic (NOT declaration order, NOT address order). The
; .s approach guarantees byte ordering matches source ordering.

        .data

        .global data_02102be8
data_02102be8:
        .ascii "625"
        .byte 0x00

        .global data_02102bec
data_02102bec:
        .ascii "125"
        .byte 0x00

        .global data_02102bf0
data_02102bf0:
        .ascii "25"
        .byte 0x00, 0x00

        .global data_02102bf4
data_02102bf4:
        .ascii "5"
        .byte 0x00, 0x00, 0x00

        .global data_02102bf8
data_02102bf8:
        .ascii "1"
        .byte 0x00, 0x00, 0x00

        .global data_02102bfc
data_02102bfc:
        .ascii "2"
        .byte 0x00, 0x00, 0x00

        .global data_02102c00
data_02102c00:
        .ascii "4"
        .byte 0x00, 0x00, 0x00

        .global data_02102c04
data_02102c04:
        .ascii "8"
        .byte 0x00, 0x00, 0x00

        .global data_02102c08
data_02102c08:
        .ascii "16"
        .byte 0x00, 0x00

        .global data_02102c0c
data_02102c0c:
        .ascii "32"
        .byte 0x00, 0x00

        .global data_02102c10
data_02102c10:
        .ascii "64"
        .byte 0x00, 0x00

        .global data_02102c14
data_02102c14:
        .ascii "128"
        .byte 0x00

        .global data_02102c18
data_02102c18:
        .ascii "256"
        .byte 0x00
