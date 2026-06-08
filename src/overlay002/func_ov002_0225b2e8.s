; func_ov002_0225b2e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021bf294
        .global func_ov002_0225b2e8
        .arm
func_ov002_0225b2e8:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    mov lr, r0
    ldr r0, [ip]
    cmp lr, r0
    beq .L_124c
    add r3, r1, r2
    cmp r3, #0x4
    bgt .L_124c
    mov r1, #0x1
    str r1, [sp]
    ldr r1, [ip, #0x1c]
    mov r2, lr
    bl func_ov002_021bf294
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_124c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd3f4
