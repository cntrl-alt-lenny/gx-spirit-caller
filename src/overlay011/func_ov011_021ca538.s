; func_ov011_021ca538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d2fbe
        .extern data_ov011_021d4000
        .extern func_0201e818
        .extern func_0208e334
        .global func_ov011_021ca538
        .arm
func_ov011_021ca538:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x24
    ldr ip, _LIT0
    add r4, sp, #0x18
    mov r3, #0x5
.L_14:
    ldrb r2, [ip]
    ldrb r1, [ip, #0x1]
    add ip, ip, #0x2
    strb r2, [r4]
    strb r1, [r4, #0x1]
    add r4, r4, #0x2
    subs r3, r3, #0x1
    bne .L_14
    smull r2, r1, r0, r0
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r0, r2
    mov r0, #0xa
    mul r2, r1, r0
    ldr r0, _LIT1
    add r3, sp, #0x8
    ldr r1, [r0, #0x2bc]
    add r0, r2, #0x1000
    mov r1, r1, lsl #0x18
    mov r4, r1, lsr #0x18
    mov r1, r0
    mov r2, #0x0
    sub r4, r4, #0x1
    bl func_0201e818
    ldr r0, _LIT1
    add r2, sp, #0x18
    ldr r3, [r0, #0x238]
    add r1, sp, #0x19
    mov r3, r3, asr #0xc
    str r3, [sp]
    ldr r3, [r0, #0x23c]
    ldr r0, _LIT2
    mov r3, r3, asr #0xc
    str r3, [sp, #0x4]
    ldrb r3, [r1, r4, lsl #0x1]
    ldrb r2, [r2, r4, lsl #0x1]
    add r1, sp, #0x8
    bl func_0208e334
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov011_021d2fbe
_LIT1: .word data_ov011_021d4000
_LIT2: .word 0x04000030
