; func_020534b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020534d4
        .global func_020534b4
        .arm
func_020534b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020534d4
    cmp r0, #0x0
    mvnne r0, #0x0
    andne r0, r4, r0
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
