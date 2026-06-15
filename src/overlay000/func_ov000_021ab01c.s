; func_ov000_021ab01c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ab01c
        .arm
func_ov000_021ab01c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r7, _LIT0
    mov r8, r3
    smull r6, r3, r7, r8
    add r3, r8, r3
    mov r6, r8, lsr #0x1f
    add r3, r6, r3, asr #0x14
    mov r7, #0x168000
    smull r3, r6, r7, r3
    ldr r5, [sp, #0x20]
    ldr r4, [sp, #0x24]
    cmp r5, #0x0
    movlt r5, #0x0
    cmp r5, #0x1000
    movgt r5, #0x1000
    cmp r4, #0x0
    movlt r4, #0x0
    cmp r4, #0x1000
    movgt r4, #0x1000
    subs r3, r8, r3
    ldr r7, _LIT1
    addmi r3, r3, #0x168000
    smull r6, lr, r7, r3
    rsb r8, r5, #0x1000
    smull r7, r6, r4, r8
    adds ip, r7, #0x800
    add lr, r3, lr
    mov r3, r3, lsr #0x1f
    ldr r7, _LIT2
    add lr, r3, lr, asr #0x5
    and r7, lr, r7
    rsb r3, r7, #0x1000
    smull r8, r7, r5, r7
    adc r9, r6, #0x0
    adds r8, r8, #0x800
    adc r6, r7, #0x0
    mov r7, r8, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    rsb r6, r7, #0x1000
    smull r8, r7, r4, r6
    smull r6, r3, r5, r3
    mov r5, ip, lsr #0xc
    orr r5, r5, r9, lsl #0x14
    mov r9, r5, lsl #0x8
    adds r8, r8, #0x800
    adc r5, r7, #0x0
    adds r6, r6, #0x800
    mov r7, r8, lsr #0xc
    orr r7, r7, r5, lsl #0x14
    adc r3, r3, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    rsb r3, r6, #0x1000
    smull r6, r3, r4, r3
    adds r6, r6, #0x800
    adc r3, r3, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    ldr r3, _LIT3
    mov r5, r7, lsl #0x8
    and r3, lr, r3
    mov r3, r3, asr #0xc
    rsb r4, r4, r4, lsl #0x8
    mov r6, r6, lsl #0x8
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    b .L_25c
    b .L_26c
    b .L_27c
    b .L_28c
    b .L_29c
    b .L_2ac
.L_25c:
    str r4, [r0]
    str r6, [r1]
    str r9, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_26c:
    str r5, [r0]
    str r4, [r1]
    str r9, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_27c:
    str r9, [r0]
    str r4, [r1]
    str r6, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_28c:
    str r9, [r0]
    str r5, [r1]
    str r4, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_29c:
    str r6, [r0]
    str r9, [r1]
    str r4, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2ac:
    str r4, [r0]
    str r9, [r1]
    str r5, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0xb60b60b7
_LIT1: .word 0x88888889
_LIT2: .word 0x00000fff
_LIT3: .word 0x7ffff000
