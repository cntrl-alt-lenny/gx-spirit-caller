; func_0200a39c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02106730
        .global func_0200a39c
        .arm
func_0200a39c:
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    ldr ip, _LIT0
    mov lr, r0
    mov r1, #0x1
.L_14:
    ldrh r2, [ip]
    mov r2, r2, lsl #0x18
    movs r2, r2, lsr #0x18
    beq .L_3c
    ldrh r2, [ip, #0x4]
    mov r3, r2, lsl #0x1d
    movs r3, r3, lsr #0x1f
    orreq r2, r2, #0x4
    moveq r0, r1
    streqh r2, [ip, #0x4]
.L_3c:
    add lr, lr, #0x1
    cmp lr, #0x50
    add ip, ip, #0x6
    blt .L_14
    ldmia sp!, {r3, pc}
_LIT0: .word data_02106730
