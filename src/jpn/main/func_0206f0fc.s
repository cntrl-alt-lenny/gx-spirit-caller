; func_0206f0fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206f0fc
        .arm
func_0206f0fc:
    str r0, [r1]
    mov ip, #0x0
    mov r2, #0xa
.L_2b0:
    ldrb r3, [r0]
    sub r3, r3, #0x30
    and r3, r3, #0xff
    cmp r3, #0x9
    mlals ip, r2, ip, r3
    addls r0, r0, #0x1
    strls r0, [r1]
    bls .L_2b0
    mov r0, ip
    bx lr
