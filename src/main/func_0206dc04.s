; func_0206dc04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206bf60
        .extern func_02091690
        .extern func_020916c8
        .extern func_0209198c
        .extern func_02091af4
        .extern func_020924c0
        .extern func_0209256c
        .global func_0206dc04
        .arm
func_0206dc04:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    movs r8, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    add r0, r8, #0x20
    bl func_02091af4
    bl OS_DisableIrq
    mov r7, r0
    bl func_020916c8
    add r1, sp, #0x0
    mov r0, r8
    mov r2, #0x0
    bl func_020924c0
    cmp r0, #0x0
    beq .L_4d8
    add r4, sp, #0x0
    mvn r6, #0xa
    mov r5, #0x0
.L_494:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_4c0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_4b8
    mov r1, r6
    mov r2, r5
    bl func_0209256c
.L_4b8:
    ldr r0, [sp]
    bl func_0206bf60
.L_4c0:
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_020924c0
    cmp r0, #0x0
    bne .L_494
.L_4d8:
    bl func_02091690
    bl func_0209198c
    mov r0, r7
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
