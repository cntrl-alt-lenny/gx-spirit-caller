; func_ov000_021ae510 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov000_021b56b4
        .extern data_ov000_021c758c
        .extern data_ov000_021c75c4
        .extern func_ov000_021ad49c
        .global func_ov000_021ae510
        .arm
func_ov000_021ae510:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r2, [r1, #0x2a4]
    mov r1, #0x28
    mov r3, r2, lsl #0x9
    mov r3, r3, lsr #0x1e
    mla r1, r3, r1, r4
    mov r2, r2, lsl #0xb
    add r1, r1, #0x8
    movs r2, r2, lsr #0x18
    ldr r3, _LIT2
    beq .L_100
    ldr r5, [r3, #0x26c]
    mov r2, r5, lsl #0xb
    mov r4, r2, lsr #0x18
    ldr r2, _LIT3
    cmp r4, #0x10
    andcc r2, r5, r2
    bcc .L_64
    sub r4, r4, #0x10
    and r5, r5, r2
    mov r2, r4, lsl #0x18
    orr r2, r5, r2, lsr #0xb
.L_64:
    str r2, [r3, #0x26c]
    ldr r2, [r3, #0x26c]
    sub r4, r0, #0x1
    mov r0, r2, lsl #0xb
    mov r0, r0, lsr #0x18
    rsb r5, r0, #0xff
    ldr r2, _LIT4
    mov r6, r5, lsl #0xe
    smull r0, r7, r2, r6
    add ip, r1, r4, lsl #0x3
    mov lr, r4, lsl #0x3
    ldrsh r2, [ip, #0x2]
    ldrsh ip, [r1, lr]
    add r7, r7, r5, lsl #0xe
    mov r0, r6, lsr #0x1f
    add r7, r0, r7, asr #0x7
    mov r0, r7, asr #0x4
    mov r5, r0, lsl #0x2
    ldr r4, _LIT5
    ldr r0, [r3, #0x144]
    ldrsh r1, [r4, r5]
    rsb ip, r0, ip, lsl #0xc
    ldr lr, [r3, #0x148]
    smull ip, r4, r1, ip
    adds r5, ip, #0x800
    sub r2, r2, #0x1
    rsb r2, lr, r2, lsl #0xc
    smull ip, r2, r1, r2
    adc r4, r4, #0x0
    mov r5, r5, lsr #0xc
    adds r1, ip, #0x800
    orr r5, r5, r4, lsl #0x14
    add r4, r0, r5
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, lr, r1
    str r4, [r3, #0x14c]
    str r0, [r3, #0x150]
.L_100:
    mov r2, #0x1
    add r0, r3, #0x14c
    stmia sp, {r0, r2}
    ldr r0, [r3, #0x26c]
    sub r1, r2, #0x2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x1f
    mov r3, #0x10
    bl func_ov000_021ad49c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021b56b4
_LIT2: .word data_ov000_021c75c4
_LIT3: .word 0xffe01fff
_LIT4: .word 0x80808081
_LIT5: .word data_020bef80
