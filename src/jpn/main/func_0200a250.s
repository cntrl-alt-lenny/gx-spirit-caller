; func_0200a250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4688
        .extern data_020b46a0
        .extern func_02009ff8
        .global func_0200a250
        .arm
func_0200a250:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x30
    ldr lr, _LIT0
    add ip, sp, #0x18
    mov r3, #0x6
.L_14:
    ldrh r2, [lr]
    ldrh r1, [lr, #0x2]
    add lr, lr, #0x4
    strh r2, [ip]
    strh r1, [ip, #0x2]
    add ip, ip, #0x4
    subs r3, r3, #0x1
    bne .L_14
    ldr lr, _LIT1
    add ip, sp, #0x0
    mov r3, #0x6
.L_40:
    ldrh r2, [lr]
    ldrh r1, [lr, #0x2]
    add lr, lr, #0x4
    strh r2, [ip]
    strh r1, [ip, #0x2]
    add ip, ip, #0x4
    subs r3, r3, #0x1
    bne .L_40
    add r2, sp, #0x18
    mov r3, r0, lsl #0x1
    add r1, sp, #0x0
    ldrh r0, [r2, r3]
    ldrh r1, [r1, r3]
    bl func_02009ff8
    add sp, sp, #0x30
    ldmia sp!, {r3, pc}
_LIT0: .word data_020b46a0
_LIT1: .word data_020b4688
