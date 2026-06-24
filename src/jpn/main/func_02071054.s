; func_02071054 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020710c8
        .extern func_0207292c
        .extern func_02073834
        .extern func_02073894
        .global func_02071054
        .arm
func_02071054:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    add r4, sp, #0x0
.L_c0:
    mov r0, r4
    bl func_02073894
    ldr r3, [sp]
    cmp r3, #0x22
    bls .L_118
    ldrh r2, [r0, #0xc]
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x800
    beq .L_fc
    cmp r1, r5
    beq .L_10c
    b .L_118
.L_fc:
    add r0, r0, #0xe
    sub r1, r3, #0xe
    bl func_020710c8
    b .L_118
.L_10c:
    add r0, r0, #0xe
    sub r1, r3, #0xe
    bl func_0207292c
.L_118:
    bl func_02073834
    b .L_c0
_LIT0: .word 0x00000806
