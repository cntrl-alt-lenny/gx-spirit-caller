; func_0206f418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee0c
        .extern data_0219f182
        .extern func_0206fbb8
        .extern func_0206fbf8
        .extern func_02070348
        .extern func_02070e3c
        .extern func_02070e5c
        .extern func_02070e90
        .extern func_02070f00
        .global func_0206f418
        .arm
func_0206f418:
    stmdb sp!, {r4, lr}
    bl func_02070e5c
    bl func_02070f00
    ldr r1, _LIT0
    mov r0, #0x44
    ldr r2, [r1]
    mov r1, #0x43
    bl func_02070e90
    ldr r4, _LIT1
    mov r1, #0x7
    mov r0, r4
    mov r2, #0x0
    bl func_0206fbf8
    mov r1, #0xff
    add r2, r0, #0x1
    strb r1, [r0]
    mov r0, #0x0
    mov r1, #0x12c
    sub r3, r2, r4
    bl func_0206fbb8
    sub r1, r0, r4
    mov r0, r4
    bl func_02070348
    bl func_02070e3c
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ee0c
_LIT1: .word data_0219f182
