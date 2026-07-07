; func_ov002_021bd77c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202df24
        .extern func_ov002_021b3ef8
        .global func_ov002_021bd77c
        .arm
func_ov002_021bd77c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    movs r0, r9, asr #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, #0x0
.L_168:
    ldr fp, _LIT0
    ldr r1, _LIT1
    and r0, r5, #0x1
    mla r1, r0, fp, r1
    add r7, r1, #0x94
    add r8, r1, #0x64
    mov r6, #0x5
    add r4, fp, #0xb00
.L_188:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_208
    ldr r3, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_208
    ldr r1, [r8, #0x3c]
    mov r0, sl
    bl func_0202df24
    cmp r0, #0x0
    beq .L_208
    cmp r9, #0x0
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r5
    mov r1, r6
    mov r3, r9
    add r2, fp, #0xb00
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_208:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_188
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_168
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
