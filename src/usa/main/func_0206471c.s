; func_0206471c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_02054454
        .global func_0206471c
        .arm
func_0206471c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, [sp, #0x10]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    addne sp, sp, #0x10
    bxne lr
    ldr r0, [r1, #0x24]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    addne sp, sp, #0x10
    bxne lr
    ldr r0, [r1, #0xc]
    cmp r0, #0x7
    bne .L_268
    ldr r0, [r1, #0x8]
    ldr r0, [r0, #0x10]
    bl func_020540cc
    mov r6, r0
    mov r5, #0x0
    cmp r6, #0x0
    ldmleia sp!, {r4, r5, r6, lr}
    addle sp, sp, #0x10
    bxle lr
.L_214:
    ldr r4, [sp, #0x10]
    mov r1, r5
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x10]
    bl func_0205405c
    ldr r0, [r0]
    cmp r4, r0
    bne .L_250
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r0, [r0, #0x10]
    bl func_02053de4
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_250:
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_214
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_268:
    ldr r0, [r1, #0x8]
    add r1, sp, #0x10
    ldr r0, [r0, #0xc]
    bl func_02054454
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
