; func_ov002_021bba5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021b9ecc
        .global func_ov002_021bba5c
        .arm
func_ov002_021bba5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r1
    mov sl, r0
    mov r0, r9
    mov r6, #0x0
    mov r8, r2
    bl func_0202e234
    cmp r0, #0x0
    movne r5, r6
    movne r4, #0x4
    moveq r5, #0x5
    moveq r4, #0xa
    cmp r5, r4
    bgt .L_b0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mla r7, r5, r0, r2
.L_50:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp r0, r9
    bne .L_a0
    ldr r3, [r7, #0x40]
    ldrh r0, [r7, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_a0
    ldr r0, [r7, #0x3c]
    cmp r8, r0
    addeq r6, r6, #0x1
.L_a0:
    add r5, r5, #0x1
    cmp r5, r4
    add r7, r7, #0x14
    ble .L_50
.L_b0:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
