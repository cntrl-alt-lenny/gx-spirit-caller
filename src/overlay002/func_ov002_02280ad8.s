; func_ov002_02280ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0227b090
        .global func_ov002_02280ad8
        .arm
func_ov002_02280ad8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r9, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r9, #0x1
    mla r7, r1, r0, r2
    mov r8, #0x0
    mov r5, r8
    add r6, r7, #0x30
    add r4, sp, #0x0
.L_370:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_3b8
    mov r0, r9
    mov r1, r5
    mov r2, r4
    bl func_ov002_0227b090
    ldrh r0, [r7, #0x36]
    cmp r0, #0x0
    beq .L_3ac
    ldr r0, [sp, #0x18]
    cmp r8, r0
    movle r8, r0
    b .L_3b8
.L_3ac:
    ldr r0, [sp, #0x14]
    cmp r8, r0
    movle r8, r0
.L_3b8:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_370
    mov r0, r8
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
