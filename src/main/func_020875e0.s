; func_020875e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4868
        .extern func_0207cff4
        .extern func_020877c8
        .extern func_02087824
        .global func_020875e0
        .arm
func_020875e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6, #0x4]
    mov r5, r1
    cmp r4, #0x0
    beq .L_2c
    mov r0, r4
    mov r1, r6
    bl func_0207cff4
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_2c:
    ldr r0, _LIT0
    mov r1, r6
    bl func_0207cff4
    strb r5, [r6, #0x3d]
    cmp r4, #0x0
    beq .L_50
    mov r0, r4
    mov r1, r6
    bl func_02087824
.L_50:
    mov r0, r6
    bl func_020877c8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a4868
