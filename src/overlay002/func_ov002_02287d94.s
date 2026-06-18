; func_ov002_02287d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c325c
        .extern func_ov002_021c84e0
        .global func_ov002_02287d94
        .arm
func_ov002_02287d94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c325c
    movs r5, r0
    beq .L_134
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r7, r6
.L_d0:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    add r1, r2, r7
    ldr r2, [r1, #0x30]
    ldrh r1, [r1, #0x38]
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    cmp r1, #0x0
    cmpne r2, #0x0
    beq .L_124
    mov r1, r6
    bl func_ov002_021c84e0
    cmp r0, #0x0
    beq .L_124
    cmp r0, r5
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_124:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    blt .L_d0
.L_134:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
