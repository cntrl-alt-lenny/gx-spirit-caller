; func_ov002_0228b4f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e258
        .extern func_0202e42c
        .extern func_ov002_021b9ecc
        .extern func_ov002_0223de94
        .global func_ov002_0228b4f4
        .arm
func_ov002_0228b4f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r9, r1
    mov sl, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x6]
    mov r6, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_f0
    ldr r4, _LIT0
    mov fp, #0x14
.L_34:
    mov r0, r9
    mov r1, r6
    bl func_ov002_0223de94
    ldrh r2, [sl, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r7, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    and r8, r1, #0xff
    bne .L_dc
    cmp r8, #0xa
    bgt .L_dc
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    mov r5, r0
    bl func_0202e258
    cmp r0, #0x0
    bne .L_dc
    mov r0, r5
    bl func_0202e42c
    cmp r0, #0x0
    beq .L_dc
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r0, r1, r0, r4
    mla r0, r8, fp, r0
    ldr r3, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc:
    ldrh r0, [r9, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    blt .L_34
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
