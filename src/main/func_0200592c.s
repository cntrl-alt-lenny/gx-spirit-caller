; func_0200592c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208ce48
        .extern func_0208ce70
        .extern func_0208ce98
        .extern func_0208ceac
        .extern func_0208cec0
        .extern func_0208ced4
        .extern func_0208cee8
        .extern func_0208cefc
        .extern func_0208cf20
        .extern func_0208cf44
        .extern func_0208cf58
        .global func_0200592c
        .arm
func_0200592c:
    stmdb sp!, {r3, lr}
    bl func_0208cf58
    bl func_0208ceac
    bl func_0208cf44
    bl func_0208ce98
    bl func_0208cf20
    bl func_0208cefc
    bl func_0208ce70
    bl func_0208ce48
    bl func_0208cee8
    bl func_0208ced4
    bl func_0208cec0
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    mov r2, #0x0
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    add r1, r1, #0x1000
    str r2, [r1]
    str r2, [r0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x04000010
_LIT1: .word 0x04001014
