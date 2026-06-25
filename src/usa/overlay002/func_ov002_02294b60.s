; func_ov002_02294b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b854
        .extern func_ov002_021afa94
        .extern func_ov002_021c8400
        .extern func_ov002_02280594
        .global func_ov002_02294b60
        .arm
func_ov002_02294b60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280594
    cmp r0, #0x0
    blt .L_160
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r6, r0
    mov r7, r5
.L_10c:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_148
    mov r1, r5
    bl func_ov002_021c8400
    cmp r0, r6
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_148:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    blt .L_10c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
