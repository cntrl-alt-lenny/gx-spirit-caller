; func_02079750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020799dc
        .extern func_02079d38
        .extern func_02094500
        .global func_02079750
        .arm
func_02079750:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r1
    mov r8, r2
    mov sl, r0
    mov r0, r9
    mov r1, r8
    bl func_02079d38
    mov fp, r0
    mov r0, fp, lsl #0x1
    cmp r0, r8
    bge .L_8cc
    sub r1, r8, r0
    add r0, sl, r0, lsl #0x1
    mov r2, r1, lsl #0x1
    mov r1, #0x0
    bl func_02094500
.L_8cc:
    cmp fp, #0x0
    mov r1, #0x0
    ble .L_924
    mov r0, r1
    sub r4, r8, #0x1
.L_8e0:
    cmp r0, r8
    bge .L_924
    mov r2, r1, lsl #0x1
    ldrh r5, [r9, r2]
    mov r2, r0, lsl #0x1
    cmp r0, r4
    mul r3, r5, r5
    strh r3, [sl, r2]
    beq .L_924
    add r2, r0, #0x1
    add r1, r1, #0x1
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x1
    strh r3, [sl, r2]
    cmp r1, fp
    add r0, r0, #0x2
    blt .L_8e0
.L_924:
    cmp fp, #0x0
    mov r6, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
.L_938:
    add r7, r6, #0x1
    b .L_9a4
.L_940:
    mov r1, r7, lsl #0x1
    mov r0, r6, lsl #0x1
    ldrh r1, [r9, r1]
    ldrh r0, [r9, r0]
    mul r4, r1, r0
    ldr r0, _LIT0
    cmp r4, r0
    bhi .L_978
    mov r0, sl
    mov r2, r5
    mov r3, r8
    mov r1, r4, lsl #0x1
    bl func_020799dc
    b .L_9a0
.L_978:
    mov r0, sl
    mov r1, r4
    mov r2, r5
    mov r3, r8
    bl func_020799dc
    mov r0, sl
    mov r1, r4
    mov r2, r5
    mov r3, r8
    bl func_020799dc
.L_9a0:
    add r7, r7, #0x1
.L_9a4:
    cmp r7, fp
    bge .L_9b8
    add r5, r6, r7
    cmp r5, r8
    blt .L_940
.L_9b8:
    add r6, r6, #0x1
    cmp r6, fp
    blt .L_938
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x7fff8000
