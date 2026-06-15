; func_02061d5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014e4
        .extern data_02101500
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_02061d5c
        .arm
func_02061d5c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    beq .L_840
    cmp r6, #0x0
    bne .L_854
.L_840:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3d
    bl func_020a6d54
.L_854:
    cmp r7, #0x0
    beq .L_864
    cmp r6, #0x0
    bne .L_870
.L_864:
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_870:
    ldr r0, [r7, #0x20]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_89c
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    bne .L_8a8
.L_89c:
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
.L_8a8:
    ldr r1, [r7, #0x1c]
    ldr r0, [sp, #0x20]
    add r1, r1, #0x1
    str r1, [r7, #0x1c]
    ldr r2, [r6, #0x24]
    ldr r1, [sp, #0x24]
    add r2, r2, #0x1
    str r2, [r6, #0x24]
    str r0, [sp]
    ldr r0, [sp, #0x28]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr ip, [r7, #0x20]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    blx ip
    ldr r0, [r7, #0x1c]
    sub r0, r0, #0x1
    str r0, [r7, #0x1c]
    ldr r0, [r6, #0x24]
    sub r0, r0, #0x1
    str r0, [r6, #0x24]
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    beq .L_934
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    bne .L_934
    mov r0, r7
    bl func_02064aa0
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_934:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101500
_LIT1: .word data_021014e4
