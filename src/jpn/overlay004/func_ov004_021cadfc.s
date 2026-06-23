; func_ov004_021cadfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104c18
        .extern data_ov004_0220b2a0
        .extern func_0201cf4c
        .extern func_0201cfec
        .extern func_0201cffc
        .extern func_0201d00c
        .global func_ov004_021cadfc
        .arm
func_ov004_021cadfc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    bl func_0201cf4c
    cmp r0, #0x0
    beq .L_e6c
    bl func_0201cfec
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_e58
    b .L_e58
    b .L_e1c
    b .L_e30
    b .L_da8
    b .L_d80
    b .L_d94
.L_d80:
    mov r1, #0x1
    mov r0, #0x13
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_ea0
.L_d94:
    mov r1, #0x1
    mov r0, #0x16
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_ea0
.L_da8:
    mov ip, #0x0
    ldr r5, _LIT1
    mov r6, r4
    mov r2, ip
.L_db8:
    add r0, r4, ip, lsl #0x2
    ldr r3, [r5]
    add r0, r0, #0x3000
    mov lr, r2
    str r3, [r0, #0xc0c]
    cmp r3, #0x0
    bls .L_df4
.L_dd4:
    add r0, r5, lr, lsl #0x1
    ldrh r1, [r0, #0xc]
    add r0, r6, lr, lsl #0x2
    add r0, r0, #0x3000
    add lr, lr, #0x1
    str r1, [r0, #0xc14]
    cmp lr, r3
    bcc .L_dd4
.L_df4:
    add ip, ip, #0x1
    cmp ip, #0x2
    add r5, r5, #0x108
    add r6, r6, #0x28
    blt .L_db8
    mov r1, #0x3
    mov r0, #0x11
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_ea0
.L_e1c:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_ea0
.L_e30:
    mov r1, #0x1
    ldr r0, _LIT2
    str r1, [r4, #0x48]
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    moveq r0, #0x9
    streq r0, [r4, #0x54]
    movne r0, #0x4
    strne r0, [r4, #0x54]
    b .L_ea0
.L_e58:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_ea0
.L_e6c:
    bl func_0201d00c
    cmp r0, #0x0
    beq .L_e90
    mov r0, #0x0
    str r0, [r4, #0x48]
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    bl func_0201cffc
    b .L_ea0
.L_e90:
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
.L_ea0:
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x4c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104c18
_LIT2: .word data_02103fcc
