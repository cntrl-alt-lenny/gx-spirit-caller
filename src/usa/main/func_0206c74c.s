; func_0206c74c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070c4c
        .extern func_02070e90
        .extern func_02092660
        .extern func_020926d0
        .global func_0206c74c
        .arm
func_0206c74c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7, #0x4]
    mov r5, #0x0
    ldr r6, [r4, #0x64]
    add r0, r6, #0xe0
    bl func_020926d0
    ldrh r0, [r7, #0x10]
    ldrh r1, [r7, #0x12]
    ldr r2, [r7, #0x14]
    bl func_02070e90
    mov r0, r5
    str r0, [r6, #0xf8]
    ldrsb r0, [r7, #0xc]
    cmp r0, #0x0
    beq .L_2e0
    cmp r0, #0x4
    bne .L_2e8
.L_2e0:
    bl func_02070c4c
    mov r5, r0
.L_2e8:
    add r0, r6, #0xe0
    bl func_02092660
    cmp r5, #0x0
    ldrnesh r1, [r4, #0x70]
    mvnne r0, #0x4b
    moveq r0, #0x0
    orrne r1, r1, #0x40
    strneh r1, [r4, #0x70]
    ldreqsh r1, [r4, #0x70]
    orreq r1, r1, #0x4
    streqh r1, [r4, #0x70]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
