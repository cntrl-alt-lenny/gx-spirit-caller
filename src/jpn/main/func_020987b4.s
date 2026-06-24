; func_020987b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b64
        .extern func_02000950
        .extern func_0209281c
        .extern func_02093b08
        .extern func_02094500
        .extern func_020988b4
        .extern func_02098be8
        .global func_020987b4
        .arm
func_020987b4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_02098be8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    cmp r0, #0x2
    bne .L_198
    ldrb r1, [r5, #0x1f]
    mov r0, #0x0
    ands r1, r1, #0x2
    beq .L_174
    ldr r1, _LIT1
    ldr r3, _LIT2
    ldr r2, _LIT3
    sub ip, r1, r3
    smull r1, lr, r2, ip
    mov lr, lr, asr #0x3
    mov r1, ip, lsr #0x1f
    ldr r2, [r5]
    add lr, r1, lr
    cmp r2, lr
    bcs .L_174
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r1, [r5, #0x4]
    mov r2, r4
    bl func_020988b4
.L_174:
    cmp r0, #0x0
    bne .L_198
    ldr r0, [r5, #0x4]
    mov r2, r4
    mov r1, #0x0
    bl func_02094500
    bl func_02093b08
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_198:
    ldrb r0, [r5, #0x1f]
    ands r0, r0, #0x1
    beq .L_1b0
    ldr r0, [r5, #0x4]
    add r0, r0, r4
    bl func_02000950
.L_1b0:
    ldr r0, [r5, #0x4]
    ldr r1, [r5, #0x8]
    bl func_0209281c
    ldr r6, [r5, #0x10]
    ldr r4, [r5, #0x14]
    cmp r6, r4
    ldmcsia sp!, {r4, r5, r6, lr}
    bxcs lr
.L_1d0:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_1e0
    blx r0
.L_1e0:
    add r6, r6, #0x4
    cmp r6, r4
    bcc .L_1d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x027ffc40
_LIT1: .word data_02102b64
_LIT2: .word data_02102b64
_LIT3: .word 0x66666667
