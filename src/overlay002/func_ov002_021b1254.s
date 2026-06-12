; func_ov002_021b1254 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021b1254
        .arm
func_ov002_021b1254:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr ip, _LIT0
    ldr r0, [ip, #0xd48]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [ip, #0xd4c]
    cmp r0, #0x0
    bne .L_50
    mov r1, #0x0
    mov lr, #0x1
    mov r2, r1
    mov r3, r1
    mov r0, #0x3
    str lr, [ip, #0xd4c]
    bl func_ov002_0229ade0
.L_50:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_58:
    mov r0, #0x0
    str r0, [ip, #0xd4c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
