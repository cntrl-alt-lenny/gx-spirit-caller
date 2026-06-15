; func_0203deac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203deac
        .arm
func_0203deac:
    ldrb r2, [r0, #0xd12]
    mov r3, #0x0
    mov ip, r3
    cmp r2, #0x0
    bls .L_3c
.L_14:
    add r1, r0, ip, lsl #0x2
    ldrb r1, [r1, #0x447]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x1f
    moveq r3, ip
    beq .L_3c
    add r1, ip, #0x1
    and ip, r1, #0xff
    cmp ip, r2
    bcc .L_14
.L_3c:
    mov r0, r3
    bx lr
