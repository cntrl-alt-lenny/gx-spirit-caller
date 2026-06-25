; func_020639d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_020612c8
        .global func_020639d8
        .arm
func_020639d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r0, [r9, #0x5c]
    ldr r7, [r1]
    ldr r6, [r1, #0x4]
    mov r1, r2
    mov r8, #0x0
    bl func_02053de4
    ldr r0, [r9, #0x5c]
    bl func_020540cc
    mov r5, r0
    cmp r5, #0x0
    mov r4, r8
    ble .L_7c
.L_3c:
    ldr r0, [r9, #0x5c]
    mov r1, r4
    bl func_0205405c
    ldr r1, [r0]
    cmp r1, r7
    ble .L_70
    sub r1, r1, r6
    str r1, [r0]
    ldr r1, [r0]
    ldr r0, [r0, #0x4]
    add r0, r1, r0
    cmp r8, r0
    movle r8, r0
.L_70:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_3c
.L_7c:
    mov r1, r7
    mov r2, r6
    add r0, r9, #0x44
    bl func_020612c8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
