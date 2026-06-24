; func_02068f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e310
        .extern func_02045398
        .extern func_020680a8
        .extern func_02068fd8
        .extern func_02069088
        .extern func_0206b2a8
        .global func_02068f04
        .arm
func_02068f04:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    ldr r4, [sp, #0x30]
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r4, #0x0
    bne .L_3c
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x1
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_3c:
    ldr r0, _LIT1
    bl func_02045398
    movs r4, r0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x34]
    ldr r0, [sp, #0x38]
    str r1, [r4, #0x630]
    str r0, [r4, #0x634]
    mov r0, #0x0
    str r0, [r4, #0x624]
    ldr r1, [sp, #0x30]
    str r5, [sp]
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r8
    mov r2, r7
    mov r3, r6
    add r0, r4, #0x4c
    str r4, [sp, #0xc]
    bl func_0206b2a8
    ldr r0, _LIT3
    ldr r1, [sp, #0x28]
    str r0, [sp]
    ldr r2, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r0, r4
    str r4, [sp, #0x4]
    bl func_020680a8
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219e310
_LIT1: .word 0x00000638
_LIT2: .word func_02069088
_LIT3: .word func_02068fd8
