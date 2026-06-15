; func_020294c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c68f8
        .extern data_020c68fc
        .extern func_02005dac
        .extern func_020944a4
        .global func_020294c0
        .arm
func_020294c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldrsh r4, [r0, #0x8c]
    ldrb r2, [r0, #0x6d]
    cmp r4, #0x0
    beq .L_d0c
    ldrb r1, [r0, #0x6c]
    ldr r3, _LIT0
    cmp r1, #0x1
    ldr r1, _LIT1
    ldr r3, [r3, r2, lsl #0x3]
    ldr r1, [r1, r2, lsl #0x3]
    mov r3, r3, asr #0x3
    mov r1, r1, asr #0x3
    mul r1, r3, r1
    mul r1, r4, r1
    moveq r5, #0x1
    movne r5, #0x2
    mov r5, r1, asr r5
    b .L_d10
.L_d0c:
    mov r5, #0x0
.L_d10:
    ldrb lr, [r0, #0x6c]
    ldr r1, [r0, #0x74]
    ldr r3, [r0, #0x70]
    cmp lr, #0x1
    moveq r4, r1, lsr #0x9
    movne r4, r1, lsr #0x5
    add r1, r0, #0x100
    ldrh r1, [r1, #0x9a]
    add ip, r5, r3, lsr #0x7
    ldr r3, _LIT1
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1f
    ldr r6, [r3, r2, lsl #0x3]
    ldr r1, _LIT0
    movne r5, #0x1
    ldr r1, [r1, r2, lsl #0x3]
    mov r7, r6, asr #0x1
    ldr r8, [r0, #0x170]
    moveq r5, #0x0
    add r3, r0, #0x100
    ldr r6, [r0, #0x16c]
    mov r1, r1, asr #0x1
    rsb r7, r7, r8, asr #0x4
    rsb r1, r1, r6, asr #0x4
    cmp r5, #0x3
    ldrsh r3, [r3, #0x8e]
    and r6, r7, #0xff
    bne .L_da4
    and lr, r2, #0xc
    mov r2, r2, lsl #0x1e
    orr lr, r2, lr, lsl #0xc
    orr r2, r6, r5, lsl #0xa
    mov r5, r1, lsl #0x17
    orr r1, lr, r2
    orr r1, r1, r5, lsr #0x7
    str r1, [sp]
    b .L_dc8
.L_da4:
    orr r6, r6, lr, lsl #0xd
    and lr, r2, #0xc
    mov r2, r2, lsl #0x1e
    orr lr, r2, lr, lsl #0xc
    orr r2, r6, r5, lsl #0xa
    mov r5, r1, lsl #0x17
    orr r1, lr, r2
    orr r1, r1, r5, lsr #0x7
    str r1, [sp]
.L_dc8:
    orr r1, ip, r3, lsl #0xa
    orr r1, r1, r4, lsl #0xc
    add r0, r0, #0x100
    strh r1, [sp, #0x4]
    ldrsh r1, [r0, #0x8c]
    cmp r1, #0x0
    ldrsh r1, [r0, #0x90]
    bne .L_df4
    mov r0, #0x1
    bl func_02005dac
    b .L_dfc
.L_df4:
    mov r0, #0x2
    bl func_02005dac
.L_dfc:
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020c68f8
_LIT1: .word data_020c68fc
