; func_02063808 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206429c
        .extern func_020643d8
        .extern func_020644a4
        .global func_02063808
        .arm
func_02063808:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r2, #0x2
    beq .L_110
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_110:
    mov r0, r1
    mov r1, #0x0
    bl func_020644a4
    mov r1, r0
    mov r0, r4
    bl func_0206429c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
