; func_0207113c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020711b0
        .extern func_02072a14
        .extern func_0207391c
        .extern func_0207397c
        .global func_0207113c
        .arm
func_0207113c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    add r4, sp, #0x0
.L_110:
    mov r0, r4
    bl func_0207397c
    ldr r3, [sp]
    cmp r3, #0x22
    bls .L_168
    ldrh r2, [r0, #0xc]
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x800
    beq .L_14c
    cmp r1, r5
    beq .L_15c
    b .L_168
.L_14c:
    add r0, r0, #0xe
    sub r1, r3, #0xe
    bl func_020711b0
    b .L_168
.L_15c:
    add r0, r0, #0xe
    sub r1, r3, #0xe
    bl func_02072a14
.L_168:
    bl func_0207391c
    b .L_110
_LIT0: .word 0x00000806
