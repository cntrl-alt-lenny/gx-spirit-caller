; func_0200a704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02104f3c
        .extern data_02104f4c
        .extern func_0200a488
        .extern func_0202ae1c
        .extern func_0202af40
        .global func_0200a704
        .arm
func_0200a704:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x14]
    mov r5, #0x0
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_0200a488
    mov r3, r5
    add r2, sp, #0x20
.L_f4c:
    add r0, r4, r3, lsl #0x2
    add r0, r0, #0x1000
    ldr r1, [r2, r3, lsl #0x2]
    ldr r0, [r0, #0x868]
    teq r1, r0
    movne r5, #0x1
    bne .L_f74
    add r3, r3, #0x1
    cmp r3, #0x8
    blt .L_f4c
.L_f74:
    add r1, r4, #0x68
    add r0, sp, #0x20
    add r1, r1, #0x1800
    mov r2, #0x20
    bl Copy32
    add r1, r4, #0x88
    add r0, sp, #0x0
    add r1, r1, #0x1800
    mov r2, #0x20
    bl Copy32
    bl func_0202af40
    mov r0, r5
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f3c
_LIT1: .word data_02104f4c
