; func_ov004_021d6298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b98
        .extern data_02104b9a
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern data_ov004_0220ef74
        .extern func_02007218
        .extern func_02094688
        .extern func_020aad04
        .global func_ov004_021d6298
        .arm
func_ov004_021d6298:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r1, #0x2
    ldr r1, _LIT0
    mov r2, #0x54
    ldr r4, _LIT1
    bl func_02094688
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldrb ip, [r2, #0xce4]
    ldr r1, _LIT4
    mov r0, r4
    strb ip, [r3, r5]
    ldr r2, [r2, #0xd18]
    str r2, [r1, #0xba8]
    ldr r0, [r0, #0x4c]
    ldr r1, _LIT5
    cmp r0, #0x1
    add r0, r4, #0x3d00
    ldreqh r3, [r0, #0x16]
    ldr r2, _LIT4
    ldrneh r3, [r0, #0x14]
    mov r0, #0x1a
    mla r0, r5, r0, r1
    add r1, r4, #0xe5
    add r1, r1, #0x3c00
    str r3, [r2, #0xba4]
    bl func_020aad04
    bl func_02007218
    add r1, r4, #0x3000
    str r0, [r1, #0xce0]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220ef74
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word data_ov004_0220e2a0
_LIT3: .word data_02104b98
_LIT4: .word data_02103fcc
_LIT5: .word data_02104b9a
