; func_02065900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b98
        .extern func_0206eb74
        .global func_02065900
        .arm
func_02065900:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02054b98
    mvn r1, #0x0
    cmp r0, r1
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_0206eb74
    cmp r0, #0x0
    moveq r0, #0x0
    ldrne r0, [r0, #0xc]
    ldrne r0, [r0]
    ldrne r0, [r0]
    ldmia sp!, {r4, pc}
