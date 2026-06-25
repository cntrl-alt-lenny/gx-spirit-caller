; func_02052c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053614
        .extern func_02053690
        .extern func_02053698
        .extern func_020536ac
        .extern func_020536b4
        .global func_02052c68
        .arm
func_02052c68:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r7, r0
    bl func_02053614
    mov r5, r0
    mov r0, r4
    bl func_02053614
    cmp r5, r0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    cmp r5, #0x3
    bne .L_60
    mov r0, r7
    bl func_02053690
    mov r5, r0
    mov r0, r4
    bl func_02053690
    cmp r5, r0
    moveq r0, #0x1
    add sp, sp, #0x4
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_60:
    cmp r5, #0x1
    bne .L_bc
    mov r0, r7
    bl func_020536b4
    mov r5, r0
    mov r6, r1
    mov r0, r4
    bl func_020536b4
    cmp r6, r1
    cmpeq r5, r0
    bne .L_b0
    mov r0, r7
    bl func_020536ac
    mov r5, r0
    mov r0, r4
    bl func_020536ac
    cmp r5, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_bc:
    cmp r5, #0x2
    bne .L_f4
    mov r0, r7
    bl func_02053698
    mov r5, r0
    mov r6, r1
    mov r0, r4
    bl func_02053698
    cmp r6, r1
    cmpeq r5, r0
    moveq r0, #0x1
    add sp, sp, #0x4
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_f4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
