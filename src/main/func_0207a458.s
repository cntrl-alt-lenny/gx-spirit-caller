; func_0207a458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_0207af28
        .extern func_0207b038
        .extern func_0207b13c
        .global func_0207a458
        .arm
func_0207a458:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r0, [r0, #0x2]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_690
    b .L_60c
    b .L_678
    b .L_690
    b .L_678
    b .L_690
.L_60c:
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0xc
    bne .L_63c
    mov r0, #0xa
    bl func_0207b038
    bl func_0207af28
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_63c:
    add r1, r1, #0x2200
    mov r2, #0x0
    mov r0, #0x3
    strh r2, [r1, #0x82]
    bl func_0207b038
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    ldr r3, _LIT1
    mov r2, r0
    add r1, r1, #0x2140
    bl func_0207b13c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_678:
    mov r0, #0xa
    bl func_0207b038
    bl func_0207af28
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_690:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT2
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b13c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x0000083d
_LIT2: .word 0x0000084f
