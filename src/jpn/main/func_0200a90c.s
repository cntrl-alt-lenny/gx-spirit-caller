; func_0200a90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02104e6c
        .extern func_0200a788
        .global func_0200a90c
        .arm
func_0200a90c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x0
    ldr r5, _LIT0
    mov r4, #0x0
    bl func_0200a788
    mov r3, r4
    add r2, sp, #0x0
.L_4c0:
    add r0, r5, r3, lsl #0x2
    add r0, r0, #0x1000
    ldr r1, [r2, r3, lsl #0x2]
    ldr r0, [r0, #0x8a8]
    teq r1, r0
    movne r4, #0x1
    bne .L_4e8
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_4c0
.L_4e8:
    add r1, r5, #0xa8
    add r0, sp, #0x0
    add r1, r1, #0x1800
    mov r2, #0x8
    bl Copy32
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
