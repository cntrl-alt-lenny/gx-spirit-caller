; func_ov004_021cc000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_021058a9
        .extern data_0210596d
        .extern data_02105a90
        .extern data_ov004_0220b2a0
        .extern func_0201ccc8
        .extern func_02052dbc
        .extern func_020943b0
        .extern func_02094688
        .extern func_020aad04
        .extern func_020aadcc
        .global func_ov004_021cc000
        .arm
func_ov004_021cc000:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xdc
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x44]
    cmp r0, #0x0
    beq .L_74
    ldr r1, _LIT1
    add r0, sp, #0x0
    mov r2, #0x10
    bl func_020aadcc
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldrb r2, [r0, #0xa3c]
    ldrh ip, [r1, #0x52]
    add r0, sp, #0x0
    mov r1, r2, lsl #0x1d
    mov r3, r1, lsr #0x1d
    add r1, sp, #0x1a
    mov r2, #0x14
    strh r4, [sp, #0x14]
    strh ip, [sp, #0x16]
    strh r3, [sp, #0x18]
    bl func_020943b0
    add r1, sp, #0x14
    mov r0, #0x2
    mov r2, #0x1a
    bl func_0201ccc8
    b .L_118
.L_74:
    ldr r0, _LIT4
    add r1, sp, #0x30
    strh r4, [sp, #0x84]
    bl func_02052dbc
    ldr r1, _LIT3
    ldr r0, _LIT2
    ldrh r4, [r1, #0x52]
    ldrb r2, [r0, #0xa3c]
    ldrh r3, [r1, #0x58]
    add r0, sp, #0x41
    mov r1, r2, lsl #0x1d
    mov r2, r1, lsr #0x1d
    ldr r1, _LIT1
    strh r4, [sp, #0x70]
    strh r3, [sp, #0x72]
    strb r2, [sp, #0x40]
    bl func_020aad04
    ldr r1, _LIT2
    add r0, sp, #0x57
    ldrb r2, [r1, #0xb00]
    ldr r1, _LIT5
    strb r2, [sp, #0x56]
    bl func_020aad04
    mov r4, #0x0
    ldr r0, _LIT2
    mov r3, #0x1
    ldr r0, [r0, #0xa64]
    add r1, sp, #0x86
    str r0, [sp, #0x74]
    add r0, sp, #0x30
    mov r2, #0x54
    strb r4, [sp, #0x81]
    strb r4, [sp, #0x80]
    str r3, [sp, #0x78]
    strb r4, [sp, #0x82]
    str r4, [sp, #0x7c]
    bl func_02094688
    add r1, sp, #0x84
    mov r0, #0x2
    mov r2, #0x56
    bl func_0201ccc8
.L_118:
    mov r0, #0x1
    add sp, sp, #0xdc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_021058a9
_LIT2: .word data_02104e6c
_LIT3: .word data_0210586c
_LIT4: .word data_02105a90
_LIT5: .word data_0210596d
