; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 7 .bss symbols, range 0x021a8308..0x021a8334.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-9).

        .bss

        .global data_021a8308
data_021a8308:
        .space 0x4
        .global data_021a830c
data_021a830c:
        .space 0xc
        .global data_021a8318
data_021a8318:
        .space 0x4
        .global data_021a831c
data_021a831c:
        .space 0x4
        .global data_021a8320
data_021a8320:
        .space 0x4
        .global data_021a8324
data_021a8324:
        .space 0x8
        .global data_021a832c
data_021a832c:
        .space 0x8
