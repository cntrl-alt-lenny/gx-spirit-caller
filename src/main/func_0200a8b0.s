; func_0200a8b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210673c
        .extern data_0210680e
        .global func_0200a8b0
        .arm
func_0200a8b0:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov lr, #0x1
    ldrh r2, [r1, #0xd2]
    mov r1, #0x0
    mov r3, r2, lsl #0x1c
    mov r3, r3, lsr #0x1c
    tst r3, lr, lsl r0
    beq .L_10f4
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x1c
    tst r2, lr, lsl r0
    moveq r1, lr
.L_10f4:
    cmp r1, #0x0
    beq .L_1128
    ldr ip, _LIT1
    ldrh r3, [ip]
    mov r2, r3, lsl #0x18
    mov r2, r2, lsr #0x1c
    orr r0, r2, lr, lsl r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r3, #0xf0
    mov r0, r0, lsl #0x1c
    orr r0, r2, r0, lsr #0x18
    strh r0, [ip]
.L_1128:
    mov r0, r1
    ldmia sp!, {r3, pc}
_LIT0: .word data_0210673c
_LIT1: .word data_0210680e
