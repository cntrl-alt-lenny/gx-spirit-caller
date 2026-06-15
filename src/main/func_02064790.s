; func_02064790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053e58
        .extern func_020540d0
        .extern func_02054140
        .extern func_020544c8
        .global func_02064790
        .arm
func_02064790:
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
    bne .L_384
    ldr r0, [r1, #0x8]
    ldr r0, [r0, #0x10]
    bl func_02054140
    mov r6, r0
    mov r5, #0x0
    cmp r6, #0x0
    ldmleia sp!, {r4, r5, r6, lr}
    addle sp, sp, #0x10
    bxle lr
.L_330:
    ldr r4, [sp, #0x10]
    mov r1, r5
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x10]
    bl func_020540d0
    ldr r0, [r0]
    cmp r4, r0
    bne .L_36c
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r0, [r0, #0x10]
    bl func_02053e58
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_36c:
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_330
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_384:
    ldr r0, [r1, #0x8]
    add r1, sp, #0x10
    ldr r0, [r0, #0xc]
    bl func_020544c8
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
