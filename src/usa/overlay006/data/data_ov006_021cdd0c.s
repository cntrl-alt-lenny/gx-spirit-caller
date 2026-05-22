; Cluster B size-1/2 bundle — brief 153 workaround #3 (.s variant).
; Cross-region apply via brief 181.
;
; Anchor:  data_ov006_021cdd0c
; Range:   0x021cdd0c..0x021cdd28 (28 bytes)
; Encloses 1 placeholder(s).
; Per brief 152 workaround #3: bundle preserves each absorbed
; placeholder as a .global label so load relocs resolve.

        .section .data

        .global data_ov006_021cdd0c
data_ov006_021cdd0c:
        .byte 0x00, 0x00

        .global data_ov006_021cdd0e
data_ov006_021cdd0e:
        .byte 0x52, 0x04, 0x02, 0x00, 0x53, 0x04, 0x00, 0x00
        .byte 0x54, 0x04, 0x00, 0x00, 0x55, 0x04, 0x02, 0x00
        .byte 0x56, 0x04, 0x00, 0x00, 0x57, 0x04, 0x00, 0x00
        .byte 0x58, 0x04
