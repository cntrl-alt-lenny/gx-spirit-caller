; func_ov006_021c38ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f328
        .extern func_0202160c
        .extern func_0202165c
        .extern func_ov006_021b69d8
        .extern func_ov006_021b6b30
        .global func_ov006_021c38ec
        .arm
func_ov006_021c38ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r1, [r0, #0x64]
    str r0, [sp]
    add r0, r0, #0x9c
    add r0, r0, r1, lsl #0x4
    cmp r1, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    movne r0, #0x1
    strne r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0xc]
    mov r0, #0x1b
    str r0, [sp, #0x8]
.L_328:
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x14]
    ldr r4, [r0, #0x4]
    ldr r0, _LIT0
    ldr r1, [sp, #0x4]
    add r2, r4, r2
    mov r3, #0x0
    bl func_ov006_021b69d8
    cmp r0, #0x0
    str r0, [sp, #0x10]
    moveq sl, #0x0
    beq .L_370
    ldr r2, [sp, #0x14]
    ldr r0, _LIT0
    ldr r1, [sp, #0x4]
    add r2, r4, r2
    bl func_ov006_021b6b30
    mov sl, r0
.L_370:
    ldr r3, _LIT1
    mov r1, sl, lsr #0x1f
    smull r2, r4, r3, sl
    ldr r0, _LIT2
    add r4, r1, r4, asr #0x6
    smull r2, r3, r0, sl
    mov r7, #0x3e8
    smull r4, r5, r7, r4
    sub r4, sl, r4
    smull r7, r5, r0, r4
    mov r4, r4, lsr #0x1f
    mov r0, r5
    add r0, r4, r0, asr #0x5
    add r3, r1, r3, asr #0x5
    mov r4, #0x64
    str r0, [sp, #0x1c]
    smull r0, r3, r4, r3
    ldr r2, _LIT3
    sub r3, sl, r0
    smull r4, r0, r2, r3
    mov r3, r3, lsr #0x1f
    add r0, r3, r0, asr #0x2
    str r0, [sp, #0x20]
    smull r3, r0, r2, sl
    add r0, r1, r0, asr #0x2
    mov r2, #0xa
    smull r0, r1, r2, r0
    sub r0, sl, r0
    mov r6, #0x0
    mov r9, #0xb4
    str r0, [sp, #0x24]
.L_3ec:
    ldr r0, [sp, #0xc]
    mov r1, #0x5
    add r7, r6, r0
    ldr r0, [sp]
    add r2, r7, #0x9
    ldr r0, [r0, #0x4]
    bl func_0202160c
    mov r4, r0
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_474
    cmp r6, #0x0
    ldr r5, _LIT4
    beq .L_438
    cmp r6, #0x1
    beq .L_44c
    cmp r6, #0x2
    beq .L_460
    b .L_46c
.L_438:
    ldr r0, [sp, #0x1c]
    cmp sl, #0x64
    add r8, r0, #0x8
    movlt r5, #0x0
    b .L_47c
.L_44c:
    ldr r0, [sp, #0x20]
    cmp sl, #0xa
    add r8, r0, #0x8
    movlt r5, #0x0
    b .L_47c
.L_460:
    ldr r0, [sp, #0x24]
    add r8, r0, #0x8
    b .L_47c
.L_46c:
    mov r8, #0x12
    b .L_47c
.L_474:
    mov r5, #0x0
    mov r8, r5
.L_47c:
    cmp r6, #0x3
    moveq fp, #0x2
    movne fp, #0x0
    add r2, r7, #0x9
    mov r0, r4
    mov r1, #0x2
    bl func_0202165c
    add r2, r9, fp
    mov r0, r4
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0x8]
    mov r0, r4
    mov r1, #0x4
    bl func_0202165c
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x3
    bl func_0202165c
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x0
    bl func_0202165c
    mov r2, r8
    mov r0, r4
    mov r1, #0xd
    bl func_0202165c
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    add r6, r6, #0x1
    add r9, r9, #0x6
    cmp r6, #0x4
    blt .L_3ec
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x6
    ldr r0, [sp, #0xc]
    add r0, r0, #0x4
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0x13
    str r0, [sp, #0x8]
    blt .L_328
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word 0x10624dd3
_LIT2: .word 0x51eb851f
_LIT3: .word 0x66666667
_LIT4: .word 0x000001c1
