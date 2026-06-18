; func_ov002_021b359c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b30ac
        .global func_ov002_021b359c
        .arm
func_ov002_021b359c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r9, #0x1
    mla r7, r2, r0, r3
    mov r5, #0x0
    mov r8, r1
    mov r4, r5
    add r6, r7, #0x30
.L_28:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    beq .L_58
    mov r0, r9
    mov r1, r4
    mov r2, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_58:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_28
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
