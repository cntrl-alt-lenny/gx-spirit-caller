; func_ov002_022ae2f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1330
        .extern data_ov002_022d1830
        .extern func_ov002_022a6cc8
        .global func_ov002_022ae2f4
        .arm
func_ov002_022ae2f4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldrh r0, [r6]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    beq .L_140
    ldr r0, [r6, #0x3c]
    cmp r0, #0x0
    ble .L_140
    ldr r1, _LIT0
    add r0, sp, #0x8
    ldrh lr, [r1, #0x90]
    ldr r1, _LIT1
    mov r2, lr, lsl #0x12
    mov ip, r2, lsr #0x18
    mov r2, lr, lsl #0x1f
    mov r3, lr, lsl #0x1a
    str ip, [sp]
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    strh lr, [sp, #0x4]
    bl func_ov002_022a6cc8
    ldr lr, [sp, #0xc]
    ldr ip, [sp, #0x8]
    sub r1, lr, #0x26
    ldr r2, [r6, #0x3c]
    mov r0, #0x19
    mul r3, r2, r0
    add r0, r3, r3, lsr #0x1f
    str ip, [sp, #0x10]
    str lr, [sp, #0x14]
    cmp r4, r1
    sub r2, ip, r0, asr #0x1
    blt .L_c8
    add r0, r1, #0x18
    cmp r4, r0
    bge .L_c8
    subs r1, r5, r2
    bmi .L_140
    cmp r1, r3
    bge .L_140
    ldr r2, _LIT2
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    add sp, sp, #0x18
    add r0, r3, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_c8:
    sub r0, lr, #0xe
    cmp r4, r0
    blt .L_140
    add r0, lr, #0xd
    cmp r4, r0
    bge .L_140
    ldrh r0, [sp, #0x4]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    bcs .L_11c
    ldr r0, [sp, #0x10]
    sub r1, r0, #0xd
    cmp r5, r1
    blt .L_140
    add r0, r0, #0xd
    cmp r5, r0
    bge .L_140
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_11c:
    ldr r0, [sp, #0x10]
    sub r1, r0, #0xa
    cmp r5, r1
    blt .L_140
    add r0, r0, #0xa
    cmp r5, r0
    addlt sp, sp, #0x18
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
.L_140:
    mvn r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d1830
_LIT1: .word data_ov002_022d1330
_LIT2: .word 0x51eb851f
