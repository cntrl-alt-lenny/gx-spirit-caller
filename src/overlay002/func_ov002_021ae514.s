; func_ov002_021ae514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern func_ov002_0229ade0
        .global func_ov002_021ae514
        .arm
func_ov002_021ae514:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    ldr r6, [sp, #0x30]
    mov r9, #0x2000
    str r2, [sp, #0x4]
    ldr r5, _LIT0
    mov ip, #0x0
    str r1, [sp]
    ldr r4, [sp, #0x34]
    ldr lr, _LIT1
    str r3, [sp, #0x8]
    str r6, [sp, #0xc]
    str ip, [r5, #0xc]
    rsb r9, r9, #0x0
    mov r1, ip
    mov r2, #0x1
    add r8, sp, #0x0
.L_44:
    ldr r7, [r8, ip, lsl #0x2]
    ldr r6, [lr]
    mov sl, r4, lsr ip
    and r3, r7, r9, lsr #0x13
    and r6, r6, r9
    orr r6, r6, r3
    bic r3, r6, #0x4000
    mov sl, sl, lsl #0x1f
    orr r3, r3, sl, lsr #0x11
    str r3, [lr]
    cmp r7, #0x0
    movne r6, r2
    ldr r3, [r5, #0xc]
    moveq r6, r1
    add ip, ip, #0x1
    add r3, r3, r6
    str r3, [r5, #0xc]
    cmp ip, #0x4
    add lr, lr, #0x4
    blt .L_44
    ldr r4, _LIT0
    mov r3, #0x0
    mov r2, r0
    mov r0, #0x31
    mov r1, #0x3
    str r3, [r4, #0x8]
    bl func_ov002_0229ade0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cdc78
_LIT1: .word data_ov002_022cdc88
