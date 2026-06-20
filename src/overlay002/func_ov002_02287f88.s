; func_ov002_02287f88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202f9e8
        .extern func_ov002_021bd948
        .extern func_ov002_021c8470
        .global func_ov002_02287f88
        .arm
func_ov002_02287f88:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    ldr r8, _LIT2
    mov r7, r0
    mov r6, r5
.L_1c:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r0, r1, r8, r4
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f9e8
    cmp r0, #0x0
    beq .L_bc
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r8, r4
    add r1, r6, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_bc
    ldr r1, [r9, #0xcec]
    cmp r1, r0
    bne .L_9c
    ldr r1, [r9, #0xcf8]
    cmp r1, #0x2
    bhi .L_9c
    mov r1, r5
    bl func_ov002_021bd948
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_9c:
    ldrh r0, [r7, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    cmp r0, #0x3e8
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_bc:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_1c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
