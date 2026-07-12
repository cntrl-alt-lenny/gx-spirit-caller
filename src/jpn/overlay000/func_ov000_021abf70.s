; func_ov000_021abf70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021abf70
        .arm
func_ov000_021abf70:
    ldr r3, [r0, #0x8]
    ldr r2, [r0, #0xc]
    mov r1, r3, lsl #0x10
    mov ip, r2, lsl #0x18
    mov r2, r1, lsr #0x10
    mov r1, #0x10000
    cmp r2, ip, lsr #0x18
    rsbls r1, r1, #0x0
    andls r1, r3, r1
    strls r1, [r0, #0x8]
    bxls lr
    rsb r1, r1, #0x0
    sub r2, r2, ip, lsr #0x18
    and r3, r3, r1
    mov r1, r2, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    str r1, [r0, #0x8]
    bx lr
