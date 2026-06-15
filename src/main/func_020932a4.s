; func_020932a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a66d4
        .extern data_027e0000
        .extern func_020905dc
        .extern func_020930b0
        .extern func_020934cc
        .extern func_02093684
        .global func_020932a4
        .arm
func_020932a4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r2, #0x0
    mov r0, #0x10
    strh r2, [r1]
    bl func_020905dc
    ldr r0, _LIT1
    add r0, r0, #0x3000
    ldr r1, [r0, #0xff8]
    orr r1, r1, #0x10
    str r1, [r0, #0xff8]
    bl func_020930b0
    ldr r2, _LIT2
    ldr r4, [r2]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r3, [r4, #0x10]
    ldr ip, [r4, #0xc]
    cmp r1, r3
    cmpeq r0, ip
    bcs .L_74
    mov r0, r4
    bl func_02093684
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_74:
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    moveq r0, #0x0
    streq r0, [r2, #0x4]
    str r1, [r2]
    movne r0, #0x0
    strne r0, [r1, #0x14]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    cmp r1, r0
    ldr r5, [r4]
    cmpeq r2, r0
    streq r0, [r4]
    cmp r5, #0x0
    beq .L_bc
    ldr r0, [r4, #0x4]
    blx r5
.L_bc:
    ldr r2, [r4, #0x1c]
    ldr r0, [r4, #0x20]
    mov r1, #0x0
    cmp r0, r1
    cmpeq r2, r1
    beq .L_e4
    mov r0, r4
    mov r2, r1
    str r5, [r4]
    bl func_020934cc
.L_e4:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    bl func_02093684
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x04000106
_LIT1: .word data_027e0000
_LIT2: .word data_021a66d4
