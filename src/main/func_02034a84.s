; func_02034a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .extern data_0219c408
        .global func_02034a84
        .arm
func_02034a84:
    stmdb sp!, {r3, lr}
    tst r0, #0x8000000
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT0
    cmp r0, r1
    bls .L_40
    ldr r1, _LIT1
    cmp r0, r1
    bcc .L_30
    ldr r1, _LIT2
    cmp r0, r1
    bls .L_38
.L_30:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_38:
    ldr r0, [r0, #0x34]
    ldmia sp!, {r3, pc}
.L_40:
    ldr r1, _LIT3
    mov r2, #0xc
    ldr lr, [r1, #0x34]
    ldrh r3, [r1, #0x14]
    mla ip, r0, r2, lr
    ldrb ip, [ip, #0x1]
    cmp r0, r3
    and ip, ip, #0xf
    bcs .L_8c
    ldrh r1, [r1, #0xa]
    cmp r0, r1
    bcc .L_8c
    orr r0, r0, #0x1000000
    mov r1, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mla r1, r3, r2, lr
    ldrb r1, [r1, #0x7]
    tst r1, #0x80
    orrne r0, r0, #0x2000000
.L_8c:
    orr r0, r0, #0x8000000
    orr r0, r0, ip, lsl #0x14
    ldmia sp!, {r3, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219b760
_LIT2: .word data_0219c408
_LIT3: .word data_0219b2e0
