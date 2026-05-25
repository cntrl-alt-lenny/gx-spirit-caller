; func_ov010_021b3a1c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f1c
        .extern data_02104f4c
        .extern data_ov010_021b8d08
        .extern data_ov010_021b8d18
        .extern data_ov010_021b8d44
        .extern data_ov010_021b8d48
        .extern data_ov010_021b8d64
        .extern Fill32
        .extern func_02001a34
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c93c
        .extern func_0207deb0
        .extern func_0207e8b8
        .extern func_0207f138
        .extern func_0207f420
        .extern func_0208c8cc
        .extern func_0208cc90
        .extern func_0208d1e4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_02094504
        .extern func_ov010_021b2bf8
        .extern func_ov010_021b534c
        .extern func_ov010_021b72c0
        .global func_ov010_021b3a1c
        .arm
func_ov010_021b3a1c:
    stmdb sp!, {r4, lr}
    mov r3, #0x4000000
    ldr r1, [r3, #0x0]
    mov r4, r0
    bic r0, r1, #0x1f00
    ldr r1, .L_021b3c00
    str r0, [r3, #0x0]
    mov r0, #0x0
    mov r2, #0x70
    strh r0, [r3, #0x50]
    bl Fill32
    ldr r1, .L_021b3c04
    ldr r0, .L_021b3c08
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    bl func_0200592c
    ldr r0, .L_021b3c0c
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr ip, .L_021b3c10
    mov r0, #0x200
    ldrh r3, [ip, #0x0]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [ip, #0x0]
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x1
    bl func_0208da2c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x2
    bic r1, r1, #0x7000000
    str r1, [r2, #0x0]
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x38000000
    str r1, [r2, #0x0]
    bl func_0208d1e4
    mov r0, #0x30
    bl func_0208d8c0
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    ldr r1, .L_021b3c14
    ldr r0, .L_021b3c18
    ldrh r2, [r1, #0x0]
    sub r0, r0, #0x17c
    and r2, r2, #0x43
    orr r2, r2, #0x38c
    orr r2, r2, #0x2000
    strh r2, [r1, #0x0]
    ldrh r2, [r1, #0x2]
    and r2, r2, #0x43
    orr r0, r2, r0
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    mov ip, #0x4000000
    ldr r2, .L_021b3c1c
    and r0, r0, #0x43
    orr r0, r0, #0x118
    strh r0, [r1, #0x4]
    ldrh lr, [r1, #0x6]
    ldr r3, .L_021b3c20
    mov r0, #0x1
    and lr, lr, #0x43
    orr lr, lr, #0x84
    strh lr, [r1, #0x6]
    ldr r1, [ip, #0x0]
    and r1, r1, r2
    orr r1, r1, #0x10
    str r1, [ip, #0x0]
    ldr r1, [ip, #0x0]
    and r1, r1, r3
    str r1, [ip, #0x0]
    bl func_02005bfc
    bl func_0207f420
    mov r1, #0x0
    ldr r0, .L_021b3c24
    mov r3, r1
    mov r2, #0x80
    bl func_0207f138
    ldr r0, .L_021b3c28
    bl func_0207e8b8
    mov r0, #0xf
    bl func_02001a34
    ldr r0, .L_021b3c2c
    bl func_0202adf8
    ldr r0, .L_021b3c30
    ldr r1, .L_021b3c34
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    str r0, [r1, #0x5c]
    bl func_0202ae1c
    bl func_0202c93c
    cmp r4, #0x1
    ldr r1, .L_021b3c34
    str r0, [r1, #0x98]
    str r4, [r1, #0x3c]
    beq .L_021b3be8
    cmp r4, #0x2
    beq .L_021b3bf0
    b .L_021b3bf4
.L_021b3be8:
    bl func_ov010_021b534c
    b .L_021b3bf4
.L_021b3bf0:
    bl func_ov010_021b72c0
.L_021b3bf4:
    bl func_ov010_021b2bf8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_021b3c00:
        .word   data_ov010_021b8d44
.L_021b3c04:
        .word   data_02104f1c
.L_021b3c08:
        .word   data_ov010_021b8d08
.L_021b3c0c:
        .word   0x1ff
.L_021b3c10:
        .word   0x4000304
.L_021b3c14:
        .word   0x4000008
.L_021b3c18:
        .word   0x238c
.L_021b3c1c:
        .word   0xffcfffef
.L_021b3c20:
        .word   0xffbfff9f
.L_021b3c24:
        .word   data_ov010_021b8d48
.L_021b3c28:
        .word   data_ov010_021b8d18
.L_021b3c2c:
        .word   data_ov010_021b8d64
.L_021b3c30:
        .word   data_02104f4c
.L_021b3c34:
        .word   data_ov010_021b8d08
