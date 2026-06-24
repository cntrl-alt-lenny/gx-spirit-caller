; func_020a671c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a671c
        .arm
func_020a671c:
    stmdb sp!, {r4, lr}
    cmp r3, #0x0
    ldrh r4, [r1]
    mov lr, #0x0
    bls .L_3c
.L_14:
    ldrb ip, [r2]
    add lr, lr, #0x1
    cmp lr, r3
    eor ip, r4, ip
    and ip, ip, #0xff
    mov ip, ip, lsl #0x1
    ldrh ip, [r0, ip]
    add r2, r2, #0x1
    eor r4, ip, r4, lsr #0x8
    bcc .L_14
.L_3c:
    strh r4, [r1]
    ldmia sp!, {r4, lr}
    bx lr
