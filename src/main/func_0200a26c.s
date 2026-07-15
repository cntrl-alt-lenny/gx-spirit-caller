; func_0200a26c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b476c
        .extern func_0200a014
        .global func_0200a26c
        .arm
func_0200a26c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x30
    ldr lr, _LIT0
    add ip, sp, #0x18
    mov r3, #0x6
.L_e4:
    ldrh r2, [lr]
    ldrh r1, [lr, #0x2]
    add lr, lr, #0x4
    strh r2, [ip]
    strh r1, [ip, #0x2]
    add ip, ip, #0x4
    subs r3, r3, #0x1
    bne .L_e4
    ldr lr, _LIT1
    add ip, sp, #0x0
    mov r3, #0x6
.L_110:
    ldrh r2, [lr]
    ldrh r1, [lr, #0x2]
    add lr, lr, #0x4
    strh r2, [ip]
    strh r1, [ip, #0x2]
    add ip, ip, #0x4
    subs r3, r3, #0x1
    bne .L_110
    add r2, sp, #0x18
    mov r3, r0, lsl #0x1
    add r1, sp, #0x0
    ldrh r0, [r2, r3]
    ldrh r1, [r1, r3]
    bl func_0200a014
    add sp, sp, #0x30
    ldmia sp!, {r3, pc}
_LIT0: .word data_020b476c+0x28
_LIT1: .word data_020b476c+0x10
