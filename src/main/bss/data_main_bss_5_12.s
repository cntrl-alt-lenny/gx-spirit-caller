; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 17 .bss symbols, range 0x0219ef3c..0x021a071c.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 5 of 6, cm-bss-convert-3).

        .bss

        .global data_0219ef3c
data_0219ef3c:
        .space 0x3a
        .global data_0219ef76
data_0219ef76:
        .space 0x1a
        .global data_0219ef90
data_0219ef90:
        .space 0xa
        .global data_0219ef9a
data_0219ef9a:
        .space 0x56
        .global data_0219eff0
data_0219eff0:
        .space 0x64
        .global data_0219f054
data_0219f054:
        .space 0x64
        .global data_0219f0b8
data_0219f0b8:
        .space 0xc0
        .global data_0219f178
data_0219f178:
        .space 0xc0
        .global data_0219f238
data_0219f238:
        .space 0x2a
        .global data_0219f262
data_0219f262:
        .space 0x156
        .global data_0219f3b8
data_0219f3b8:
        .space 0x180
        .global data_0219f538
data_0219f538:
        .space 0x9c8
        .global data_0219ff00
data_0219ff00:
        .space 0x800
        .global data_021a0700
data_021a0700:
        .space 0x4
        .global data_021a0704
data_021a0704:
        .space 0x4
        .global data_021a0708
data_021a0708:
        .space 0x13
        .global data_021a071b
data_021a071b:
        .space 0x1
