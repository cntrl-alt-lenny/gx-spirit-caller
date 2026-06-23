; func_0200b340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200b340
        .arm
func_0200b340:
    cmp r2, #0x0
    mov ip, #0x0
    bls .L_12c
.L_118:
    ldr r3, [r1, ip, lsl #0x2]
    strb r3, [r0, ip]
    add ip, ip, #0x1
    cmp ip, r2
    bcc .L_118
.L_12c:
    mov r0, #0x1
    bx lr
