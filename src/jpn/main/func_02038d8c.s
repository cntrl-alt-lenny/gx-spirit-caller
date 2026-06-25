; func_02038d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219cf2c
        .global func_02038d8c
        .arm
func_02038d8c:
    ldr r3, _LIT0
    mov ip, #0x0
    mov r2, #0x1f
.L_c:
    ldr r1, [r3, #0x4]
    cmp r1, r0
    bne .L_2c
    ldrsb r1, [r3, #0x59]
    mov r0, r3
    add r1, r1, #0x1
    strb r1, [r3, #0x59]
    bx lr
.L_2c:
    cmp r1, #0x0
    moveq ip, r3
    sub r3, r3, #0x5c
    subs r2, r2, #0x1
    bpl .L_c
    cmp ip, #0x0
    beq .L_70
    mov r0, #0x1
    strb r0, [ip, #0x59]
    mov r1, #0x0
    str r1, [ip, #0x8]
    strb r1, [ip, #0x5a]
    str r1, [ip, #0x10]
    str r1, [ip, #0xc]
    mov r0, #0x8
    strb r0, [ip, #0x56]
    strh r1, [ip, #0x54]
.L_70:
    mov r0, ip
    bx lr
_LIT0: .word data_0219cf2c
