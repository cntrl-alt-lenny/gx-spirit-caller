; func_ov008_021aa94c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov008_021b2780
        .extern data_ov008_021b2cec
        .extern data_ov008_021b2d28
        .extern func_02001a34
        .extern func_02001d68
        .extern func_02005bfc
        .extern func_02005ee0
        .extern func_02009dec
        .extern func_02009e9c
        .extern func_0201a4dc
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_0202c24c
        .extern func_0202c270
        .extern func_02094504
        .extern func_ov008_021aa5d8
        .extern func_ov008_021aa6a4
        .extern func_ov008_021ab164
        .extern func_ov008_021ac2ac
        .extern func_ov008_021adaa8
        .extern func_ov008_021b2064
        .global func_ov008_021aa94c
        .arm
func_ov008_021aa94c:
    stmdb sp!, {r3, lr}
    ldr r0, .L_021aaa9c
    ldr r0, [r0, #0xb70]
    cmp r0, #0x0
    bne .L_021aaa88
    ldr r1, .L_021aaaa0
    mov r0, #0x0
    mov r2, #0x640
    bl func_02094504
    ldr r0, .L_021aaa9c
    ldr r2, .L_021aaaa4
    ldr r1, [r0, #0x38]
    mov r0, #0x3
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r2, #0x8]
    bl func_02005bfc
    bl func_02005ee0
    mov r0, #0x24
    bl func_02001a34
    ldr r0, .L_021aaaa8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, .L_021aaaac
    bl func_0202adf8
    ldr r0, .L_021aaaa8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, .L_021aaaa8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    ldr r0, .L_021aaab0
    bl func_0202c24c
    ldr r0, .L_021aaaa8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c270
    bl func_0201a4dc
    cmp r0, #0x1
    ldreq r0, .L_021aaaa4
    moveq r1, #0x1
    ldr r3, .L_021aaaa8
    streq r1, [r0, #0x568]
    ldr r0, [r3, #0x90c]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    beq .L_021aaa60
    mov r2, #0x0
.L_021aaa28:
    add r0, r3, #0x1000
    ldrb r1, [r0, #0x56c]
    cmp r1, #0x0
    ldrneb r0, [r0, #0x56d]
    cmpne r0, #0x0
    bne .L_021aaa50
    add r2, r2, #0x1
    cmp r2, #0x1a
    add r3, r3, #0x1c
    blt .L_021aaa28
.L_021aaa50:
    cmp r2, #0x1a
    blt .L_021aaa60
    bl func_02009dec
    bl func_02009e9c
.L_021aaa60:
    bl func_ov008_021aa5d8
    bl func_ov008_021aa6a4
    bl func_ov008_021ab164
    bl func_ov008_021b2064
    ldr r1, .L_021aaa9c
    mov r0, #0x0
    ldr r2, [r1, #0xb70]
    add r2, r2, #0x1
    str r2, [r1, #0xb70]
    ldmia sp!, {r3, pc}
.L_021aaa88:
    bl func_ov008_021ac2ac
    mov r0, #0x1
    bl func_ov008_021adaa8
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_021aaa9c:
        .word   data_021040ac
.L_021aaaa0:
        .word   data_ov008_021b2780
.L_021aaaa4:
        .word   data_ov008_021b2780
.L_021aaaa8:
        .word   data_02104f4c
.L_021aaaac:
        .word   data_ov008_021b2cec
.L_021aaab0:
        .word   data_ov008_021b2d28
