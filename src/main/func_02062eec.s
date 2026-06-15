; func_02062eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_020613d8
        .extern func_02061464
        .extern func_020614d8
        .extern func_02061530
        .extern func_02062fc0
        .extern func_020643ac
        .global func_02062eec
        .arm
func_02062eec:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r5, r2
    add r0, r7, #0x50
    mov r6, r1
    mov r4, r3
    bl func_02061530
    cmp r0, r5
    bge .L_608
    mov r0, r7
    bl func_020643ac
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    strne r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_608:
    ldrh r1, [r7, #0x64]
    mov r0, r7
    mov r2, r5
    bl func_02062fc0
    cmp r0, #0x0
    bne .L_640
    mov r0, r7
    bl func_020643ac
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    strne r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_640:
    ldr r1, _LIT0
    add r0, r7, #0x50
    mov r2, #0x2
    bl func_020613d8
    add r0, r7, #0x50
    and r1, r6, #0xff
    bl func_020614d8
    ldrh r1, [r7, #0x64]
    add r0, r7, #0x50
    add r2, r1, #0x1
    strh r2, [r7, #0x64]
    bl func_02061464
    ldrh r1, [r7, #0x66]
    add r0, r7, #0x50
    bl func_02061464
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101530
