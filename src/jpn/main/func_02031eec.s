; func_02031eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e68
        .global func_02031eec
        .arm
func_02031eec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_98:
    ldr r4, [r1, #0x4]
    mov r0, r5
    bl func_02031e68
    mov r1, r4
    cmp r4, #0x0
    bne .L_98
    ldmia sp!, {r3, r4, r5, pc}
