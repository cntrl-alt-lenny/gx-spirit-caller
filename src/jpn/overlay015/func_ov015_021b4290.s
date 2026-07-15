; func_ov015_021b4290 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5d08
        .extern data_ov015_021b5d24
        .extern func_ov005_021ab778
        .extern func_ov005_021aba20
        .extern func_ov005_021abd7c
        .extern func_ov005_021ac814
        .extern func_ov015_021b2530
        .global func_ov015_021b4290
        .arm
func_ov015_021b4290:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r7, r0
    ldr r0, [r2, #0x898]
    mov r6, r1
    cmp r0, #0x0
    ldr r4, _LIT1
    mov r5, #0x0
    beq .L_3d8
    ldr r0, [r4, #0x878]
    bl func_ov005_021aba20
    ldr r0, [r4, #0x848]
    mov r1, r7
    mov r2, r6
    bl func_ov015_021b2530
    ldr r1, [r4, #0xa84]
    add r5, r5, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_3b8
    ldr r0, [r4, #0x878]
    bic r1, r1, #0x1
    str r1, [r4, #0xa84]
    bl func_ov005_021abd7c
    ldr r0, [r4, #0x878]
    bl func_ov005_021ac814
.L_3b8:
    ldr r0, [r4, #0x878]
    mov r2, r7
    mov r3, r6
    mov r1, #0x1000
    bl func_ov005_021ab778
    ldr r0, [r4, #0x878]
    ldrh r0, [r0, #0x38]
    add r5, r5, r0
.L_3d8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov015_021b5d08
_LIT1: .word data_ov015_021b5d24
