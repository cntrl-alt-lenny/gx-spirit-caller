; func_020366b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .global func_020366b0
        .arm
func_020366b0:
    ldr r3, _LIT0
    mov r2, #0x78
    mla r2, r1, r2, r3
    ldrsb r1, [r2, #0x6a]
    cmp r1, #0x0
    movlt r0, #0x1
    bxlt lr
    ldr r1, [r2, #0x34]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, #0xc
    mov r2, r1, lsr #0x10
    mul ip, r3, r0
    ldr r1, _LIT1
    mul r0, r2, r0
    ldr r3, [r1, #0x34]
    ldrb r1, [r3, ip]
    ldrb r0, [r3, r0]
    and r1, r1, #0x7f
    and r0, r0, #0x7f
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
_LIT0: .word data_0219b760
_LIT1: .word data_0219b2e0
