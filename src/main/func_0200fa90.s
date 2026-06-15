; func_0200fa90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200fa90
        .arm
func_0200fa90:
    ldr r3, [r1]
    cmp r3, #0x0
    beq .L_d08
    ldr r2, [r0, #0xc]
    mov ip, r2, lsr #0xc
.L_cec:
    ldr r2, [r3, #0xc]
    cmp ip, r2, lsr #0xc
    bcc .L_d08
    mov r1, r3
    ldr r3, [r3]
    cmp r3, #0x0
    bne .L_cec
.L_d08:
    cmp r1, #0x0
    beq .L_d38
    cmp r0, r1
    beq .L_d28
    str r1, [r0, #0x4]
    ldr r2, [r1]
    str r2, [r0]
    str r0, [r1]
.L_d28:
    ldr r1, [r0]
    cmp r1, #0x0
    strne r0, [r1, #0x4]
    bx lr
.L_d38:
    mov r0, #0x0
    bx lr
