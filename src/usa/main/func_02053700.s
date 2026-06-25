; func_02053700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e310
        .extern data_0219e394
        .extern func_0205383c
        .extern func_020539f0
        .extern func_02054ca0
        .extern func_02054dfc
        .extern func_02054f8c
        .extern func_020552bc
        .global func_02053700
        .arm
func_02053700:
    stmfd sp!, {lr}
    sub sp, sp, #0x5c
    ldr r0, _LIT0
    mov r2, #0x8
    ldr r0, [r0]
    mvn r1, #0x0
    cmp r0, r1
    ldreq r1, _LIT1
    moveq r0, #0x1
    str r2, [sp, #0x10]
    streq r0, [r1]
    addeq sp, sp, #0x5c
    ldmeqfd sp!, {pc}
    bl func_02054f8c
    cmp r0, #0x0
    beq .L_d4
    add r0, sp, #0x8
    str r0, [sp]
    add r1, sp, #0x10
    str r1, [sp, #0x4]
    ldr r0, _LIT0
    add r1, sp, #0x18
    ldr r0, [r0]
    mov r2, #0x40
    mov r3, #0x0
    bl func_02054ca0
    mov r1, r0
    add r0, sp, #0x18
    add r2, sp, #0x8
    add r3, sp, #0x14
    bl func_0205383c
    cmp r0, #0x0
    bne .L_d4
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054dfc
    ldr r1, [sp, #0x14]
    ands r0, r1, #0x1
    ldrne r0, _LIT1
    movne r1, #0x2
    strne r1, [r0]
    bne .L_c4
    ands r0, r1, #0x2
    ldrne r0, _LIT1
    movne r1, #0x3
    strne r1, [r0]
    ldreq r0, _LIT1
    moveq r1, #0x1
    streq r1, [r0]
.L_c4:
    ldr r0, _LIT1
    add sp, sp, #0x5c
    ldr r0, [r0]
    ldmfd sp!, {pc}
.L_d4:
    bl func_020552bc
    ldr r1, _LIT0
    ldr r2, [r1, #0x50]
    add r2, r2, #0x7d0
    cmp r0, r2
    bls .L_128
    ldr r0, [r1, #0x54]
    cmp r0, #0x1
    bne .L_114
    ldr r0, [r1]
    bl func_02054dfc
    ldr r1, _LIT1
    mov r0, #0x1
    str r0, [r1]
    add sp, sp, #0x5c
    ldmfd sp!, {pc}
.L_114:
    bl func_020539f0
    ldr r0, _LIT0
    ldr r1, [r0, #0x54]
    add r1, r1, #0x1
    str r1, [r0, #0x54]
.L_128:
    mov r0, #0x0
    add sp, sp, #0x5c
    ldmfd sp!, {pc}
_LIT0: .word data_0219e394
_LIT1: .word data_0219e310
