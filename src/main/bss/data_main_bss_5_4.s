; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 8 .bss symbols, range 0x021a1874..0x021a1974.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 4 of 8, cm-bss-convert-2).

        .bss

        .global data_021a1874
data_021a1874:
        .space 0x40
        .global data_021a18b4
data_021a18b4:
        .space 0x4
        .global data_021a18b8
data_021a18b8:
        .space 0x8
        .global data_021a18c0
data_021a18c0:
        .space 0x44
        .global data_021a1904
data_021a1904:
        .space 0x9
        .global data_021a190d
data_021a190d:
        .space 0x2b
        .global data_021a1938
data_021a1938:
        .space 0x28
        .global data_021a1960
data_021a1960:
        .space 0x14
