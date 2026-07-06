; func_ov002_021d1b34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca8b4
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021ae3c0
        .extern func_ov002_021ae6c8
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .extern func_ov002_0229cd4c
        .global func_ov002_021d1b34
        .arm
func_ov002_021d1b34:
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
    bl func_ov002_0229cc78
    ldr r1, _LIT1
    add r0, sp, #0x100
    bl func_ov002_0229cca8
    add r0, sp, #0x100
    mov r1, #0xcc
    bl func_ov002_0229cca8
    add r0, sp, #0x100
    mov r1, #0x3
    bl func_ov002_021ae3c0
    b .L_a4
.L_6c:
    cmp r4, #0x8c
    bne .L_94
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov002_0229cd4c
    add r0, sp, #0x0
    bl func_ov002_021ae3a4
    b .L_a4
.L_94:
    ldr r0, _LIT2
    mov r1, r4
    ldr r0, [r0, #0x4]
    bl func_ov002_021ae320
.L_a4:
    bl func_ov002_021ae6c8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022ca8b4
_LIT2: .word data_ov002_022cd65c
