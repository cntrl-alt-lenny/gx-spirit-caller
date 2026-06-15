; func_02054314 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .global func_02054314
        .arm
func_02054314:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x10]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020540d0
    ldr r1, [r4, #0x10]
    blx r1
    ldmia sp!, {r4, pc}
