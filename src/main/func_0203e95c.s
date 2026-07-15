; func_0203e95c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee6c
        .extern func_0203e3d4
        .extern func_020930b0
        .global func_0203e95c
        .arm
func_0203e95c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    mov r0, #0x0
    strb r0, [r4, #0xd11]
    bl func_020930b0
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    add r0, r4, #0xd00
    ldrsb r2, [r0, #0x11]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, #0x200000
    bl func_0203e3d4
    mov r0, #0x3
    ldmia sp!, {r4, pc}
_LIT0: .word data_020bee6c+0x10
_LIT1: .word data_020bee6c+0x18
