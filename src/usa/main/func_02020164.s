; func_02020164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_02020198
        .extern func_02020b4c
        .global func_02020164
        .arm
func_02020164:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_1c
    bl func_0201f148
    bl func_02020b4c
    ldmia sp!, {r3, pc}
.L_1c:
    bl func_02020198
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
