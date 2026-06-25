; func_0206bd00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206beec
        .extern func_020915a8
        .extern func_020915e0
        .extern func_020922a0
        .extern func_020923d8
        .extern func_02092484
        .global func_0206bd00
        .arm
func_0206bd00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    add r6, sp, #0x0
    mov r4, #0x0
    mov r5, #0x1
.L_18:
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_020922a0
    ldr r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r1, [r0]
    blx r1
    mov r7, r0
    bl OS_DisableIrq
    mov r8, r0
    bl func_020915e0
    mov r0, r9
    mov r1, r4
    mov r2, r4
    bl func_020923d8
    ldr r0, [sp]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    strne r7, [r0, #0x6c]
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_90
    mov r1, r7
    mov r2, r4
    bl func_02092484
.L_90:
    ldr r0, [sp]
    bl func_0206beec
    bl func_020915a8
    mov r0, r8
    bl OS_RestoreIrq
    b .L_18
