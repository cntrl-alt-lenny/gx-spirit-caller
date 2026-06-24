; func_020a67ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a67ac
        .arm
func_020a67ac:
    stmdb sp!, {r4, lr}
    cmp r3, #0x0
    ldrb r4, [r1]
    mov lr, #0x0
    bls .L_14c
.L_12c:
    ldrb ip, [r2]
    add lr, lr, #0x1
    cmp lr, r3
    eor ip, r4, ip
    and ip, ip, #0xff
    add r2, r2, #0x1
    ldrb r4, [r0, ip]
    bcc .L_12c
.L_14c:
    strb r4, [r1]
    ldmia sp!, {r4, lr}
    bx lr
