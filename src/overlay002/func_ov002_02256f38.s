; func_ov002_02256f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202df78
        .extern func_ov002_021d5c50
        .extern func_ov002_021df6d4
        .extern func_ov002_021df938
        .global func_ov002_02256f38
        .arm
func_ov002_02256f38:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    ldr r5, _LIT0
    ldr r6, _LIT1
    str r0, [sp]
    mov r4, #0x3e8
    mov fp, r0
.L_20:
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, [r0, #0xcec]
    ldr r0, [sp]
    eor r7, r2, r0
    ldr r0, _LIT4
    and r2, r7, #0x1
    mla r0, r2, r1, r0
    add r0, r0, #0x100
    ldrh r8, [r0, #0x16]
    cmp r8, #0x0
    beq .L_c8
.L_50:
    add r9, r6, r8, lsl #0x3
    ldrh r0, [r9, #0x2]
    ldrh r8, [r9, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    ldreqh r1, [r9]
    ldreq r0, _LIT0
    cmpeq r1, r0
    bne .L_c0
    ldrh r0, [r9, #0x4]
    mov r1, sl
    bl func_0202df78
    cmp r0, #0x0
    beq .L_c0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021df6d4
    mov r0, r7
    mov r1, r4
    mov r2, fp
    mov r3, r5
    bl func_ov002_021df938
    ldrh r3, [r9, #0x4]
    mov r0, r7
    mov r1, #0xb
    mov r2, r5
    bl func_ov002_021d5c50
.L_c0:
    cmp r8, #0x0
    bne .L_50
.L_c8:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001a9d
_LIT1: .word data_ov002_022d0650
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
