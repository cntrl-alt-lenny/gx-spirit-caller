; func_02008ac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02021008
        .extern data_02104f3c
        .extern func_02007230
        .extern func_02090868
        .extern func_020908c0
        .extern func_0209bfd4
        .extern func_0209bfe4
        .extern func_0209c0cc
        .extern func_0209c7dc
        .global func_02008ac8
        .arm
func_02008ac8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    bl func_0209c0cc
    cmp r0, #0x0
    beq .L_5fc
    bl func_02090868
    mov fp, r0
    mvn r0, #0x2
    cmp fp, r0
    beq .L_5fc
    mov r0, fp, lsl #0x10
    add r2, sp, #0x18
    mov r1, #0x0
    mov r0, r0, lsr #0x10
    str r1, [r2]
    str r1, [r2, #0x4]
    str r1, [r2, #0x8]
    str r1, [r2, #0xc]
    bl func_0209bfe4
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x14
    mov r3, r0
    mov r2, #0x4
    str r0, [sp, #0x10]
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r4, _LIT0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    add sl, sp, #0x18
    mov r8, #0x0
    str r0, [r4, #0x4]
    mov r9, #0x20000
    mov r7, #0x7
    mov r6, #0xa
    mov r5, #0x2
.L_594:
    mov r0, #0x0
    str r0, [sp]
    stmib sp, {r0, r7}
    str r6, [sp, #0xc]
    mov r0, sl
    mov r1, r9
    str r5, [sp, #0x10]
    mov r2, #0x10
    mov r3, #0x0
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    add r8, r8, #0x1
    add r9, r9, #0x4000
    str r0, [r4, #0x4]
    cmp r8, #0x8
    blt .L_594
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bfd4
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020908c0
.L_5fc:
    bl func_02007230
    cmp r0, #0x0
    beq .L_60c
    bl .L_02021008
.L_60c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f3c
