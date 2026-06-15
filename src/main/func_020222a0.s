; func_020222a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern func_02022234
        .extern func_02022260
        .extern func_020224c0
        .extern func_0202250c
        .extern func_020b3870
        .global func_020222a0
        .arm
func_020222a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r1, #0x1
    mov r6, r0
    mov r5, r2
    mov r4, r3
    bl func_020224c0
    cmp r7, #0xc
    addls pc, pc, r7, lsl #0x2
    b .L_150
    b .L_5c
    b .L_64
    b .L_6c
    b .L_74
    b .L_84
    b .L_94
    b .L_9c
    b .L_a4
    b .L_ac
    b .L_c0
    b .L_cc
    b .L_108
    b .L_130
.L_5c:
    add r4, r0, r4
    b .L_158
.L_64:
    sub r4, r0, r4
    b .L_158
.L_6c:
    mul r4, r0, r4
    b .L_158
.L_74:
    mov r1, r4
    bl func_020b3870
    mov r4, r0
    b .L_158
.L_84:
    mov r1, r4
    bl func_020b3870
    mov r4, r1
    b .L_158
.L_94:
    and r4, r0, r4
    b .L_158
.L_9c:
    orr r4, r0, r4
    b .L_158
.L_a4:
    eor r4, r0, r4
    b .L_158
.L_ac:
    bl func_0202250c
    mov r1, r4
    bl func_020b3870
    mov r4, r1
    b .L_158
.L_c0:
    cmp r4, #0x0
    rsblt r4, r4, #0x0
    b .L_158
.L_cc:
    cmp r4, #0x0
    rsblt r4, r4, #0x0
    mov r3, #0x1
    cmp r4, #0xa
    blt .L_100
    ldr r1, _LIT0
.L_e4:
    mov r2, r4
    smull r0, r4, r1, r2
    mov r0, r2, lsr #0x1f
    add r4, r0, r4, asr #0x2
    cmp r4, #0xa
    add r3, r3, #0x1
    bge .L_e4
.L_100:
    mov r4, r3
    b .L_158
.L_108:
    mov r0, r4, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    mov r4, r0, asr #0x4
    b .L_158
.L_130:
    mov r0, r4, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, _LIT1
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r4, r0, asr #0x4
    b .L_158
.L_150:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_158:
    cmp r5, #0x20
    blt .L_174
    mov r0, r6
    mov r2, r4
    sub r1, r5, #0x20
    bl func_02022260
    b .L_180
.L_174:
    mov r0, r5
    mov r1, r4
    bl func_02022234
.L_180:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_020bef80
