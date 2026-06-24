; func_0200fd00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218dae8
        .global func_0200fd00
        .arm
func_0200fd00:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr lr, [r1, #0x910]
    cmp lr, #0x0
    beq .L_260
.L_218:
    ldr r3, [lr, #0xc]
    mov r1, r3, lsl #0x1d
    movs ip, r1, lsr #0x1f
    bne .L_254
    ldr r2, [lr, #0x8]
    ldr r1, [r0]
    cmp r2, r1
    moveq r0, lr
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    beq .L_254
    ldr r1, [r0, #0x8]
    cmp r1, r3, lsr #0xc
    moveq r0, lr
    ldmeqia sp!, {r3, pc}
.L_254:
    ldr lr, [lr]
    cmp lr, #0x0
    bne .L_218
.L_260:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_0218dae8
