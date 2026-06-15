; func_ov006_021c40b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f448
        .extern data_ov006_0225e068
        .extern func_02037208
        .extern func_ov006_021b5fe4
        .extern func_ov006_021b79ac
        .extern func_ov006_021b7a20
        .extern func_ov006_021b7aa0
        .extern func_ov006_021b7b48
        .extern func_ov006_021b7b78
        .extern func_ov006_021ca264
        .extern func_ov006_021ca3e0
        .extern func_ov006_021ca3f0
        .global func_ov006_021c40b0
        .arm
func_ov006_021c40b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [r9, #0x64]
    add r5, sp, #0x0
    cmp r0, #0x0
    add r0, r9, r0, lsl #0x4
    moveq r8, #0x0
    ldr r6, [r0, #0xa0]
    ldr r3, [r0, #0x9c]
    mov r1, r5
    add r0, r9, #0x7c
    mov r2, #0xc
    mov r7, #0x0
    ldr sl, _LIT0
    ldr r4, _LIT1
    movne r8, #0x1
    add r6, r6, r3
    bl Copy32
    mov r2, r7
    str r2, [r9, #0x7c]
    str r2, [r9, #0x80]
    str r2, [r9, #0x84]
    ldr r0, [r5]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_1d44
    b .L_1d44
    b .L_1c2c
    b .L_1c80
    b .L_1c9c
    b .L_1ccc
    b .L_1cf8
    b .L_1d08
    b .L_1d18
.L_1c2c:
    mov r0, sl
    bl func_ov006_021b5fe4
    mov r0, sl
    mov r1, r6
    bl func_ov006_021b7a20
    ldr r0, [r9, #0x58]
    cmp r0, #0x6
    bne .L_1c74
    mov r0, r8, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, #0x4
    mov r0, r6, lsl #0x10
    mov r1, r1, lsl #0x10
    str r2, [r9, #0x50]
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x54]
    mov r0, #0x1
    str r0, [r9, #0x74]
.L_1c74:
    mov r7, #0x1
    str r7, [r9, #0x78]
    b .L_1d44
.L_1c80:
    mov r0, sl
    mov r1, r8
    mov r2, r6
    bl func_ov006_021b7aa0
    mov r7, #0x1
    str r7, [r9, #0x74]
    b .L_1d44
.L_1c9c:
    mov r0, #0x85
    sub r1, r0, #0x86
    mov r3, #0x1
    bl func_02037208
    mov r0, sl
    bl func_ov006_021b5fe4
    mov r0, sl
    mov r1, r6
    bl func_ov006_021b79ac
    mov r7, #0x1
    str r7, [r9, #0x78]
    b .L_1d44
.L_1ccc:
    mov r0, r8, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, #0x4
    mov r0, r6, lsl #0x10
    mov r1, r1, lsl #0x10
    str r2, [r9, #0x50]
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x54]
    mov r7, #0x1
    str r7, [r9, #0x74]
    b .L_1d44
.L_1cf8:
    mov r0, sl
    bl func_ov006_021b7b48
    mov r7, #0x1
    b .L_1d44
.L_1d08:
    mov r0, sl
    bl func_ov006_021b7b78
    mov r7, #0x1
    b .L_1d44
.L_1d18:
    ldr r1, _LIT2
    mov r0, r4
    mov r2, #0x9
    bl func_ov006_021ca3e0
    mov r0, r4
    mov r1, #0x2
    mov r2, #0xa
    bl func_ov006_021ca3f0
    mov r0, r4
    ldmib r5, {r1, r2}
    bl func_ov006_021ca264
.L_1d44:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_0225e068
_LIT2: .word 0x00000322
