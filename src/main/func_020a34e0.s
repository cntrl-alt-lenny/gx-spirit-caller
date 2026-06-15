; func_020a34e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209448c
        .extern func_020944a4
        .extern func_02094504
        .extern func_020a3380
        .extern func_020a342c
        .global func_020a34e0
        .arm
func_020a34e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x4c0
    bl func_0209448c
    mov r0, #0x0
    strb r0, [r6, #0x4b2]
    ldr r0, [r5, #0xc]
    mov r1, r6
    mov r2, #0x1
    bl func_020a342c
    cmp r0, #0x0
    moveq r7, #0x1
    ldr r0, [r5, #0x10]
    mov r1, r6
    mov r2, #0x0
    movne r7, #0x0
    bl func_020a342c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    orrs r0, r7, r0
    beq .L_1bc
    mov r3, #0x1
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x220
    strb r3, [r6, #0x4b2]
    bl func_02094504
.L_1bc:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    str r0, [r6, #0x4b8]
    beq .L_1dc
    mov r0, r4
    add r1, r6, #0x220
    mov r2, #0x16
    bl func_020944a4
.L_1dc:
    ldrb r0, [r5, #0x18]
    strb r0, [r6, #0x236]
    ldr r0, [r5, #0x4]
    bl func_020a3380
    mov r2, r0, lsl #0x11
    ldr r0, [r5, #0x4]
    add r1, r6, #0x238
    mov r2, r2, lsr #0x10
    bl func_020944a4
    ldr r0, [r5, #0x8]
    add r1, r6, #0x298
    mov r2, #0xc0
    bl func_020944a4
    mov r1, #0x1
    strb r1, [r6, #0x358]
    add r0, r6, #0x300
    strh r1, [r0, #0x5a]
    add r0, r6, #0x400
    strh r1, [r0, #0xb0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
