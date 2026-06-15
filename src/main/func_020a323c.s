; func_020a323c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9850
        .extern func_020a2cf8
        .extern func_020a2f9c
        .extern func_020a2fcc
        .extern func_020a3144
        .extern func_020a3190
        .global func_020a323c
        .arm
func_020a323c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    ldr r4, _LIT0
.L_13ec:
    ldrb r0, [r4, #0xc]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_13ec
    b .L_1418
    b .L_1418
    b .L_1430
    b .L_1438
    b .L_1454
    b .L_145c
    b .L_13ec
.L_1418:
    bl func_020a3190
    cmp r0, #0x0
    bne .L_13ec
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1430:
    bl func_020a3144
    b .L_13ec
.L_1438:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020a2fcc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1454:
    bl func_020a2f9c
    b .L_13ec
.L_145c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020a2cf8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a9850
