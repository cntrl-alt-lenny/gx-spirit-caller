; func_02085d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_02085d8c
        .arm
func_02085d8c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    ands r0, r1, #0x4
    moveq r4, #0x1
    ands r0, r1, #0x20
    beq .L_394
    ands r0, r1, #0x8
    bne .L_394
    cmp r4, #0x0
    beq .L_384
    add r1, r5, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084d24
    mov r4, #0x0
.L_384:
    add r1, r5, #0x10
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
.L_394:
    ldr r0, [r5]
    ands r0, r0, #0x2
    bne .L_3d0
    cmp r4, #0x0
    beq .L_3bc
    add r1, r5, #0x28
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084d24
    b .L_3e8
.L_3bc:
    add r1, r5, #0x28
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084d24
    b .L_3e8
.L_3d0:
    cmp r4, #0x0
    beq .L_3e8
    add r1, r5, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084d24
.L_3e8:
    ldr r0, [r5]
    ands r0, r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    add r1, r5, #0x4
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
