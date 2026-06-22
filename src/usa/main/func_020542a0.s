; func_020542a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .global func_020542a0
        .arm
func_020542a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x10]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0205405c
    ldr r1, [r4, #0x10]
    blx r1
    ldmia sp!, {r4, pc}
