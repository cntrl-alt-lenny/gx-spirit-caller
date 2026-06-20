; func_ov002_02287a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .global func_ov002_02287a08
        .arm
func_ov002_02287a08:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, #0x0
    mov r8, r0
    mov r4, r7
.L_10:
    ldrh r0, [r8, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    cmp r7, r0
    bgt .L_44
    ldrh r0, [r8, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    mov r7, r0
.L_44:
    ldrh r0, [r8, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c84a8
    cmp r7, r0
    bgt .L_78
    ldrh r0, [r8, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c84a8
    mov r7, r0
.L_78:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_10
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r5, r6
.L_94:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r5, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_d0
    mov r1, r6
    bl func_ov002_021c8470
    cmp r0, r7
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_d0:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r5, r5, #0x14
    blt .L_94
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
