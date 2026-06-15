; func_020501cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff968
        .extern func_02046760
        .extern func_020467e4
        .extern func_0204682c
        .extern func_020498f0
        .extern func_0204a8bc
        .extern func_0204c40c
        .extern func_0204cc20
        .extern func_02050054
        .extern func_020624cc
        .extern func_02062600
        .extern func_02064f84
        .extern func_0209150c
        .global func_020501cc
        .arm
func_020501cc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    mov r4, r1
    bl func_020498f0
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x7
    beq .L_d0
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xc
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_d0:
    cmp r4, #0x0
    beq .L_24c
    cmp r4, #0x5
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x6
    bne .L_220
    bl func_020498f0
    ldrb r1, [r0, #0xc]
    add r1, r1, #0x1
    strb r1, [r0, #0xc]
    bl func_020498f0
    ldrb r0, [r0, #0xc]
    cmp r0, #0x5
    bls .L_13c
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_13c:
    bl func_020498f0
    ldr r3, [r0, #0x200]
    ldr r2, _LIT0
    add r0, sp, #0x10
    mov r1, #0xc
    bl func_0209150c
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r2, [r6, #0x14]
    ldrb r1, [r0, #0x14]
    add r0, r7, r2, lsl #0x2
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x200
    ldrh r1, [r1, #0x90]
    ldr r0, [r0, #0x210]
    mov r2, #0x0
    bl func_02064f84
    mov r5, r0
    bl func_020498f0
    mvn r1, #0x0
    str r1, [sp]
    ldr r3, _LIT1
    mov r1, #0x0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x8]
    mov r2, r5
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r3, sp, #0x10
    ldr r0, [r0]
    bl func_02062600
    cmp r0, #0x1
    bne .L_1ec
    bl func_0204a8bc
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1ec:
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    add sp, sp, #0x1c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_220:
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    add sp, sp, #0x1c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_24c:
    bl func_0204682c
    mov r5, r0
    mvn r1, #0x0
    cmp r5, r1
    bne .L_274
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_274:
    bl func_020467e4
    mov r4, r0
    mov r0, r5
    bl func_02046760
    str r6, [r4]
    mov r4, r0
    bl func_020498f0
    ldrb r2, [r0, #0xd]
    mov r1, #0x0
    add r2, r2, #0x1
    strb r2, [r0, #0xd]
    strb r5, [r4]
    strh r1, [r4, #0x2]
    str r1, [r4, #0x4]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r2, [r0, #0xd]
    mov r0, r6
    mov r1, r4
    add r2, r5, r2
    ldrb r2, [r2, #0x2d0]
    strb r2, [r4, #0x1]
    bl func_020624cc
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xc
    bne .L_2f4
    mov r0, #0x0
    bl func_0204c40c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2f4:
    mov r0, #0x1
    bl func_0204c40c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff968
_LIT1: .word 0x00001388
_LIT2: .word 0xfffeabc4
