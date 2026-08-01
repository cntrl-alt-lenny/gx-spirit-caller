; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 17 .bss symbols, range 0x021a9934..0x021aa0d0.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 8 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-8).

        .bss

        .global data_021a9934
data_021a9934:
        .space 0x4
        .global data_021a9938
data_021a9938:
        .space 0x4
        .global data_021a993c
data_021a993c:
        .space 0x4
        .global data_021a9940
data_021a9940:
        .space 0x4
        .global data_021a9944
data_021a9944:
        .space 0x4
        .global data_021a9948
data_021a9948:
        .space 0x4
        .global data_021a994c
data_021a994c:
        .space 0x14
        .global data_021a9960
data_021a9960:
        .space 0x4
        .global data_021a9964
data_021a9964:
        .space 0xbc
        .global data_021a9a20
data_021a9a20:
        .space 0xe8
        .global data_021a9b08
data_021a9b08:
        .space 0x4
        .global data_021a9b0c
data_021a9b0c:
        .space 0x424
        .global data_021a9f30
data_021a9f30:
        .space 0x10
        .global data_021a9f40
data_021a9f40:
        .space 0x100
        .global data_021aa040
data_021aa040:
        .space 0x24
        .global data_021aa064
data_021aa064:
        .space 0x24
        .global data_021aa088
data_021aa088:
        .space 0x48
