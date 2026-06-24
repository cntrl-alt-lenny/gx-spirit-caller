; func_02070190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ede4
        .extern data_0219ee04
        .extern data_0219ee34
        .extern data_0219ee3c
        .extern func_02073650
        .extern func_020743b0
        .extern func_02091680
        .extern func_02092fc8
        .global func_02070190
        .arm
func_02070190:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    blx r0
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_02073650
    mov r0, #0x64
    bl func_02091680
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_02073650
    bl func_02092fc8
    mov r4, r0, lsr #0x10
    orr r4, r4, r1, lsl #0x10
    ldr r6, _LIT2
    mov r7, #0x64
    ldr r5, _LIT3
    b .L_620
.L_5f8:
    ldrb r0, [r6]
    cmp r0, #0x0
    beq .L_618
    mov r0, #0x4
    bl func_020743b0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_618:
    mov r0, r7
    bl func_02091680
.L_620:
    ldr r0, [r5]
    blx r0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r4
    cmp r0, #0x17
    blt .L_5f8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ee04
_LIT1: .word data_0219ee3c
_LIT2: .word data_0219ede4
_LIT3: .word data_0219ee34
