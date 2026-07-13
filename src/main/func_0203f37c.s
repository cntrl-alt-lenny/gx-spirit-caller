; func_0203f37c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bece4
        .extern data_020fe4e0
        .extern data_020fe4e4
        .extern func_02094688
        .global func_0203f37c
        .arm
func_0203f37c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r1
    mov r1, #0x0
    ldr lr, _LIT0
    ldr ip, _LIT1
.L_18:
    smull r2, r3, lr, r1
    add r3, r1, r3
    mov r3, r3, asr #0x2
    mov r2, r1, lsr #0x1f
    add r3, r2, r3
    smull r2, r3, ip, r3
    sub r3, r1, r2
    add r2, r3, #0xd
    ldrb r3, [r0, r1]
    ldrb r2, [r0, r2]
    eor r2, r3, r2
    strb r2, [r4, r1]
    add r1, r1, #0x1
    cmp r1, #0xd
    blt .L_18
    mov ip, #0x0
.L_58:
    add r3, ip, #0x3
    add r1, ip, #0xd
    ldrb r2, [r4, r3]
    ldrb r1, [r0, r1]
    add ip, ip, #0x1
    cmp ip, #0x7
    eor r1, r2, r1
    strb r1, [r4, r3]
    blt .L_58
    ldr r0, _LIT2
    mov r3, #0x0
.L_84:
    ldr r1, [r0]
    ldrb r2, [r4, r3]
    ldrsb r1, [r1, r3]
    eor r1, r2, r1
    strb r1, [r4, r3]
    add r3, r3, #0x1
    cmp r3, #0xd
    blt .L_84
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0xd
    bl func_02094688
    ldr r3, _LIT3
    add ip, sp, #0x0
    mov r2, #0x0
.L_c0:
    ldrb r1, [ip]
    ldrb r0, [r3]
    add r2, r2, #0x1
    cmp r2, #0xd
    strb r1, [r4, r0]
    add ip, ip, #0x1
    add r3, r3, #0x1
    blt .L_c0
    ldr r0, _LIT4
    mov r3, #0x0
.L_e8:
    ldr r1, [r0]
    ldrb r2, [r4, r3]
    ldrsb r1, [r1, r3]
    eor r1, r2, r1
    strb r1, [r4, r3]
    add r3, r3, #0x1
    cmp r3, #0xd
    blt .L_e8
    ldr r2, _LIT5
    mov ip, #0x0
.L_110:
    ldrb r3, [r4, ip]
    mov r0, r3, asr #0x4
    and r1, r0, #0xf
    and r0, r3, #0xf
    ldrb r1, [r2, r1]
    ldrb r0, [r2, r0]
    orr r0, r0, r1, lsl #0x4
    strb r0, [r4, ip]
    add ip, ip, #0x1
    cmp ip, #0xd
    blt .L_110
    mov r0, #0x0
.L_140:
    add lr, r0, #0x6
    ldrb r2, [r4, r0]
    ldrb r1, [r4, lr]
    add ip, r0, #0x9
    add r3, r0, #0x3
    eor r1, r2, r1
    strb r1, [r4, r0]
    ldrb r2, [r4, r3]
    ldrb r1, [r4, ip]
    eor r1, r2, r1
    strb r1, [r4, r3]
    ldrb r2, [r4, lr]
    ldrb r1, [r4, r3]
    eor r1, r2, r1
    strb r1, [r4, lr]
    ldrb r2, [r4, ip]
    ldrb r1, [r4, r0]
    eor r1, r2, r1
    strb r1, [r4, ip]
    ldrb r1, [r4, r0]
    ldrb r2, [r4, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x3
    eor r1, r2, r1
    strb r1, [r4, #0xc]
    blt .L_140
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word 0x92492493
_LIT1: .word 0x00000007
_LIT2: .word data_020fe4e0
_LIT3: .word data_020bece4
_LIT4: .word data_020fe4e4
_LIT5: .word data_020bece4+0x10
