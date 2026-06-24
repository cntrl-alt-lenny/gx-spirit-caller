; func_02080588 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02080524
        .global func_02080588
        .arm
func_02080588:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r5, [sp, #0x24]
    ldr lr, [sp, #0x20]
    cmp r5, #0x20
    ldr ip, [sp, #0x28]
    bgt .L_40
    mla r4, r5, lr, r3
    ldr lr, [sp, #0x2c]
    str ip, [sp]
    mov r3, r5
    add r0, r0, r4, lsl #0x1
    str lr, [sp, #0x4]
    bl func_02080524
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_40:
    ldr r4, [sp, #0x2c]
    add r7, lr, r2
    mov r2, r4, lsl #0x1c
    cmp lr, r7
    add r8, r3, r1
    mov r4, r2, lsr #0x10
    addge sp, sp, #0x8
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
.L_60:
    cmp lr, #0x20
    movlt r1, lr
    addge r1, lr, #0x20
    mov r6, r3
    cmp r3, r8
    add r5, r0, r1, lsl #0x6
    bge .L_a4
.L_7c:
    cmp r6, #0x20
    movlt r1, r6
    addge r1, r6, #0x3e0
    orr r2, r4, ip
    mov r1, r1, lsl #0x1
    add r6, r6, #0x1
    strh r2, [r5, r1]
    cmp r6, r8
    add ip, ip, #0x1
    blt .L_7c
.L_a4:
    add lr, lr, #0x1
    cmp lr, r7
    blt .L_60
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
