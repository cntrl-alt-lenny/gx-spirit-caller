; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 6 .bss symbols, range 0x02191e20..0x02191fe0.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-6).

        .bss

        .global data_02191e20
data_02191e20:
        .space 0x10
        .global data_02191e30
data_02191e30:
        .space 0x8
        .global data_02191e38
data_02191e38:
        .space 0x108
        .global data_02191f40
data_02191f40:
        .space 0x60
        .global data_02191fa0
data_02191fa0:
        .space 0x20
        .global data_02191fc0
data_02191fc0:
        .space 0x20
