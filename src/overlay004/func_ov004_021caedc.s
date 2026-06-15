; func_ov004_021caedc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104cf8
        .extern data_ov004_0220b500
        .extern func_0201cfa0
        .extern func_0201d040
        .extern func_0201d050
        .extern func_0201d060
        .global func_ov004_021caedc
        .arm
func_ov004_021caedc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    bl func_0201cfa0
    cmp r0, #0x0
    beq .L_128
    bl func_0201d040
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_114
    b .L_114
    b .L_d8
    b .L_ec
    b .L_64
    b .L_3c
    b .L_50
.L_3c:
    mov r1, #0x1
    mov r0, #0x13
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c
.L_50:
    mov r1, #0x1
    mov r0, #0x16
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c
.L_64:
    mov ip, #0x0
    ldr r5, _LIT1
    mov r6, r4
    mov r2, ip
.L_74:
    add r0, r4, ip, lsl #0x2
    ldr r3, [r5]
    add r0, r0, #0x3000
    mov lr, r2
    str r3, [r0, #0xc0c]
    cmp r3, #0x0
    bls .L_b0
.L_90:
    add r0, r5, lr, lsl #0x1
    ldrh r1, [r0, #0xc]
    add r0, r6, lr, lsl #0x2
    add r0, r0, #0x3000
    add lr, lr, #0x1
    str r1, [r0, #0xc14]
    cmp lr, r3
    bcc .L_90
.L_b0:
    add ip, ip, #0x1
    cmp ip, #0x2
    add r5, r5, #0x108
    add r6, r6, #0x28
    blt .L_74
    mov r1, #0x3
    mov r0, #0x11
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c
.L_d8:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c
.L_ec:
    mov r1, #0x1
    ldr r0, _LIT2
    str r1, [r4, #0x48]
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    moveq r0, #0x9
    streq r0, [r4, #0x54]
    movne r0, #0x4
    strne r0, [r4, #0x54]
    b .L_15c
.L_114:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c
.L_128:
    bl func_0201d060
    cmp r0, #0x0
    beq .L_14c
    mov r0, #0x0
    str r0, [r4, #0x48]
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    bl func_0201d050
    b .L_15c
.L_14c:
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
.L_15c:
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x4c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104cf8
_LIT2: .word data_021040ac
