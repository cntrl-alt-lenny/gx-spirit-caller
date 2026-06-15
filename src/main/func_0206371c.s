; func_0206371c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .extern func_02054140
        .extern func_02062834
        .extern func_020643d8
        .extern func_02064480
        .extern func_020644a4
        .global func_0206371c
        .arm
func_0206371c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r4, r0
    mov r0, r6
    mov r1, #0x0
    mov r5, r2
    bl func_020644a4
    mov r9, r0
    cmp r5, #0x2
    moveq r8, r9
    beq .L_68
    cmp r5, #0x4
    bne .L_4c
    mov r0, r6
    mov r1, #0x2
    bl func_020644a4
    mov r8, r0
    b .L_68
.L_4c:
    mov r0, r4
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_68:
    ldr r0, [r4, #0x60]
    bl func_02054140
    mov r7, r0
    cmp r7, #0x0
    mov r6, #0x0
    ble .L_e0
.L_80:
    ldr r0, [r4, #0x60]
    mov r1, r6
    bl func_020540d0
    mov r5, r0
    ldrh r0, [r5, #0x8]
    mov r1, r9
    bl func_02064480
    cmp r0, #0x0
    blt .L_d4
    ldrh r0, [r5, #0x8]
    mov r1, r8
    bl func_02064480
    cmp r0, #0x0
    bgt .L_d4
    mov r0, r4
    mov r1, r5
    bl func_02062834
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_d4:
    add r6, r6, #0x1
    cmp r6, r7
    blt .L_80
.L_e0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
