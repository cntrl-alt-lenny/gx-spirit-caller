; func_ov002_021d1888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021b0b54
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1888
        .arm
func_ov002_021d1888:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r1, #0x1
    ldr r2, [r0, #0x810]
    moveq r1, #0x0
    ldrh r4, [r0, #0x2]
    cmp r2, #0x0
    mov r0, #0x39
    bne .L_50
    mov r2, r4
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, pc}
.L_50:
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r4, #0x0
    beq .L_70
    mov r0, #0x3e
    mov r1, #0x1
    bl func_ov002_021b0b54
.L_70:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce950
