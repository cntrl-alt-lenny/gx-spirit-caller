; func_ov002_021d1c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca9b4
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021ae4a0
        .extern func_ov002_021ae7a8
        .extern func_ov002_0229cd88
        .extern func_ov002_0229cdb8
        .extern func_ov002_0229ce5c
        .global func_ov002_021d1c1c
        .arm
func_ov002_021d1c1c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x200
    ldr r1, _LIT0
    ldr r2, [r1, #0x810]
    ldrh r4, [r1, #0x4]
    cmp r2, #0x0
    ldrh r0, [r1, #0x6]
    bne .L_a4
    add r2, r2, #0x1
    str r2, [r1, #0x810]
    cmp r4, #0xa9
    blt .L_6c
    cmp r4, #0xcb
    bgt .L_6c
    add r0, sp, #0x100
    mov r1, r4
    bl func_ov002_0229cd88
    ldr r1, _LIT1
    add r0, sp, #0x100
    bl func_ov002_0229cdb8
    add r0, sp, #0x100
    mov r1, #0xcc
    bl func_ov002_0229cdb8
    add r0, sp, #0x100
    mov r1, #0x3
    bl func_ov002_021ae4a0
    b .L_a4
.L_6c:
    cmp r4, #0x8c
    bne .L_94
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov002_0229ce5c
    add r0, sp, #0x0
    bl func_ov002_021ae484
    b .L_a4
.L_94:
    ldr r0, _LIT2
    mov r1, r4
    ldr r0, [r0, #0x4]
    bl func_ov002_021ae400
.L_a4:
    bl func_ov002_021ae7a8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022ca9b4
_LIT2: .word data_ov002_022cd73c
