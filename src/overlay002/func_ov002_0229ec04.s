; func_ov002_0229ec04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern func_ov002_0229ea40
        .global func_ov002_0229ec04
        .arm
func_ov002_0229ec04:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r1
    ldrh r1, [r4, #0x28]
    mov r5, r0
    add r0, sp, #0x0
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_0229ea40
    ldrsh r3, [r4, #0x2a]
    ldr r2, _LIT0
    ldr lr, [sp]
    smull r1, r0, r2, r3
    mov r1, r3, lsr #0x1f
    add r0, r1, r0, asr #0x2
    ldrh r1, [r4, #0x28]
    cmp r0, #0x3
    ldrh r2, [r4, #0x28]
    mov r1, r1, lsl #0x1a
    ldr ip, [sp, #0x4]
    mov r1, r1, lsr #0x1b
    movgt r0, #0x3
    cmp r1, #0xc
    ldr r1, _LIT1
    moveq r3, #0x1
    ldr r1, [r1, #0x4]
    mov r2, r2, lsl #0x1f
    eor r1, r1, #0x1
    movne r3, #0x0
    cmp r1, r2, lsr #0x1f
    moveq r1, #0x1
    movne r1, #0x0
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    cmp r0, #0x1
    eor r1, r3, r1
    beq .L_458
    cmp r0, #0x2
    beq .L_468
    cmp r0, #0x3
    beq .L_490
    b .L_4b4
.L_458:
    ldr r0, [sp, #0xc]
    sub r0, r0, #0x1
    str r0, [sp, #0xc]
    b .L_4b4
.L_468:
    cmp r1, #0x0
    mvnne r2, #0x0
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x8]
    moveq r2, #0x1
    add r1, r1, r2
    sub r0, r0, #0x2
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    b .L_4b4
.L_490:
    cmp r1, #0x0
    mvnne r2, #0x0
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x8]
    moveq r2, #0x1
    add r1, r1, r2
    sub r0, r0, #0x3
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
.L_4b4:
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    str r1, [r5]
    str r0, [r5, #0x4]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov002_022cd73c
