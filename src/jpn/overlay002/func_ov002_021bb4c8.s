; func_ov002_021bb4c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .global func_ov002_021bb4c8
        .arm
func_ov002_021bb4c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, sl, #0x1
    mla r7, r2, r0, r3
    mov r6, #0x0
    ldr fp, _LIT2
    mov r9, r1
    mov r5, r6
    mov r8, sl, lsl #0x4
    mov r4, #0x1
.L_194:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_1f0
    ldr r1, [r7, #0x40]
    ldrh r0, [r7, #0x38]
    mov r3, r1, lsr #0x6
    mov r2, r1, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r1, lsr #0x1
    mvn r3, r3
    and r2, r2, #0x1
    and r3, r0, r3
    mvn r0, r2
    tst r3, r0
    beq .L_1f0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_1f0
    ldr r0, [fp, #0xd4]
    tst r0, r4, lsl r8
    addeq r6, r6, #0x1
.L_1f0:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_194
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c
