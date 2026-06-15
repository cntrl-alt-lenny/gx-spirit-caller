; func_02027ee4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02027ee4
        .arm
func_02027ee4:
    ldrsh r1, [r0, #0xd4]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_134
    b .L_30
    b .L_38
    b .L_40
    b .L_48
    b .L_b4
    b .L_bc
    b .L_c4
    b .L_cc
.L_30:
    mov r1, #0x1
    b .L_4c
.L_38:
    mov r1, #0x2
    b .L_4c
.L_40:
    mov r1, #0x4
    b .L_4c
.L_48:
    mov r1, #0x8
.L_4c:
    ldrh r0, [r0, #0xde]
    mov r2, r0, lsl #0x1f
    movs r2, r2, lsr #0x1f
    beq .L_8c
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_8c
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r0, [r3]
    and ip, r2, #0x1f00
    bic r2, r0, #0x1f00
    orr r0, r1, ip, lsr #0x8
    orr r0, r2, r0, lsl #0x8
    str r0, [r3]
    b .L_134
.L_8c:
    mov r3, #0x4000000
    ldr r0, [r3]
    ldr r2, [r3]
    and ip, r0, #0x1f00
    mvn r0, r1
    bic r1, r2, #0x1f00
    and r0, r0, ip, lsr #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r3]
    b .L_134
.L_b4:
    mov ip, #0x1
    b .L_d0
.L_bc:
    mov ip, #0x2
    b .L_d0
.L_c4:
    mov ip, #0x4
    b .L_d0
.L_cc:
    mov ip, #0x8
.L_d0:
    ldrh r0, [r0, #0xde]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_110
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_110
    ldr r2, _LIT0
    ldr r1, [r2]
    ldr r0, [r2]
    and r3, r1, #0x1f00
    bic r1, r0, #0x1f00
    orr r0, ip, r3, lsr #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_134
.L_110:
    ldr r3, _LIT0
    mvn r0, ip
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    bic r1, r1, #0x1f00
    and r0, r0, r2, lsr #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r3]
.L_134:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04001000
