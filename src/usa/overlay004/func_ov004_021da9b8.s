; func_ov004_021da9b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104ccc
        .extern data_ov004_0220b2a0
        .extern func_0202b998
        .extern func_020371b8
        .extern func_ov004_021da9ac
        .global func_ov004_021da9b8
        .arm
func_ov004_021da9b8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    add r1, sp, #0x0
    mov r5, r0
    ldr r4, _LIT0
    bl func_ov004_021da9ac
    ldr r0, [sp]
    cmp r0, #0xfa0
    bcc .L_74
    bl func_0202b998
    cmp r0, #0x3
    bge .L_58
    ldr r0, [sp]
    ldr r1, _LIT1
    strh r0, [r1, #0x60]
    bl func_0202b998
    ldr r1, _LIT2
    rsb r0, r0, #0x3
    str r0, [r1, #0xd54]
    mov r0, #0x4
    str r0, [r4, #0x48]
    b .L_88
.L_58:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_74:
    mov r0, #0x0
    str r5, [r4, #0x88]
    str r0, [r4, #0x74]
    str r0, [r4, #0x7c]
    str r0, [r4, #0x78]
.L_88:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104ccc
_LIT2: .word data_02103fcc
