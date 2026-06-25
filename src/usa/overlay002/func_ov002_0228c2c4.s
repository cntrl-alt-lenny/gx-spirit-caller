; func_ov002_0228c2c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .extern func_ov002_021fbe84
        .global func_ov002_0228c2c4
        .arm
func_ov002_0228c2c4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r7, #0x1
    mla r0, r2, r0, r3
    mov r6, r1
    add r5, r0, #0x94
    mov r4, #0x5
    mov r8, #0x0
.L_72c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_770
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r6, r0
    bne .L_770
    mov r0, r7
    mov r1, r7
    mov r2, r4
    mov r3, r8
    bl func_ov002_021fbe84
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_770:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r5, r5, #0x14
    blt .L_72c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
