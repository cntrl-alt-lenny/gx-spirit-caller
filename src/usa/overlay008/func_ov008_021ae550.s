; func_ov008_021ae550 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2ca8
        .extern func_ov008_021abbfc
        .extern func_ov008_021abfd8
        .extern func_ov008_021ae27c
        .global func_ov008_021ae550
        .arm
func_ov008_021ae550:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0x8]
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov008_021ae27c
    ldr r1, _LIT0
    ldrh ip, [r1, #0x8]
    cmp ip, #0x0
    beq .L_c24
    mov r0, ip, lsl #0x18
    mov r2, r0, asr #0x18
    ldr r3, [r1, #0x14]
    ldr r0, _LIT1
    cmp r2, #0x0
    str r3, [r0, #0x634]
    subgt r0, ip, #0x1
    strgth r0, [r1, #0x8]
    bgt .L_c24
    cmp r2, #0x0
    addlt r0, ip, #0x1
    strlth r0, [r1, #0x8]
.L_c24:
    ldr r0, _LIT0
    ldrh r1, [r0, #0x6]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x2
    bls .L_c54
    ldrh r0, [r0, #0x4]
    sub r1, r1, #0x2
    mov r2, #0x1
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_ov008_021abfd8
.L_c54:
    bl func_ov008_021abbfc
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word data_ov008_021b2660
