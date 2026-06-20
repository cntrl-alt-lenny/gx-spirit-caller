; func_ov002_022a1890 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_0200612c
        .extern func_ov002_022a16b0
        .global func_ov002_022a1890
        .arm
func_ov002_022a1890:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    cmp r1, #0x0
    add r0, sp, #0x4
    add r1, sp, #0x0
    beq .L_24
    bl func_02006110
    b .L_28
.L_24:
    bl func_0200612c
.L_28:
    mov r0, r5
    ldr r4, [r5, #0x34]
    bl func_ov002_022a16b0
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    bge .L_98
    ldr r1, [sp, #0x4]
    mov r2, #0x0
    mov r3, r2
    cmp r1, #0x10
    blt .L_5c
    cmp r1, #0xf0
    movlt r3, #0x1
.L_5c:
    cmp r3, #0x0
    beq .L_8c
    ldr r1, [sp]
    mov r3, #0x0
    cmp r1, r0
    blt .L_84
    add r0, r0, r4, lsl #0x3
    sub r0, r0, #0x6
    cmp r1, r0
    movlt r3, #0x1
.L_84:
    cmp r3, #0x0
    movne r2, #0x1
.L_8c:
    add sp, sp, #0x8
    mov r0, r2
    ldmia sp!, {r3, r4, r5, pc}
.L_98:
    cmp r1, #0xb
    bne .L_c4
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    cmp r1, #0x10
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, pc}
    add sp, sp, #0x8
    cmp r1, #0xf0
    movlt r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    ldr r1, [sp, #0x4]
    mov r2, #0x0
    mov r3, r2
    cmp r1, #0x10
    blt .L_e0
    cmp r1, #0xf0
    movlt r3, #0x1
.L_e0:
    cmp r3, #0x0
    beq .L_10c
    ldr r1, [sp]
    mov r3, #0x0
    cmp r1, r0
    blt .L_104
    add r0, r0, r4, lsl #0x3
    cmp r1, r0
    movlt r3, #0x1
.L_104:
    cmp r3, #0x0
    movne r2, #0x1
.L_10c:
    mov r0, r2
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
