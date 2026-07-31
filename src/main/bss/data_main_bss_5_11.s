; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 8 .bss symbols, range 0x0219ef10..0x0219ef34.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 4 of 6, cm-bss-convert-3).

        .bss

        .global data_0219ef10
data_0219ef10:
        .space 0x4
        .global data_0219ef14
data_0219ef14:
        .space 0x4
        .global data_0219ef18
data_0219ef18:
        .space 0x4
        .global data_0219ef1c
data_0219ef1c:
        .space 0x4
        .global data_0219ef20
data_0219ef20:
        .space 0x4
        .global data_0219ef24
data_0219ef24:
        .space 0x4
        .global data_0219ef28
data_0219ef28:
        .space 0x4
        .global data_0219ef2c
data_0219ef2c:
        .space 0x8
