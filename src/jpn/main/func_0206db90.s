; func_0206db90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206beec
        .extern func_020915a8
        .extern func_020915e0
        .extern func_020918a4
        .extern func_02091a0c
        .extern func_020923d8
        .extern func_02092484
        .global func_0206db90
        .arm
func_0206db90:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    movs r8, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    add r0, r8, #0x20
    bl func_02091a0c
    bl OS_DisableIrq
    mov r7, r0
    bl func_020915e0
    add r1, sp, #0x0
    mov r0, r8
    mov r2, #0x0
    bl func_020923d8
    cmp r0, #0x0
    beq .L_94
    add r4, sp, #0x0
    mvn r6, #0xa
    mov r5, #0x0
.L_50:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_7c
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_74
    mov r1, r6
    mov r2, r5
    bl func_02092484
.L_74:
    ldr r0, [sp]
    bl func_0206beec
.L_7c:
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_020923d8
    cmp r0, #0x0
    bne .L_50
.L_94:
    bl func_020915a8
    bl func_020918a4
    mov r0, r7
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
