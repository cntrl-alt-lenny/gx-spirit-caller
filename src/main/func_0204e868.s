; func_0204e868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .extern Strchr
        .global func_0204e868
        .arm
func_0204e868:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r1
    mov r4, r0
    mov r8, r2
    mov r0, r9
    mov r1, #0x0
    bl Strchr
    mov r7, r0
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_1460
    mov r5, #0x2f
.L_1434:
    mov r0, r9
    mov r1, r5
    bl Strchr
    cmp r0, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r6, r6, #0x1
    cmp r6, r8
    add r9, r0, #0x1
    blt .L_1434
.L_1460:
    mov r0, r9
    mov r1, #0x2f
    bl Strchr
    cmp r0, #0x0
    moveq r0, r7
    cmp r9, r0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    sub r5, r0, r9
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_02094688
    mov r1, #0x0
    mov r0, r5
    strb r1, [r4, r5]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
