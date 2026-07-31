; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 8 .bss symbols, range 0x0219c4e8..0x0219d388.
; split from the original single-TU cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-2).

        .bss

        .global data_0219c4e8
data_0219c4e8:
        .space 0xb24
        .global data_0219d00c
data_0219d00c:
        .space 0x5c
        .global data_0219d068
data_0219d068:
        .space 0x4
        .global data_0219d06c
data_0219d06c:
        .space 0x4
        .global data_0219d070
data_0219d070:
        .space 0xc
        .global data_0219d07c
data_0219d07c:
        .space 0xc
        .global data_0219d088
data_0219d088:
        .space 0xc0
        .global data_0219d148
data_0219d148:
        .space 0x240
