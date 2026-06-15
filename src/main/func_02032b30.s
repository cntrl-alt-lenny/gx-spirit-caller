; func_02032b30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020327e4
        .extern func_020334cc
        .global func_02032b30
        .arm
func_02032b30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, [sp, #0x1c]
    mov r7, r1
    mov r0, r4
    mov r6, r2
    mov r5, r3
    bl func_020334cc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    bne .L_140
    ldr r1, [r4, #0xeb4]
    mov r0, r4
    orr r1, r1, #0x3000
    str r1, [r4, #0xeb4]
    bl func_020327e4
    b .L_1a4
.L_140:
    ldr r0, [r4, #0xeb4]
    tst r0, #0x4000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_170
    ldr r0, [r4, #0xeb4]
    cmp r6, #0x0
    orrne r0, r0, #0x4000
    strne r0, [r4, #0xeb4]
    biceq r0, r0, #0x4000
    streq r0, [r4, #0xeb4]
.L_170:
    cmp r6, #0x0
    bne .L_194
    cmp r5, #0x0
    beq .L_1a4
    ldr r0, [r4, #0xeb4]
    orr r0, r0, #0x1000
    bic r0, r0, #0x2000
    str r0, [r4, #0xeb4]
    b .L_1a4
.L_194:
    ldr r0, [r4, #0xeb4]
    orr r0, r0, #0x1000
    bic r0, r0, #0x2000
    str r0, [r4, #0xeb4]
.L_1a4:
    ldr r4, [r4, #0xeec]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    blx r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
