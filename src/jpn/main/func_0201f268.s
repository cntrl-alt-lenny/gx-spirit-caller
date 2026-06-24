; func_0201f268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201f2a0
        .global func_0201f268
        .arm
func_0201f268:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_124
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_124:
    bl func_0201f2a0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
