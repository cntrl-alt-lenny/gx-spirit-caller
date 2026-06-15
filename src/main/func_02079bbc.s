; func_02079bbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079e20
        .extern func_020945f4
        .global func_02079bbc
        .arm
func_02079bbc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r5, r3
    mov r8, r0
    mov r6, r2
    mov r0, r7
    mov r1, r5
    bl func_02079e20
    mov r4, r0
    mov r0, r6
    mov r1, r5
    bl func_02079e20
    cmp r4, r0
    movlt r4, r0
    mov r3, #0x0
    cmp r4, r5
    addne r4, r4, #0x1
    mov ip, r3
    b .L_d20
.L_d00:
    mov r2, ip, lsl #0x1
    ldrh r1, [r7, r2]
    ldrh r0, [r6, r2]
    add ip, ip, #0x1
    sub r0, r1, r0
    add r0, r3, r0
    strh r0, [r8, r2]
    mov r3, r0, asr #0x10
.L_d20:
    cmp ip, r4
    blt .L_d00
    cmp ip, r5
    bge .L_d38
    cmp r3, #0x0
    bne .L_d00
.L_d38:
    cmp r8, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r8, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    sub r1, r5, ip
    add r0, r8, ip, lsl #0x1
    mov r2, r1, lsl #0x1
    mov r1, #0x0
    bl func_020945f4
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
