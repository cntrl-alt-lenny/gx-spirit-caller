; func_ov002_021b3784 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_ov002_021b9dec
        .global func_ov002_021b3784
        .arm
func_ov002_021b3784:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    mov r5, #0x14
    ldr r6, _LIT1
    and r7, r0, #0x1
    mul r5, r1, r5
    mla r0, r7, r4, r6
    ldrh r5, [r5, r0]
    mov sl, r2
    mov r9, r3
    cmp r5, #0x0
    beq .L_d8
    ldr fp, _LIT2
.L_34:
    add r1, fp, r5, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcc .L_d0
    ldrh r6, [r1]
    mov r0, r6, asr #0x8
    and r8, r0, #0xff
    and r7, r6, #0xff
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dec
    cmp sl, r0
    bne .L_d0
    ldr r0, _LIT3
    and r1, r7, #0x1
    mla r2, r1, r4, r0
    mov r0, #0x14
    mla r0, r8, r0, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r3, r1, lsr #0x6
    mov r2, r1, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r1, lsr #0x1
    mvn r3, r3
    and r2, r2, #0x1
    and r3, r0, r3
    mvn r0, r2
    tst r3, r0
    beq .L_d0
    mov r0, r1, lsr #0x5
    and r0, r0, #0x1
    cmp r9, r0
    moveq r0, r6, lsl #0x10
    moveq r0, r0, lsr #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0:
    cmp r5, #0x0
    bne .L_34
.L_d8:
    ldr r0, _LIT4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x0000ffff
