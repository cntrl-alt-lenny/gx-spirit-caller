; func_02056ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02056bc0
        .extern func_0205c34c
        .extern func_0205c4d8
        .extern func_0205c670
        .extern func_0205c6d4
        .extern func_0205c780
        .extern func_0205d648
        .global func_02056ac4
        .arm
func_02056ac4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0205c780
    movs r8, r0
    bne .L_d8
    add r2, sp, #0x0
    mov r0, r7
    mov r1, r6
    bl func_0205d648
    cmp r0, #0x0
    beq .L_58
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_74
.L_58:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02056bc0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_74:
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    bl func_0205c6d4
    movs r8, r0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [sp]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_c0
    mov r0, r7
    mov r1, r8
    bl func_0205c670
    cmp r0, #0x0
    beq .L_d8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c0:
    mov r0, r7
    mov r1, r8
    bl func_0205c4d8
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_d8:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_0205c34c
    cmp r0, #0x0
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
