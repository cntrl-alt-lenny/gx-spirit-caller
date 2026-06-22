; func_02031ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020318f8
        .global func_02031ae4
        .arm
func_02031ae4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_020318f8
    str r0, [r4, #0x10]
    str r1, [r4, #0x14]
    ldr r1, [r5, #0x30]
    add r0, r5, #0x30
    str r4, [r1, #0x4]
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x30]
    str r0, [r4]
    str r4, [r5, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
