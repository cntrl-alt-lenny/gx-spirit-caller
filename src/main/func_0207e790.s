; func_0207e790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e790
        .arm
func_0207e790:
    ldr r1, [r0, #0x4]
    mov ip, #0x0
    add r1, r1, r0
    str r1, [r0, #0x4]
    ldrh r1, [r0]
    cmp r1, #0x0
    bxls lr
.L_64:
    ldr r3, [r0, #0x4]
    add r1, ip, #0x1
    ldr r2, [r3, ip, lsl #0x2]
    mov r1, r1, lsl #0x10
    add r2, r0, r2
    str r2, [r3, ip, lsl #0x2]
    ldrh r2, [r0]
    mov ip, r1, lsr #0x10
    cmp ip, r2
    bcc .L_64
    bx lr
