; func_ov002_021eb7b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ac0
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c2624
        .global func_ov002_021eb7b8
        .arm
func_ov002_021eb7b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, r2
    mov sl, r0
    mov r9, r1
    cmp r8, #0x5
    blt .L_20
    cmp r8, #0xa
    ble .L_28
.L_20:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_28:
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r9, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r2, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c2624
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b3618
    ldr r1, _LIT2
    mov r6, r0
    cmp r6, r1
    beq .L_fc
    mov r4, #0x0
    mov fp, r4
.L_90:
    mov r5, fp
    and r7, r4, #0xff
.L_98:
    and r0, r5, #0xff
    orr r0, r7, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r6, r0, lsr #0x10
    beq .L_e4
    mov r0, sl
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    beq .L_e4
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, r5
    bl func_ov002_021b3ac0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e4:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_98
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_90
.L_fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x0000ffff
