; func_ov002_02296c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bbe70
        .extern func_ov002_02281650
        .global func_ov002_02296c68
        .arm
func_ov002_02296c68:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, r4
    cmp r0, #0x3
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02281650
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT0
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mla r5, r1, r0, r2
    mov r2, r3
    add r1, r5, #0x30
.L_88:
    ldr r0, [r1]
    add r3, r3, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne r0, r5, r2
    ldrneh r0, [r0, #0x36]
    add r1, r1, #0x14
    add r2, r2, #0x14
    cmpne r0, #0x0
    addne r4, r4, #0x1
    cmp r3, #0x5
    blt .L_88
    cmp r4, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
