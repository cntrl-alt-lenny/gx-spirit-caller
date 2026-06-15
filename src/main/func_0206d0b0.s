; func_0206d0b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206ceb8
        .extern func_0206cfa0
        .global func_0206d0b0
        .arm
func_0206d0b0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrsb ip, [r7, #0x73]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp ip, #0x4
    bne .L_3e0
    ldr r4, [sp, #0x18]
    str r4, [sp]
    bl func_0206ceb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_3e0:
    ldr ip, [sp, #0x18]
    str ip, [sp]
    bl func_0206cfa0
    mvn r1, #0x5
    cmp r0, r1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldr r1, [sp, #0x1c]
    ands r1, r1, #0x1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr ip, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp]
    bl func_0206ceb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
