; func_0206404c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02060fa4
        .extern func_020610dc
        .extern func_02062c88
        .extern func_02064364
        .global func_0206404c
        .arm
func_0206404c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r3, [r4, #0xc]
    cmp r3, #0x2
    beq .L_220
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x40
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_220:
    cmp r2, #0x20
    bge .L_240
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x40
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_240:
    add r0, sp, #0x0
    bl func_02060fa4
    add r0, sp, #0x20
    bl func_020610dc
    add r1, sp, #0x20
    add r0, r4, #0x68
    bl func_02060fa4
    add r1, sp, #0x0
    add r2, sp, #0x20
    mov r0, r4
    bl func_02062c88
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x3
    strne r0, [r4, #0xc]
    movne r0, #0x1
    add sp, sp, #0x40
    ldmia sp!, {r4, pc}
