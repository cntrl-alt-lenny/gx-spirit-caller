; func_ov002_022b3898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02037208
        .extern func_ov002_022b35d8
        .global func_ov002_022b3898
        .arm
func_ov002_022b3898:
    stmdb sp!, {r3, lr}
    ldr r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r3, [r1, #0xb88]
    cmp r3, #0x1
    cmpne r3, #0x2
    movne r2, #0x0
    cmp r2, #0x0
    ldrne r1, _LIT0
    ldrne r1, [r1, #0xb9c]
    cmpne r1, #0x0
    bne .L_158
    cmp r3, #0x3
    ldmneia sp!, {r3, pc}
.L_158:
    mov r2, #0x1
    ldr r1, _LIT0
    str r2, [r0, #0x68]
    ldr r1, [r1, #0xb9c]
    mov r2, #0x0
    bl func_ov002_022b35d8
    mov r0, #0x5e
    sub r1, r0, #0x5f
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
