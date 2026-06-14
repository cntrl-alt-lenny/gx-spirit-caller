; func_ov019_021b5948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_02006110
        .extern func_020061ac
        .extern func_020944a4
        .global func_ov019_021b5948
        .arm
func_ov019_021b5948:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r1, [r0, #0x14]
    ldr r2, [r0, #0x4]
    rsb r1, r1, #0xc0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    ldr r3, [r0, #0x18]
    sub r1, r1, #0x8
    cmp r2, #0x1
    add r4, r3, r1
    bne .L_2cc
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_2cc
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r5, r4, #0x5
    mov r6, #0x0
    bl func_02006110
    ldr r0, [sp, #0xc]
    cmp r0, #0x68
    ldrge r1, [sp, #0x8]
    cmpge r1, r5
    blt .L_280
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r6, #0x1
.L_280:
    mov r5, #0x338
    bl func_020061ac
    cmp r0, #0x0
    sub r1, r4, #0x2
    cmpne r6, #0x0
    movne r5, #0x340
    orr r2, r5, #0x1400
    ldr r0, _LIT0
    and r1, r1, #0xff
    orr r3, r1, r0
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
.L_2cc:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xc0614000
