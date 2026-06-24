; func_020b0308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b0308
        .arm
func_020b0308:
    add r3, r0, #0x5
    add r1, r3, r1
    sub ip, r1, #0x1
    mov r1, #0x0
.L_7c:
    ldrb r2, [ip]
    cmp r2, #0x9
    addcc r0, r2, #0x1
    strccb r0, [ip]
    bxcc lr
    cmp ip, r3
    bne .L_b0
    mov r1, #0x1
    strb r1, [ip]
    ldrsh r1, [r0, #0x2]
    add r1, r1, #0x1
    strh r1, [r0, #0x2]
    bx lr
.L_b0:
    strb r1, [ip], #-1
    b .L_7c
