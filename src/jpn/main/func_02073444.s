; func_02073444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee3c
        .extern data_0219eeb0
        .extern data_0219eeba
        .extern func_02073d6c
        .extern func_02073df0
        .extern func_02092fc8
        .extern func_02094688
        .global func_02073444
        .arm
func_02073444:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r6, r1
    cmp r6, r3
    mov r7, r0
    mov r4, r2
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r6, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r6
    bl func_02073df0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r6
    bl func_02073d6c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    ldr r1, _LIT2
    mov r5, r0, lsr #0x10
    mov r2, #0x0
.L_8c:
    ldr r0, [r1]
    cmp r6, r0
    bne .L_cc
    mov r0, #0xc
    mul r4, r2, r0
    ldr r0, _LIT2
    ldr r3, _LIT3
    add r1, r0, r4
    mov r0, r7
    add r1, r1, #0x4
    mov r2, #0x6
    strh r5, [r3, r4]
    bl func_02094688
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_cc:
    add r2, r2, #0x1
    cmp r2, #0x8
    add r1, r1, #0xc
    bcc .L_8c
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov ip, #0x0
    ldr r4, _LIT2
    mov r0, ip
    mov r3, ip
.L_fc:
    ldr r1, [r4]
    cmp r1, #0x0
    moveq r0, r3
    beq .L_138
    ldrh r1, [r4, #0xa]
    add r4, r4, #0xc
    sub r1, r5, r1
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    cmp r2, ip
    movgt r0, r3
    add r3, r3, #0x1
    movgt ip, r1, lsr #0x10
    cmp r3, #0x8
    bcc .L_fc
.L_138:
    mov r1, #0xc
    mul r4, r0, r1
    ldr r3, _LIT2
    mov r0, r7
    add r1, r3, r4
    add r1, r1, #0x4
    mov r2, #0x6
    str r6, [r3, r4]
    bl func_02094688
    ldr r0, _LIT3
    strh r5, [r0, r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x7f000001
_LIT1: .word data_0219ee3c
_LIT2: .word data_0219eeb0
_LIT3: .word data_0219eeba
