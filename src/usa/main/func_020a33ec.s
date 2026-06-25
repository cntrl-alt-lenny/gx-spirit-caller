; func_020a33ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094398
        .extern func_020943b0
        .extern func_02094410
        .extern func_020a328c
        .extern func_020a3338
        .global func_020a33ec
        .arm
func_020a33ec:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x4c0
    bl func_02094398
    mov r0, #0x0
    strb r0, [r6, #0x4b2]
    ldr r0, [r5, #0xc]
    mov r1, r6
    mov r2, #0x1
    bl func_020a3338
    cmp r0, #0x0
    moveq r7, #0x1
    ldr r0, [r5, #0x10]
    mov r1, r6
    mov r2, #0x0
    movne r7, #0x0
    bl func_020a3338
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    orrs r0, r7, r0
    beq .L_84
    mov r3, #0x1
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x220
    strb r3, [r6, #0x4b2]
    bl func_02094410
.L_84:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    str r0, [r6, #0x4b8]
    beq .L_a4
    mov r0, r4
    add r1, r6, #0x220
    mov r2, #0x16
    bl func_020943b0
.L_a4:
    ldrb r0, [r5, #0x18]
    strb r0, [r6, #0x236]
    ldr r0, [r5, #0x4]
    bl func_020a328c
    mov r2, r0, lsl #0x11
    ldr r0, [r5, #0x4]
    add r1, r6, #0x238
    mov r2, r2, lsr #0x10
    bl func_020943b0
    ldr r0, [r5, #0x8]
    add r1, r6, #0x298
    mov r2, #0xc0
    bl func_020943b0
    mov r1, #0x1
    strb r1, [r6, #0x358]
    add r0, r6, #0x300
    strh r1, [r0, #0x5a]
    add r0, r6, #0x400
    strh r1, [r0, #0xb0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
