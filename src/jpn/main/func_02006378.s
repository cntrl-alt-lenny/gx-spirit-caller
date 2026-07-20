; func_02006378 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02020fc4
        .extern data_021023bc
        .extern data_02103cc4
        .extern data_02103cc8
        .extern data_02103fcc
        .extern data_02186a1c
        .extern data_021a62f0
        .extern func_02001520
        .extern func_020057c0
        .extern func_02005ec4
        .extern func_020062b0
        .extern func_02006318
        .extern Task_InvokeLockedIrq
        .extern func_02006934
        .extern func_02007fd8
        .extern func_02008598
        .extern func_0200a978
        .extern func_02031864
        .extern func_020318d8
        .extern func_020318e8
        .extern func_020349f8
        .extern func_02084f6c
        .extern func_0208c758
        .extern func_0208c8ec
        .extern func_0208c91c
        .extern func_0208cba8
        .extern func_0208d0fc
        .extern func_02092874
        .extern func_02092b90
        .extern func_02092ba4
        .extern func_02093110
        .extern func_02093544
        .extern func_0209372c
        .extern func_02094398
        .extern func_02094410
        .extern func_02096134
        .extern func_020983b8
        .extern func_0209bbe8
        .extern func_0209bed4
        .global func_02006378
        .arm
func_02006378:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0xe70
    bl func_02094398
    bl func_02092874
    bl func_02093110
    bl func_02093544
    bl func_0208c758
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0]
    bl func_0208c91c
    bl func_02096134
    bl func_0209bbe8
    ldr r1, _LIT2
    ldrh r0, [r1]
    bic r0, r0, #0x8000
    strh r0, [r1]
    bl func_02005ec4
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r1, [r1, #0x4]
    str r1, [r0]
    bl func_020062b0
    mov r0, #0x2
    bl func_020983b8
    mov r0, #0x4
    bl func_02092b90
    mov r0, #0x4
    bl func_02092ba4
    bl func_0200a978
    bl func_02006934
    bl func_020349f8
    mov r1, #0x0
    ldr r0, _LIT5
    str r1, [r0]
    bl func_02031864
    ldr r0, _LIT6
    bl func_020318d8
    ldr r0, _LIT7
    bl func_020318e8
    ldr r0, _LIT8
    bl func_020057c0
    bl func_0209bed4
    ldrb r0, [r0, #0xf]
    cmp r0, #0x45
    beq .L_ec
    cmp r0, #0x4a
    beq .L_dc
    cmp r0, #0x50
    ldreq r0, _LIT4
    moveq r1, #0x2
    streq r1, [r0, #0x33c]
    b .L_f8
.L_dc:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x33c]
    b .L_f8
.L_ec:
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0x33c]
.L_f8:
    bl func_02007fd8
    ldr r3, _LIT2
    ldr r0, _LIT9
    ldrh r2, [r3]
    ldr r1, _LIT10
    and r0, r2, r0
    orr r2, r0, #0xe
    orr r2, r2, #0x200
    sub r0, r1, #0xf
    strh r2, [r3]
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    ldr r0, _LIT11
    bl func_02084f6c
    mov r0, #0x1
    bl func_0208c8ec
    bl func_0209372c
    bl func_02008598
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl .L_02020fc4
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_021023bc
_LIT2: .word 0x04000304
_LIT3: .word data_021a62f0
_LIT4: .word data_02103cc4
_LIT5: .word data_02186a1c
_LIT6: .word func_02006318
_LIT7: .word Task_InvokeLockedIrq
_LIT8: .word func_02001520
_LIT9: .word 0xfffffdf1
_LIT10: .word 0x0000020e
_LIT11: .word data_02103cc8
