; func_02032c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032638
        .global func_02032c74
        .arm
func_02032c74:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02032638
    ldr r3, [r0, #0xf00]
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    blx r3
    ldmia sp!, {r4, r5, r6, pc}
