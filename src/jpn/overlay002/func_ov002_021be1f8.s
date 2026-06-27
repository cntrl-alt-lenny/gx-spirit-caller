; func_ov002_021be1f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021be2a4
        .extern func_ov002_021bf1b4
        .extern func_ov002_021c023c
        .extern func_ov002_021c026c
        .global func_ov002_021be1f8
        .arm
func_ov002_021be1f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    mov r7, r1
    bl func_ov002_021be2a4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c023c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c026c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    rsb r6, r8, #0x1
    mov r5, #0x0
    mov r4, #0x1
.L_c34:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_c34
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
