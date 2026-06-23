; func_ov004_021db780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02200c78
        .global func_ov004_021db780
        .arm
func_ov004_021db780:
    stmdb sp!, {r3, lr}
    ldrb r2, [r0]
    mov lr, #0x0
    cmp r2, #0x0
    beq .L_17c
    ldr ip, _LIT0
.L_138:
    ldrb r3, [r0, lr]
    cmp r3, #0x80
    bcc .L_14c
    cmp r3, #0xa0
    bcc .L_158
.L_14c:
    mov r2, lr, lsl #0x1
    strh r3, [r1, r2]
    b .L_16c
.L_158:
    add r2, ip, r3, lsl #0x1
    sub r2, r2, #0x100
    ldrh r3, [r2]
    mov r2, lr, lsl #0x1
    strh r3, [r1, r2]
.L_16c:
    add lr, lr, #0x1
    ldrb r2, [r0, lr]
    cmp r2, #0x0
    bne .L_138
.L_17c:
    mov r2, lr, lsl #0x1
    mov r3, #0x0
    mov r0, lr
    strh r3, [r1, r2]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov004_02200c78
