; func_ov004_021cab44 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern data_ov004_0220b504
        .extern data_ov004_0220f228
        .extern data_ov004_0221159c
        .extern data_ov004_022915e8
        .extern func_020018d4
        .extern func_0200197c
        .extern func_02001d68
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02008888
        .extern func_020092e0
        .extern func_02009494
        .extern func_0201d040
        .extern func_0201d5c0
        .extern func_0201e7e0
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_0202c0c0
        .extern func_02032624
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208c940
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208e2f4
        .extern func_0208e318
        .extern func_02094504
        .extern func_020945f4
        .extern func_ov004_021c9eec
        .extern func_ov004_021d8648
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021cab44
        .arm
func_ov004_021cab44:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r4, .L_021cae90
    ldr r2, .L_021cae94
    mov r0, r4
    mov r1, #0x0
    bl func_020945f4
    mov r0, #0x1
    bl func_02032624
    mov r3, #0x10
    ldr r2, .L_021cae98
    ldr r0, .L_021cae9c
    rsb r1, r3, #0x0
    str r3, [r2, #0x5c]
    bl func_0208c884
    ldr r1, .L_021cae98
    ldr r0, .L_021caea0
    ldr r1, [r1, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c884
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_021caea4
    mov r1, #0x1
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e318
    mov r2, #0x0
    ldr r0, .L_021caea8
    ldr r1, .L_021caeac
    strh r2, [r0, #0x0]
    ldrh r0, [r1, #0x0]
    orr r0, r0, #0x8000
    strh r0, [r1, #0x0]
    bl func_0200592c
    ldr r0, .L_021caeb0
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0xc0
    ldr r1, .L_021caeb4
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    ldr r1, .L_021caeb8
    mov r2, #0x400
    bl func_02094504
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r1, #0x0]
    ldr r0, [r2, #0x0]
    bic r0, r0, #0x1f00
    str r0, [r2, #0x0]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0xe000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    mov r0, #0x20
    bic r1, r1, #0xe000
    str r1, [r2, #0x0]
    bl func_020018d4
    ldr r1, .L_021caebc
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    ldr r0, .L_021caec0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, .L_021caec4
    bl func_0202adf8
    ldr r0, .L_021caec0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, .L_021caec0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x0
    bl func_0208c8b0
    ldr r3, .L_021caec8
    ldr r1, .L_021caecc
    ldr r2, [r3, #0x0]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3, #0x0]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r3, .L_021caec8
    ldr r0, .L_021caed0
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x10
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl func_ov004_021d8648
    bl func_0208c940
    ldr r1, .L_021caec8
    ldr r0, [r1, #0x0]
    orr r0, r0, #0x10000
    str r0, [r1, #0x0]
    bl func_ov004_021c9eec
    bl func_0201e7e0
    mov r0, #0x1
    bl func_02005bfc
    mov r0, #0x2
    bl func_02005bfc
    ldr r0, .L_021caed4
    bl func_020092e0
    mov r1, #0x1c
    ldr r0, .L_021caea8
    sub r2, r1, #0x2c
    bl func_0208e2f4
    ldr r0, .L_021caea0
    mov r1, #0x0
    bl func_0208c884
    bl func_0201d040
    cmp r0, #0x1
    cmpne r0, #0x2
    bne .L_021cae68
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, .L_021caed0
    mov r2, #0x1
    bl func_ov004_021d8798
    ldr r0, .L_021caed8
    ldr r2, [r0, #0xbac]
    cmp r2, #0x0
    blt .L_021cae5c
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x1
    beq .L_021cadf4
    cmp r0, #0x2
    beq .L_021cae14
    cmp r0, #0x3
    beq .L_021cae34
    b .L_021cae50
.L_021cadf4:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x178
    add r2, r0, #0x3c00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
    b .L_021cae50
.L_021cae14:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x79
    add r2, r0, #0x3d00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
    b .L_021cae50
.L_021cae34:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x7a
    add r2, r0, #0x3d00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
.L_021cae50:
    add r0, r4, #0x128
    add r0, r0, #0x3c00
    bl func_02009494
.L_021cae5c:
    bl func_02008888
    ldr r0, .L_021caed0
    bl func_ov004_021d8cd0
.L_021cae68:
    ldr r1, [r4, #0x5c]
    ldr r0, .L_021caea0
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, .L_021caea8
    mov r1, #0x0
    strh r1, [r0, #0x0]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_021cae90:
        .word   data_ov004_0220b500
.L_021cae94:
        .word   0x609c
.L_021cae98:
        .word   data_ov004_0220b500
.L_021cae9c:
        .word   0x400006c
.L_021caea0:
        .word   0x400106c
.L_021caea4:
        .word   0x4000050
.L_021caea8:
        .word   0x4001050
.L_021caeac:
        .word   0x4000304
.L_021caeb0:
        .word   0x1ff
.L_021caeb4:
        .word   0x7000400
.L_021caeb8:
        .word   0x5000400
.L_021caebc:
        .word   data_ov004_0221159c
.L_021caec0:
        .word   data_02104f4c
.L_021caec4:
        .word   data_ov004_0220b504
.L_021caec8:
        .word   0x4001000
.L_021caecc:
        .word   0xffcfffef
.L_021caed0:
        .word   data_ov004_022915e8
.L_021caed4:
        .word   data_ov004_0220f228
.L_021caed8:
        .word   data_021040ac
