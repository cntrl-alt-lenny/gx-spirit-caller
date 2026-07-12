; func_ov000_021abf0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021abf0c
        .arm
func_ov000_021abf0c:
    ldr r1, [r0, #0xc]
    ldr ip, [r0, #0x8]
    mov r1, r1, lsl #0x18
    mov r2, #0x10000
    mov r3, ip, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, r3, lsr #0x10
    rsb r2, r2, #0x0
    and r3, ip, r2
    mov r1, r1, lsl #0x10
    orr r3, r3, r1, lsr #0x10
    str r3, [r0, #0x8]
    ldr r1, [r0, #0xc]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    rsb ip, r1, r3, lsr #0x10
    mov r1, r3, lsl #0x10
    cmp ip, r1, lsr #0x10
    bxcs lr
    ldr r3, [r0, #0x8]
    mov r1, ip, lsl #0x10
    and r2, r3, r2
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x8]
    bx lr
