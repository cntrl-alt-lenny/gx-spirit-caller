; func_0205d6f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100d74
        .extern data_02100d7c
        .extern func_02054568
        .extern func_0205d6bc
        .extern func_020a6d54
        .global func_0205d6f8
        .arm
func_0205d6f8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r5, r0
    ldr r2, [r5]
    ldr r0, _LIT0
    mov r4, r1
    cmp r4, #0x0
    add r6, r2, r0
    bgt .L_74
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6d54
.L_74:
    cmp r4, #0x0
    addle sp, sp, #0x20
    movle r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    bl func_0205d6bc
    cmp r0, #0x0
    ldrne r0, [sp]
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
    add r1, sp, #0x4
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    str r0, [r1, #0x8]
    str r0, [r1, #0xc]
    str r0, [r1, #0x10]
    str r0, [r1, #0x14]
    str r0, [r1, #0x18]
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x1c]
    str r0, [sp, #0x18]
    ldr r0, [r6]
    bl func_02054568
    ldr r0, [r6, #0x4]
    add r2, sp, #0x0
    add r3, r0, #0x1
    mov r0, r5
    mov r1, r4
    str r3, [r6, #0x4]
    bl func_0205d6bc
    cmp r0, #0x0
    ldrne r0, [sp]
    moveq r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000428
_LIT1: .word data_02100d74
_LIT2: .word data_02100d7c
_LIT3: .word 0x000002b5
