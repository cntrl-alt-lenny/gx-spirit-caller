; func_0204f310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff974
        .extern data_020ff980
        .extern data_020ff9a0
        .extern data_020ff9ac
        .extern data_020ff9b8
        .extern func_020498f0
        .extern func_0204f3c0
        .extern func_02067850
        .global func_0204f310
        .arm
func_0204f310:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0204f3c0
    bl func_020498f0
    strb r7, [r0, #0x15]
    bl func_020498f0
    strb r6, [r0, #0x16]
    bl func_020498f0
    str r5, [r0, #0x464]
    bl func_020498f0
    str r4, [r0, #0x468]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17d]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x2d0]
    mov r0, #0x32
    ldr r1, _LIT0
    bl func_02067850
    mov r0, #0x33
    ldr r1, _LIT1
    bl func_02067850
    mov r0, #0x34
    ldr r1, _LIT2
    bl func_02067850
    mov r0, #0x35
    ldr r1, _LIT3
    bl func_02067850
    mov r0, #0x36
    ldr r1, _LIT4
    bl func_02067850
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff980
_LIT1: .word data_020ff9a0
_LIT2: .word data_020ff9ac
_LIT3: .word data_020ff9b8
_LIT4: .word data_020ff974
