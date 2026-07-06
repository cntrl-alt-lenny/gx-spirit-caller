; func_ov002_021f117c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_ov002_021bc7e8
        .extern func_ov002_0223b340
        .extern func_ov002_0223b378
        .extern func_ov002_0223b3d4
        .global func_ov002_021f117c
        .arm
func_ov002_021f117c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_bc
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    beq .L_60
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_bc
.L_60:
    ldrh r8, [r6, #0x8]
    ldrh r9, [r6, #0xa]
    mov r0, r8
    bl func_ov002_0223b378
    mov sl, r0
    cmp sl, #0x0
    mov r7, #0x0
    ble .L_bc
    mov r6, #0x1
.L_84:
    tst r9, r6, lsl r7
    bne .L_b0
    mov r0, r8
    mov r1, r7
    bl func_ov002_0223b3d4
    mov r1, r5
    mov r2, r4
    bl func_ov002_0223b340
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b0:
    add r7, r7, #0x1
    cmp r7, sl
    blt .L_84
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
