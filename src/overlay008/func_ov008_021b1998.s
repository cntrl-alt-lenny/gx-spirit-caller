; func_ov008_021b1998 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov008_021b270c
        .extern func_02001d0c
        .extern func_02005088
        .extern func_0202c44c
        .extern func_0208df0c
        .extern func_0208e1cc
        .extern func_02094504
        .extern func_02094550
        .global func_ov008_021b1998
        .arm
func_ov008_021b1998:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0xc8
    bl func_0208df0c
    mov r4, r0
    add r1, r4, #0x220
    mov r0, #0x0
    mov r2, #0x1800
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x40
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_0202c44c
    add r2, r4, #0x220
    mov r1, r0
    mov r0, #0x6
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r3, #0x5
    bl func_02005088
    mov r0, #0x0
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0x8]
    ldr r2, [r1]
    add r3, r3, #0x6
    bic r3, r3, #0x7
    str r3, [r2, #0x18]
    ldr r1, [r1]
    ldr r2, [r1, #0x1c]
    ldr r1, [r1, #0x18]
    cmp r1, r2
    bgt .L_1690
    sub r1, r2, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
.L_1690:
    mov r4, #0x0
    mov r6, #0x11
    mov ip, r4
    add r3, sp, #0x8
    mov lr, r4
.L_16a4:
    mov r5, lr
    add r2, r3, r4, lsl #0x6
.L_16ac:
    cmp r5, r0
    movlt r7, ip
    blt .L_16c8
    sub r1, r5, r0
    add r1, r6, r1
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
.L_16c8:
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    strh r7, [r1, r2]
    cmp r5, #0x20
    blt .L_16ac
    add r4, r4, #0x1
    cmp r4, #0x3
    add r6, r6, #0x40
    blt .L_16a4
    bl func_0208e1cc
    mov r1, r0
    add r0, sp, #0x8
    mov r2, #0xc0
    bl func_02094550
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x20]
    add sp, sp, #0xc8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02102c90
_LIT1: .word data_ov008_021b270c
