; func_0201a9d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b5ab8
        .extern data_020c5ca8
        .extern data_020c5cc8
        .extern data_02102c64
        .extern OS_SPrintf
        .global func_0201a9d0
        .arm
func_0201a9d0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    ldr r6, _LIT0
    add r5, sp, #0x0
    mov ip, r0
    mov r4, r1
    mov lr, r5
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    cmp ip, #0xe
    bne .L_4b4
    ldr r5, _LIT1
    sub r6, ip, #0xa
    ldr r1, [r5]
    ldmib r5, {r0, r2}
    umull ip, r3, r2, r1
    mla r3, r2, r0, r3
    ldr r0, [r5, #0xc]
    ldr r2, [r5, #0x10]
    mla r3, r0, r1, r3
    ldr r0, [r5, #0x14]
    adds r1, r2, ip
    adc ip, r0, r3
    str r1, [r5]
    mov r0, #0x3
    umull r2, r3, ip, r0
    mov r1, #0x0
    mla r3, ip, r1, r3
    mla r3, r1, r0, r3
    ldr r2, [lr, r6, lsl #0x2]
    ldr r1, _LIT2
    mov r0, r4
    add r3, r3, #0x1
    str ip, [r5, #0x4]
    bl OS_SPrintf
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.L_4b4:
    sub r0, ip, #0xa
    ldr r2, [lr, r0, lsl #0x2]
    ldr r1, _LIT3
    mov r0, r4
    bl OS_SPrintf
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020b5ab8
_LIT1: .word data_02102c64
_LIT2: .word data_020c5ca8
_LIT3: .word data_020c5cc8
