; func_020877dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4bd4
        .extern func_0207cef4
        .extern func_0207cf0c
        .extern func_0208977c
        .global func_020877dc
        .arm
func_020877dc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r2, #0x24
    mla r5, r0, r2, r3
    mov r6, r1
    add r0, r5, #0xc
    mov r1, #0x0
    bl func_0207cef4
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r4
    add r0, r5, #0xc
    bl func_0207cf0c
    str r6, [r4, #0xc]
    str r4, [r6, #0x8]
    ldr r0, [r4, #0x8]
    bl func_0208977c
    ldr r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a4bd4
