; func_02092154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02092154
        .arm
func_02092154:
    ldr r2, [r0]
    mov ip, r2
    cmp r2, #0x0
    beq .L_4c
.L_10:
    cmp ip, r1
    ldr r3, [ip, #0x80]
    bne .L_40
    cmp r2, ip
    ldr r2, [ip, #0x7c]
    streq r3, [r0]
    strne r3, [r2, #0x80]
    ldr r1, [r0, #0x4]
    cmp r1, ip
    streq r2, [r0, #0x4]
    strne r2, [r3, #0x7c]
    b .L_4c
.L_40:
    mov ip, r3
    cmp r3, #0x0
    bne .L_10
.L_4c:
    mov r0, ip
    bx lr
