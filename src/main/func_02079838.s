; func_02079838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079ac4
        .extern func_02079e20
        .extern func_020945f4
        .global func_02079838
        .arm
func_02079838:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r1
    mov r8, r2
    mov sl, r0
    mov r0, r9
    mov r1, r8
    bl func_02079e20
    mov fp, r0
    mov r0, fp, lsl #0x1
    cmp r0, r8
    bge .L_974
    sub r1, r8, r0
    add r0, sl, r0, lsl #0x1
    mov r2, r1, lsl #0x1
    mov r1, #0x0
    bl func_020945f4
.L_974:
    cmp fp, #0x0
    mov r1, #0x0
    ble .L_9cc
    mov r0, r1
    sub r4, r8, #0x1
.L_988:
    cmp r0, r8
    bge .L_9cc
    mov r2, r1, lsl #0x1
    ldrh r5, [r9, r2]
    mov r2, r0, lsl #0x1
    cmp r0, r4
    mul r3, r5, r5
    strh r3, [sl, r2]
    beq .L_9cc
    add r2, r0, #0x1
    add r1, r1, #0x1
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x1
    strh r3, [sl, r2]
    cmp r1, fp
    add r0, r0, #0x2
    blt .L_988
.L_9cc:
    cmp fp, #0x0
    mov r6, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
.L_9e0:
    add r7, r6, #0x1
    b .L_a4c
.L_9e8:
    mov r1, r7, lsl #0x1
    mov r0, r6, lsl #0x1
    ldrh r1, [r9, r1]
    ldrh r0, [r9, r0]
    mul r4, r1, r0
    ldr r0, _LIT0
    cmp r4, r0
    bhi .L_a20
    mov r0, sl
    mov r2, r5
    mov r3, r8
    mov r1, r4, lsl #0x1
    bl func_02079ac4
    b .L_a48
.L_a20:
    mov r0, sl
    mov r1, r4
    mov r2, r5
    mov r3, r8
    bl func_02079ac4
    mov r0, sl
    mov r1, r4
    mov r2, r5
    mov r3, r8
    bl func_02079ac4
.L_a48:
    add r7, r7, #0x1
.L_a4c:
    cmp r7, fp
    bge .L_a60
    add r5, r6, r7
    cmp r5, r8
    blt .L_9e8
.L_a60:
    add r6, r6, #0x1
    cmp r6, fp
    blt .L_9e0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x7fff8000
