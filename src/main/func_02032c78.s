; func_02032c78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020334cc
        .global func_02032c78
        .arm
func_02032c78:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    ldr r2, [r4, #0xeb4]
    mov r0, r4
    bic r2, r2, #0x200
    mov r5, r1
    str r2, [r4, #0xeb4]
    bl func_020334cc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r5, #0x0
    ldrne r0, [r4, #0xeb4]
    orrne r0, r0, #0x100
    strne r0, [r4, #0xeb4]
    ldr r1, [r4, #0xf00]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
