; func_02075c8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070898
        .extern func_020709d8
        .extern func_02094688
        .global func_02075c8c
        .arm
func_02075c8c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    add r4, sp, #0x0
.L_18:
    mov r0, r4
    mov r1, r5
    bl func_020709d8
    ldr r1, [sp]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r1, r6
    strhi r6, [sp]
    ldr r2, [sp]
    mov r1, r7
    bl func_02094688
    ldr r0, [sp]
    mov r1, r5
    bl func_02070898
    ldr r0, [sp]
    sub r6, r6, r0
    cmp r6, #0x0
    add r7, r7, r0
    bgt .L_18
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
