; func_ov002_0223a5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae638
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021de9d4
        .extern func_ov002_021e286c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225368c
        .extern func_ov002_0225764c
        .extern func_ov002_0227ac64
        .global func_ov002_0223a5fc
        .arm
func_ov002_0223a5fc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_260
    b .L_218
    b .L_1ac
    b .L_17c
    b .L_f4
    b .L_38
.L_38:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_e8
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_e8
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r3, r4, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    strh r0, [r6, #0xa]
    mla r0, r5, r1, r2
    ldr r1, [r0, #0x30]
    mov r0, r6
    mov r1, r1, lsl #0x12
    mov r3, r1, lsr #0x1f
    mov r1, r4
    mov r2, r5
    strh r3, [r6, #0xc]
    bl func_ov002_021de9d4
    cmp r0, #0x0
    beq .L_e8
    ldrh r0, [r6, #0xc]
    bl func_ov002_021e286c
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_e8:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_f4:
    ldrh r0, [r6, #0xc]
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldrh r3, [r6, #0xa]
    ldrh r2, [r6, #0xc]
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    mov r0, r0, lsr #0x1f
    orr r2, r3, r2, lsl #0x10
    bl func_ov002_0225368c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, #0xf0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_17c:
    ldrh r0, [r6, #0x2]
    ldrh r3, [r6, #0xa]
    ldrh r1, [r6, #0xc]
    mov r0, r0, lsl #0x1f
    ldrh r2, [r6]
    orr r3, r3, r1, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af9d0
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1ac:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_1d8
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_20c
.L_1d8:
    bl func_ov002_021afb74
    mov r4, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r0, #0xf7
    mov r2, #0x1
    bl func_ov002_021ae638
.L_20c:
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_218:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6, #0xc]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r4, #0x10
    bl func_ov002_021afb74
    ldrh r3, [r6]
    mov r1, r4, lsl #0x10
    ldr r2, _LIT4
    mov r3, r3, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    str r1, [sp]
    mov r1, r0
    ldr r3, [r2, #0xd44]
    ldrh r0, [r6, #0xc]
    mov r2, #0x1
    bl func_ov002_0227ac64
.L_260:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
