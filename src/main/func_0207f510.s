; func_0207f510 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f850
        .extern func_0208f1c4
        .extern func_0208f210
        .extern func_0208f284
        .extern func_0208f38c
        .extern func_0208f3e4
        .extern func_0208f458
        .extern func_0208feb4
        .extern func_0208ff1c
        .extern func_02090048
        .extern func_020900a0
        .extern func_02090114
        .extern func_02092904
        .global func_0207f510
        .arm
func_0207f510:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r5, [r9, #0xc]
    ldr r4, [r9, #0x8]
    mov r8, r1
    mov r7, r2
    mov r0, r5
    mov r1, r4
    mov r6, r3
    bl func_02092904
    cmp r7, #0x0
    beq .L_c0
    cmp r7, #0x1
    beq .L_48
    cmp r7, #0x2
    beq .L_84
    b .L_d8
.L_48:
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    beq .L_70
    bl func_0208f458
    mov r0, r5
    mov r1, r8
    mov r2, r4
    bl func_0208f3e4
    bl func_0208f38c
    b .L_d8
.L_70:
    mov r0, r5
    mov r1, r8
    mov r2, r4
    bl func_0208ff1c
    b .L_d8
.L_84:
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    beq .L_ac
    bl func_0208f284
    mov r0, r5
    mov r1, r8
    mov r2, r4
    bl func_0208f210
    bl func_0208f1c4
    b .L_d8
.L_ac:
    mov r0, r5
    mov r1, r8
    mov r2, r4
    bl func_0208feb4
    b .L_d8
.L_c0:
    bl func_02090114
    mov r0, r5
    mov r1, r8
    mov r2, r4
    bl func_020900a0
    bl func_02090048
.L_d8:
    ldr r1, [r9]
    mov r0, r6
    str r1, [r6]
    ldr r3, [r9, #0x4]
    mov r1, r7
    mov r2, r8
    str r3, [r6, #0x4]
    bl func_0207f850
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
