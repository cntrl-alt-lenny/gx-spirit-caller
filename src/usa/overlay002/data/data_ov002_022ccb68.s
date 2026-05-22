; Cluster B size-1/2 bundle — brief 153 workaround #3 (.s variant).
; Cross-region apply via brief 181.
;
; Anchor:  data_ov002_022ccb68
; Range:   0x022ccb68..0x022ccb6c (4 bytes)
; Encloses 1 placeholder(s).
; Per brief 152 workaround #3: bundle preserves each absorbed
; placeholder as a .global label so load relocs resolve.

        .section .data

        .global data_ov002_022ccb68
data_ov002_022ccb68:
        .byte 0x70, 0xff

        .global data_ov002_022ccb6a
data_ov002_022ccb6a:
        .byte 0x00, 0x00
