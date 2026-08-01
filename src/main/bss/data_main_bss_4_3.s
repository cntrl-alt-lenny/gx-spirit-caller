; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 8 .bss symbols, range 0x0219b550..0x0219c4a0.
; split from the original single-TU cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-4).

        .bss

        .global data_0219b550
data_0219b550:
        .space 0x210
        .global data_0219b760
data_0219b760:
        .space 0x1e0
        .global data_0219b940
data_0219b940:
        .space 0xac8
        .global data_0219c408
data_0219c408:
        .space 0x78
        .global data_0219c480
data_0219c480:
        .space 0x2
        .global data_0219c482
data_0219c482:
        .space 0x6
        .global data_0219c488
data_0219c488:
        .space 0xc
        .global data_0219c494
data_0219c494:
        .space 0xc
