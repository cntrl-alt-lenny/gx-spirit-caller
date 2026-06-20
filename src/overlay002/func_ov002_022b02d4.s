; func_ov002_022b02d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022ca510
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .global func_ov002_022b02d4
        .arm
func_ov002_022b02d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r1, [r1, #0x4]
    mov r3, #0x1400
    mov r1, r1, lsl #0x1b
    mov r5, r1, lsr #0x1e
    mov r2, r5, lsr #0x1f
    rsb r1, r2, r5, lsl #0x1f
    mov sl, r0
    adds r0, r2, r1, ror #0x1f
    movne r1, #0xe7
    add r0, r5, r5, lsr #0x1f
    moveq r1, #0x0
    str r4, [sp]
    movs r0, r0, asr #0x1
    movne r9, #0x0
    mov r4, #0x400
    ldr r5, _LIT2
    ldr fp, _LIT3
    strh r3, [sp, #0x4]
    moveq r9, #0x10
    mov r6, r1, lsl #0x17
    mov r7, #0x0
    mov r8, #0x1400
    rsb r4, r4, #0x0
.L_1a8:
    ldr r1, [sp]
    and r0, r9, #0xff
    and r1, r1, fp
    orr r0, r1, r0
    orr r0, r0, r6, lsr #0x7
    str r0, [sp]
    ldr r0, [sl, #0x8]
    cmp r7, r0
    bne .L_1e0
    ldrh r0, [sp, #0x4]
    and r0, r0, r4
    orr r0, r0, #0x60
    strh r0, [sp, #0x4]
    b .L_218
.L_1e0:
    ldr r0, [sl, #0x4]
    cmp r7, r0
    bne .L_200
    ldrh r0, [sp, #0x4]
    and r0, r0, r4
    orr r0, r0, #0x58
    strh r0, [sp, #0x4]
    b .L_218
.L_200:
    ldrh r1, [sp, #0x4]
    mov r0, r8, asr #0x6
    add r0, r8, r0, lsr #0x19
    and r1, r1, r4
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0x4]
.L_218:
    ldr r0, _LIT4
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_0207f05c
    ldr r0, [r5, r7, lsl #0x2]
    add r7, r7, #0x1
    cmp r7, #0x6
    add r9, r9, r0
    add r8, r8, #0x400
    blt .L_1a8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x80002000
_LIT2: .word data_ov002_022ca510
_LIT3: .word 0xfe00ff00
_LIT4: .word data_ov002_022d0f98
