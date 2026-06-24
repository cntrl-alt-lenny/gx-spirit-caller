; func_02091c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020915a0
        .extern func_02091c10
        .extern func_02091fd4
        .extern func_0209216c
        .extern func_02092184
        .global func_02091c3c
        .arm
func_02091c3c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r5, r1
    mov r7, r2
    mov r6, r3
    bl OS_DisableIrq
    mov r4, r0
    bl func_0209216c
    ldr r2, [sp, #0x1c]
    mov r1, #0x0
    str r2, [r8, #0x70]
    str r0, [r8, #0x6c]
    str r1, [r8, #0x64]
    str r1, [r8, #0x74]
    mov r0, r8
    bl func_02091fd4
    mov r1, r5
    str r6, [r8, #0x94]
    ldr r0, [sp, #0x18]
    mov ip, #0x0
    sub r5, r6, r0
    sub r2, r6, #0x4
    str r5, [r8, #0x90]
    str ip, [r8, #0x98]
    ldr r3, _LIT0
    ldr r0, [r8, #0x94]
    ldr r6, _LIT1
    str r3, [r0, #-4]
    ldr r3, [r8, #0x90]
    mov r0, r8
    str r6, [r3]
    str ip, [r8, #0xa0]
    ldr r3, [r8, #0xa0]
    str r3, [r8, #0x9c]
    bl func_02092184
    str r7, [r8, #0x4]
    add r1, r5, #0x4
    ldr r2, _LIT2
    mov r0, #0x0
    str r2, [r8, #0x3c]
    ldr r2, [sp, #0x18]
    sub r2, r2, #0x8
    bl Fill32
    mov r1, #0x0
    str r1, [r8, #0x84]
    str r1, [r8, #0x88]
    str r1, [r8, #0x8c]
    mov r0, r8
    bl func_020915a0
    mov r0, #0x0
    str r0, [r8, #0x78]
    str r0, [r8, #0x80]
    ldr r2, [r8, #0x80]
    add r1, r8, #0xa4
    str r2, [r8, #0x7c]
    mov r2, #0xc
    bl Fill32
    mov r0, r4
    mov r1, #0x0
    str r1, [r8, #0xb0]
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0xfddb597d
_LIT1: .word 0x7bf9dd5b
_LIT2: .word func_02091c10
