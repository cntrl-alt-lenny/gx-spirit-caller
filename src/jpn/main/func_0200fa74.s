; func_0200fa74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200fa74
        .arm
func_0200fa74:
    ldr r3, [r1]
    cmp r3, #0x0
    beq .L_a7c
    ldr r2, [r0, #0xc]
    mov ip, r2, lsr #0xc
.L_a60:
    ldr r2, [r3, #0xc]
    cmp ip, r2, lsr #0xc
    bcc .L_a7c
    mov r1, r3
    ldr r3, [r3]
    cmp r3, #0x0
    bne .L_a60
.L_a7c:
    cmp r1, #0x0
    beq .L_aac
    cmp r0, r1
    beq .L_a9c
    str r1, [r0, #0x4]
    ldr r2, [r1]
    str r2, [r0]
    str r0, [r1]
.L_a9c:
    ldr r1, [r0]
    cmp r1, #0x0
    strne r0, [r1, #0x4]
    bx lr
.L_aac:
    mov r0, #0x0
    bx lr
