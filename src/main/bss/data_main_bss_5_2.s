; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 2 .bss symbols, range 0x021a0df4..0x021a0f34.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 8, cm-bss-convert-2).

        .bss

        .global data_021a0df4
data_021a0df4:
        .space 0x40
        .global data_021a0e34
data_021a0e34:
        .space 0x100
