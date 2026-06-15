; func_0201f2bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f2f4
        .global func_0201f2bc
        .arm
func_0201f2bc:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_124
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_124:
    bl func_0201f2f4
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
