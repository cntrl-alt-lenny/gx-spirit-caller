; func_0208a1e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02089024
        .extern func_0208938c
        .extern func_02089ee8
        .extern func_0208a09c
        .global func_0208a1e4
        .arm
func_0208a1e4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0208938c
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r4, #0x4]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl func_0208a09c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ands r0, r7, #0x1
    beq .L_5ec
    ldr r0, [r4]
    mov r1, r6
    mov r2, r5
    bl func_02089ee8
    cmp r0, #0x0
    bne .L_5f4
    add sp, sp, #0x4
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_5ec:
    ldr r0, [r4]
    bl func_02089024
.L_5f4:
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    strne r0, [r1]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
