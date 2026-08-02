; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 1 .bss symbols, range 0x021a66d0..0x021a66d4.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 2 of 3, cm-bss-convert-7).
; split from the original cluster to carve out matched symbols (fragment 2 of 3, cm-bss-convert-9).

        .bss

        .global data_021a66d0
data_021a66d0:
        .space 0x4
