; func_0200506c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001ed4
        .extern func_02003aa0
        .extern func_02003c48
        .extern func_02004ed8
        .global func_0200506c
        .arm
func_0200506c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r1
    ldr r5, [sp, #0x28]
    mov r1, #0x2
    mov r7, r2
    mov r2, r1
    mov r9, r0
    mov r6, r3
    ldr r4, [sp, #0x2c]
    bl func_02001ed4
    sub r0, r5, #0x1
    str r0, [sp]
    ldr r0, _LIT0
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, r9
    mov r1, r8
    mov r2, r7
    sub r3, r6, #0x1
    bl func_02004ed8
    mov r0, r9
    mov r1, #0x2
    mov r2, #0x1
    bl func_02001ed4
    str r5, [sp]
    ldr r1, _LIT0
    str r4, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r0, r9
    mov r1, r8
    mov r2, r7
    sub r3, r6, #0x1
    bl func_02004ed8
    mov r0, r9
    mov r1, #0x2
    mov r2, #0x0
    bl func_02001ed4
    add r0, r5, #0x1
    stmia sp, {r0, r4}
    ldr r1, _LIT0
    mov r0, r9
    str r1, [sp, #0x8]
    mov r1, r8
    mov r2, r7
    sub r3, r6, #0x1
    bl func_02004ed8
    mov r1, #0x1
    mov r0, r9
    mov r2, r1
    bl func_02001ed4
    str r5, [sp]
    str r4, [sp, #0x4]
    ldr r4, _LIT1
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str r4, [sp, #0x8]
    bl func_02004ed8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word func_02003c48
_LIT1: .word func_02003aa0
