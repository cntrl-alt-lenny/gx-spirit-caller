; func_ov002_0229a304 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3d68
        .extern data_02103cc0
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d1a18
        .extern data_ov002_022d1a84
        .extern func_ov002_022b2ef8
        .extern func_ov002_022b5070
        .global func_ov002_0229a304
        .arm
func_ov002_0229a304:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1, #0xc8]
    mov r1, #0x0
    beq .L_3b8
    ldr r0, _LIT1
    bl func_ov002_022b2ef8
    ldr r0, _LIT2
    mov r1, #0x1
    bl func_ov002_022b5070
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r1, _LIT4
    mov r3, #0x1
    str r2, [r0]
    str r3, [r1]
    ldmia sp!, {r3, pc}
.L_3b8:
    ldr r0, _LIT2
    bl func_ov002_022b5070
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov002_022b2ef8
    ldr r1, _LIT4
    mov r2, #0x1
    ldr r0, _LIT3
    str r2, [r1]
    str r2, [r0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_ov002_022d1a18
_LIT2: .word data_ov002_022d1a84
_LIT3: .word data_020c3d68
_LIT4: .word data_02103cc0
