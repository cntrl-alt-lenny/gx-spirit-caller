; func_02010a7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cae8
        .extern data_0218fbe8
        .global func_02010a7c
        .arm
func_02010a7c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrh r6, [r1, #0x40]
    ldrh r1, [r1, #0x42]
    cmp r6, r1
    beq .L_cfc
    mov lr, #0x0
    add r4, r2, #0x1940
    add r1, r2, #0x3100
    mov ip, lr
    mov r3, #0x18
.L_ccc:
    mla r5, r6, r3, r4
    ldr r2, [r5, #0x8]
    cmp r2, r0
    add r2, r6, #0x1
    mov r2, r2, lsl #0x10
    streq lr, [r5, #0x8]
    mov r6, r2, lsr #0x10
    cmp r6, #0x100
    ldrh r2, [r1, #0x42]
    movcs r6, ip
    cmp r6, r2
    bne .L_ccc
.L_cfc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0218fbe8
_LIT1: .word data_0218cae8
