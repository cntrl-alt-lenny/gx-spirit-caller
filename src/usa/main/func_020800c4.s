; func_020800c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020800c4
        .arm
func_020800c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r3, [r0, #0x4]
    ldr r2, _LIT0
    cmp r3, #0x0
    beq .L_2c
    cmp r3, #0x1
    beq .L_48
    cmp r3, #0x2
    beq .L_5c
    b .L_c4
.L_2c:
    ldrh r2, [r0]
    ldrh r3, [r0, #0xc]
    sub r0, r1, r2
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    b .L_c4
.L_48:
    ldrh r2, [r0]
    sub r1, r1, r2
    add r0, r0, r1, lsl #0x1
    ldrh r2, [r0, #0xc]
    b .L_c4
.L_5c:
    ldrh r3, [r0, #0xc]
    add r0, r0, #0xc
    add r0, r0, #0x2
    sub r3, r3, #0x1
    add lr, r0, r3, lsl #0x2
    cmp r0, lr
    bhi .L_c4
.L_78:
    sub ip, lr, r0
    mov r3, ip, asr #0x1
    add r3, ip, r3, lsr #0x1e
    mov r3, r3, asr #0x2
    add r3, r3, r3, lsr #0x1f
    mov ip, r3, asr #0x1
    mov r3, ip, lsl #0x2
    ldrh r3, [r0, r3]
    add ip, r0, ip, lsl #0x2
    cmp r3, r1
    addcc r0, ip, #0x4
    bcc .L_bc
    cmp r1, r3
    subcc lr, ip, #0x4
    bcc .L_bc
    ldrh r2, [ip, #0x2]
    b .L_c4
.L_bc:
    cmp r0, lr
    bls .L_78
.L_c4:
    mov r0, r2
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x0000ffff
