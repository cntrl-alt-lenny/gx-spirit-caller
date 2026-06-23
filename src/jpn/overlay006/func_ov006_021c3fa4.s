; func_ov006_021c3fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f328
        .extern data_ov006_0225df48
        .extern func_020371b8
        .extern func_ov006_021b5ee4
        .extern func_ov006_021b78ac
        .extern func_ov006_021b7920
        .extern func_ov006_021b79a0
        .extern func_ov006_021b7a48
        .extern func_ov006_021b7a78
        .extern func_ov006_021ca158
        .extern func_ov006_021ca2d4
        .extern func_ov006_021ca2e4
        .global func_ov006_021c3fa4
        .arm
func_ov006_021c3fa4:
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
    b .L_1a4
    b .L_1a4
    b .L_8c
    b .L_e0
    b .L_fc
    b .L_12c
    b .L_158
    b .L_168
    b .L_178
.L_8c:
    mov r0, sl
    bl func_ov006_021b5ee4
    mov r0, sl
    mov r1, r6
    bl func_ov006_021b7920
    ldr r0, [r9, #0x58]
    cmp r0, #0x6
    bne .L_d4
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
.L_d4:
    mov r7, #0x1
    str r7, [r9, #0x78]
    b .L_1a4
.L_e0:
    mov r0, sl
    mov r1, r8
    mov r2, r6
    bl func_ov006_021b79a0
    mov r7, #0x1
    str r7, [r9, #0x74]
    b .L_1a4
.L_fc:
    mov r0, #0x85
    sub r1, r0, #0x86
    mov r3, #0x1
    bl func_020371b8
    mov r0, sl
    bl func_ov006_021b5ee4
    mov r0, sl
    mov r1, r6
    bl func_ov006_021b78ac
    mov r7, #0x1
    str r7, [r9, #0x78]
    b .L_1a4
.L_12c:
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
    b .L_1a4
.L_158:
    mov r0, sl
    bl func_ov006_021b7a48
    mov r7, #0x1
    b .L_1a4
.L_168:
    mov r0, sl
    bl func_ov006_021b7a78
    mov r7, #0x1
    b .L_1a4
.L_178:
    ldr r1, _LIT2
    mov r0, r4
    mov r2, #0x9
    bl func_ov006_021ca2d4
    mov r0, r4
    mov r1, #0x2
    mov r2, #0xa
    bl func_ov006_021ca2e4
    mov r0, r4
    ldmib r5, {r1, r2}
    bl func_ov006_021ca158
.L_1a4:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_0225df48
_LIT2: .word 0x00000322
