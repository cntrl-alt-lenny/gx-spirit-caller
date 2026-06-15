; func_0202c948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ad48
        .extern func_0202c9c0
        .extern func_0202cc8c
        .extern func_02034784
        .global func_0202c948
        .arm
func_0202c948:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    str r0, [r2, #0x68]
    mov r0, #0x0
    str r1, [r2, #0x6c]
    bl func_0202cc8c
    mov r0, #0x0
    bl func_0202c9c0
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x18]
    str r1, [r0, #0x14]
    bl func_02034784
    cmp r0, #0x0
    movne r1, #0xf0
    ldr r0, _LIT0
    moveq r1, #0x100
    str r1, [r0, #0xc]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219ad48
