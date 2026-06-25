; func_0203e90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bed88
        .extern data_020bed90
        .extern func_0203e384
        .extern func_02092fc8
        .global func_0203e90c
        .arm
func_0203e90c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    mov r0, #0x0
    strb r0, [r4, #0xd11]
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    add r0, r4, #0xd00
    ldrsb r2, [r0, #0x11]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, #0x200000
    bl func_0203e384
    mov r0, #0x3
    ldmia sp!, {r4, pc}
_LIT0: .word data_020bed88
_LIT1: .word data_020bed90
