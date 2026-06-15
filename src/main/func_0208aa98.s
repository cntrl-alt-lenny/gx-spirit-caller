; func_0208aa98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208aa98
        .arm
func_0208aa98:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r6, r2, lsr #0x1
    cmp r6, #0x18
    mov ip, #0x0
    bls .L_4b8
    mov r2, #0x8000
    ldr r8, _LIT0
    mov sl, ip
    rsb r9, r2, #0x0
.L_408:
    mov r5, sl
.L_40c:
    add r7, r5, ip
    mov lr, r7, lsl #0x1
    add fp, r3, r5, lsl #0x3
    ldrsh r4, [r0, lr]
    ldr r2, [fp, #0x18]
    ldrsh lr, [r1, lr]
    ldr fp, [fp, #0x1c]
    add r4, r4, r2
    mov r2, #0x8000
    add lr, lr, fp
    rsb fp, r2, #0x0
    mov r2, r4
    cmp r4, fp
    movlt r2, r9
    blt .L_450
    cmp r4, r8
    movgt r2, r8
.L_450:
    mov fp, #0x8000
    rsb fp, fp, #0x0
    cmp lr, fp
    mov fp, r7, lsl #0x1
    strh r2, [r0, fp]
    mov r2, lr
    movlt r2, r9
    blt .L_478
    cmp lr, r8
    movgt r2, r8
.L_478:
    mov r7, r7, lsl #0x1
    add fp, lr, #0x1
    add lr, r3, r5, lsl #0x3
    strh r2, [r1, r7]
    mov r7, fp, asr #0x2
    add r2, r4, #0x1
    add r5, r5, #0x1
    str r7, [lr, #0x18]
    mov r2, r2, asr #0x2
    str r2, [lr, #0x1c]
    cmp r5, #0x18
    blt .L_40c
    add ip, ip, #0x18
    add r2, ip, #0x18
    cmp r6, r2
    bhi .L_408
.L_4b8:
    subs sl, r6, ip
    mov r7, #0x0
    beq .L_548
    mov r4, #0x8000
    ldr r2, _LIT0
    rsb r4, r4, #0x0
.L_4d0:
    add r8, r7, ip
    mov r6, r8, lsl #0x1
    add r5, r3, r7, lsl #0x3
    ldrsh fp, [r0, r6]
    ldr r9, [r5, #0x18]
    mov lr, #0x8000
    ldrsh r6, [r1, r6]
    ldr r5, [r5, #0x1c]
    add r9, fp, r9
    rsb lr, lr, #0x0
    cmp r9, lr
    add r5, r6, r5
    movlt r9, r4
    blt .L_510
    cmp r9, r2
    movgt r9, r2
.L_510:
    mov r6, #0x8000
    mov fp, r8, lsl #0x1
    rsb r6, r6, #0x0
    cmp r5, r6
    strh r9, [r0, fp]
    movlt r5, r4
    blt .L_534
    cmp r5, r2
    movgt r5, r2
.L_534:
    mov r6, r8, lsl #0x1
    add r7, r7, #0x1
    strh r5, [r1, r6]
    cmp r7, sl
    bcc .L_4d0
.L_548:
    rsbs r8, sl, #0x18
    mov r7, #0x0
    beq .L_57c
    add r6, r3, sl, lsl #0x3
.L_558:
    add r5, r6, r7, lsl #0x3
    ldr r2, [r5, #0x18]
    add r4, r3, r7, lsl #0x3
    str r2, [r4, #0x18]
    ldr r2, [r5, #0x1c]
    add r7, r7, #0x1
    str r2, [r4, #0x1c]
    cmp r7, r8
    bcc .L_558
.L_57c:
    cmp sl, #0x0
    addls sp, sp, #0x4
    mov r2, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_58c:
    add r4, r2, ip
    mov r6, r4, lsl #0x1
    ldrsh r4, [r1, r6]
    add r5, r2, #0x18
    sub r5, r5, sl
    add r4, r4, #0x1
    mov r4, r4, asr #0x2
    add r5, r3, r5, lsl #0x3
    str r4, [r5, #0x18]
    ldrsh r4, [r0, r6]
    add r2, r2, #0x1
    cmp r2, sl
    add r4, r4, #0x1
    mov r4, r4, asr #0x2
    str r4, [r5, #0x1c]
    bcc .L_58c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00007fff
