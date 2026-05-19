; ov004 .rodata cluster wave retry brief 147 — Pattern 1 .s shape (12 bytes).
; Reproducer #2 from brief 145; now unblocked by brief 146 patcher fix.

        .section .rodata

        .global data_ov004_02200df4
data_ov004_02200df4:
        .byte 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00
        .byte 0x00, 0x00, 0x00, 0x00
