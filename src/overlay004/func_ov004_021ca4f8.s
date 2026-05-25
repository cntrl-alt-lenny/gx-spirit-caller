; func_ov004_021ca4f8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_02209adc
        .extern data_ov004_02209aec
        .extern data_ov004_02209b08
        .extern data_ov004_02209b24
        .extern data_ov004_02209b3c
        .extern data_ov004_02209b54
        .extern data_ov004_02209b6c
        .extern data_ov004_02209b84
        .extern data_ov004_02209b9c
        .extern data_ov004_02209bb8
        .extern data_ov004_0220b500
        .extern data_ov004_022113f8
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201d5c0
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_020373cc
        .extern func_0208c940
        .extern func_0208ced4
        .extern func_0208cee8
        .extern func_0208cefc
        .extern func_0208cf20
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208d6f4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_0208ddec
        .extern func_0208de94
        .extern func_0208df0c
        .extern func_0208e1cc
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021c9fcc
        .global func_ov004_021ca4f8
        .arm
func_ov004_021ca4f8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x78
    ldr r4, .L_021caae0
    bl func_0208cf58
    bl func_0208cf44
    bl func_0208cf20
    bl func_0208cefc
    bl func_0208cee8
    bl func_0208ced4
    mov r0, #0x2
    bl func_0208da2c
    mov r0, #0x1
    bl func_0208d8c0
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x20
    bl func_0208d6f4
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r1, .L_021caae4
    mov r0, #0x4
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3, #0x0]
    mov r1, #0x2
    bl func_0201d5c0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_021caae8
    ldr r1, .L_021caaec
    mov r2, #0x1
    mov r3, #0x3400
    bl func_ov004_021c9fcc
    add r0, sp, #0x50
    bl func_0201d47c
    ldr r0, .L_021caaf0
    mov r1, #0x4
    ldr r0, [r0, #0x40]
    mov r2, #0x0
    cmp r0, #0x0
    ldrne r0, .L_021caaf4
    ldreq r0, .L_021caaf8
    bl func_02006c0c
    mov r2, #0x0
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x50]
    str r2, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x64]
    ldrh r1, [sp, #0x64]
    add r0, sp, #0x50
    strh r2, [sp, #0x60]
    orr r1, r1, #0x10
    strh r1, [sp, #0x64]
    bl func_0201e5b8
    ldr r0, [sp, #0x50]
    bl func_02006e1c
    ldr r2, .L_021caafc
    mov r0, #0x0
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    str r0, [r2, #0xe]
    ldrh r0, [r2, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x284
    orr r0, r0, #0x400
    strh r0, [r2, #0x0]
    bl func_0208ddec
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r2, .L_021cab00
    mov r0, #0x0
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    str r0, [r2, #0xc]
    ldrh r0, [r2, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x490
    strh r0, [r2, #0x0]
    bl func_0208de94
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r0, [r4, #0x40]
    mov r5, #0x40
    cmp r0, #0x0
    add r0, sp, #0x28
    beq .L_021ca840
    bl func_0201d47c
    ldr r0, .L_021cab04
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    ldr r2, [sp, #0x40]
    bic r1, r1, #0xf
    orr r1, r1, #0x3
    strh r1, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    bic r0, r2, #0x1c000
    orr r2, r0, #0xc000
    orr r1, r1, #0x10
    add r0, sp, #0x28
    str r5, [sp, #0x34]
    str r3, [sp, #0x30]
    str r2, [sp, #0x40]
    strh r1, [sp, #0x3c]
    strh r3, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, .L_021cab08
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x1840
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5400
    str r0, [sp, #0x30]
    ldrh r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    orr r0, r0, #0x10
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x3c]
    mov r0, #0x0
    orr r1, r1, #0x8000
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, .L_021cab0c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, r5
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5c00
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x40]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    ldrh r2, [sp, #0x3c]
    mov r1, #0x200
    add r0, sp, #0x28
    orr r2, r2, #0x10
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, .L_021cab10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    ldr r2, [sp, #0x40]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0x1d8
    add r0, r0, #0x5c00
    str r0, [sp, #0x30]
    bic r0, r2, #0x1c000
    ldrh r1, [sp, #0x3c]
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    orr r2, r1, #0x10
    mov r1, #0xc40
    str r1, [sp, #0x34]
    mov r1, #0x400
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    b .L_021ca98c
.L_021ca840:
    bl func_0201d47c
    ldr r0, .L_021cab14
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    ldr r2, [sp, #0x40]
    bic r1, r1, #0xf
    orr r1, r1, #0x3
    strh r1, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    bic r0, r2, #0x1c000
    orr r2, r0, #0xc000
    orr r1, r1, #0x10
    add r0, sp, #0x28
    str r5, [sp, #0x34]
    str r3, [sp, #0x30]
    str r2, [sp, #0x40]
    strh r1, [sp, #0x3c]
    strh r3, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, .L_021cab18
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, r5
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5400
    str r0, [sp, #0x30]
    ldrh r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    orr r0, r0, #0x10
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x3c]
    mov r0, #0x0
    orr r1, r1, #0x8000
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, .L_021cab1c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, .L_021cab20
    str r0, [sp, #0x28]
    add r0, r4, #0xd8
    add r0, r0, #0x5800
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x40]
    ldrh r2, [sp, #0x3c]
    str r1, [sp, #0x34]
    bic r0, r0, #0x1c000
    bic r1, r2, #0xf
    orr r1, r1, #0x2
    strh r1, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    mov r1, #0x200
    orr r2, r2, #0x10
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
.L_021ca98c:
    ldr r2, .L_021cab24
    mov r0, #0x0
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    str r0, [r2, #0xa]
    ldrh r0, [r2, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x21c
    strh r0, [r2, #0x0]
    bl func_0208df0c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    ldr r1, .L_021cab28
    ldr r2, .L_021cab2c
    add r0, sp, #0x8
    bl func_02001bc8
    ldr r1, .L_021cab30
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_02094550
    ldr r0, .L_021cab34
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_02094550
    ldr r0, .L_021cab38
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, .L_021cab3c
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, [r4, #0x40]
    add r0, r0, #0xca
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r5, r0
    bl func_0208df0c
    mov r4, r0
    mov r0, #0x0
    add r1, r4, #0x20
    mov r2, #0x800
    bl func_02094504
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x4
    str r0, [sp, #0x0]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, .L_021cab3c
    mov r1, r5
    add r2, r4, #0x20
    bl func_02004f58
    bl func_0208e1cc
    add r1, r0, #0x4c0
    ldr r0, .L_021cab3c
    mov r2, #0x1
    mov r3, #0x2
    bl func_02001e94
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1e00
    str r0, [r1, #0x0]
    bl func_0208c940
    ldr r4, .L_021cab40
    mov r2, #0x0
    ldr r0, [r4, #0xb7c]
    sub r3, r2, #0x1
    str r0, [r4, #0xb80]
    mov r0, #0x27
    mov r1, #0x1
    str r0, [r4, #0xb7c]
    bl func_020373cc
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_021caae0:
        .word   data_ov004_0220b500
.L_021caae4:
        .word   0xffcfffef
.L_021caae8:
        .word   data_ov004_022113f8
.L_021caaec:
        .word   data_ov004_02209adc
.L_021caaf0:
        .word   data_ov004_0220b500
.L_021caaf4:
        .word   data_ov004_02209aec
.L_021caaf8:
        .word   data_ov004_02209b08
.L_021caafc:
        .word   0x400000e
.L_021cab00:
        .word   0x400000c
.L_021cab04:
        .word   data_ov004_02209b24
.L_021cab08:
        .word   data_ov004_02209b3c
.L_021cab0c:
        .word   data_ov004_02209b54
.L_021cab10:
        .word   data_ov004_02209b6c
.L_021cab14:
        .word   data_ov004_02209b84
.L_021cab18:
        .word   data_ov004_02209b9c
.L_021cab1c:
        .word   data_ov004_02209bb8
.L_021cab20:
        .word   0x4040
.L_021cab24:
        .word   0x400000a
.L_021cab28:
        .word   0x3860
.L_021cab2c:
        .word   0x779b
.L_021cab30:
        .word   0x5000040
.L_021cab34:
        .word   data_020b4728
.L_021cab38:
        .word   data_02104f4c
.L_021cab3c:
        .word   data_02102c90
.L_021cab40:
        .word   data_021040ac
