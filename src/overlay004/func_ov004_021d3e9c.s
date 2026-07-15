; func_ov004_021d3e9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02200e00
        .global func_ov004_021d3e9c
        .arm
func_ov004_021d3e9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    mov r6, #0x0
    cmp r2, #0xe8
    cmpeq r1, r3
    mov r4, #0xe8
    subcs r1, r3, #0x1
    ldr r3, _LIT1
    movcs r2, r4
    mov r5, r6
    mov ip, r6
    mov lr, r6
.L_30:
    mov r4, lr
    str lr, [r0, r5, lsl #0x2]
.L_38:
    add r7, r3, r6, lsl #0x3
    ldr r9, [r7, #0x4]
    ldr sl, [r3, r6, lsl #0x3]
    cmp r2, r9
    mov r7, ip
    cmpeq r1, sl
    bcc .L_74
    add fp, r3, r4, lsl #0x3
    ldr r8, [fp, #0x40]
.L_5c:
    adds r7, r7, r8
    subs r1, r1, sl
    sbc r2, r2, r9
    cmp r2, r9
    cmpeq r1, sl
    bcs .L_5c
.L_74:
    ldr r8, [r0, r5, lsl #0x2]
    add r4, r4, #0x1
    add r7, r8, r7
    str r7, [r0, r5, lsl #0x2]
    cmp r4, #0x4
    add r6, r6, #0x1
    bcc .L_38
    add r5, r5, #0x1
    cmp r5, #0x3
    bcc .L_30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xd4a51000
_LIT1: .word data_ov004_02200e00+0x40
