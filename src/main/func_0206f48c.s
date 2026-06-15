; func_0206f48c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eeec
        .extern data_0219f262
        .extern func_0206fc2c
        .extern func_0206fc6c
        .extern func_02070430
        .extern func_02070f24
        .extern func_02070f44
        .extern func_02070f78
        .extern func_02070fe8
        .global func_0206f48c
        .arm
func_0206f48c:
    stmdb sp!, {r4, lr}
    bl func_02070f44
    bl func_02070fe8
    ldr r1, _LIT0
    mov r0, #0x44
    ldr r2, [r1]
    mov r1, #0x43
    bl func_02070f78
    ldr r4, _LIT1
    mov r1, #0x7
    mov r0, r4
    mov r2, #0x0
    bl func_0206fc6c
    mov r1, #0xff
    add r2, r0, #0x1
    strb r1, [r0]
    mov r0, #0x0
    mov r1, #0x12c
    sub r3, r2, r4
    bl func_0206fc2c
    sub r1, r0, r4
    mov r0, r4
    bl func_02070430
    bl func_02070f24
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219eeec
_LIT1: .word data_0219f262
