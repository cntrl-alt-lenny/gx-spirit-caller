; func_02005358 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02001ed4
        .extern func_020033e0
        .extern func_020035c8
        .extern func_02004ed8
        .global func_02005358
        .arm
func_02005358:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r4, [r8, #0x24]
    mov r7, r1
    orr r1, r4, #0x10000
    mov r5, r4, lsl #0x7
    str r1, [r8, #0x24]
    mov ip, r4, lsl #0xb
    mov sl, r5, lsr #0x1c
    mov r6, r2
    ldr r9, _LIT0
    mov r1, #0x1
    str r1, [r9, #0x10]
    str sl, [r9, #0x4]
    ldr r4, [sp, #0x30]
    mov r2, #0x2
    ldr sl, [sp, #0x34]
    mov r5, r3
    mov r9, ip, lsr #0x1c
    bl func_02001ed4
    sub r0, r4, #0x1
    stmia sp, {r0, sl}
    ldr r1, _LIT1
    mov r0, r8
    str r1, [sp, #0x8]
    mov r1, r7
    mov r2, r6
    sub r3, r5, #0x1
    bl func_02004ed8
    mov r1, #0x1
    mov r0, r8
    mov r2, r1
    bl func_02001ed4
    stmia sp, {r4, sl}
    ldr r1, _LIT1
    mov r0, r8
    str r1, [sp, #0x8]
    mov r1, r7
    mov r2, r6
    sub r3, r5, #0x1
    bl func_02004ed8
    mov r0, r8
    mov r1, #0x2
    mov r2, #0x1
    bl func_02001ed4
    add r0, r4, #0x1
    stmia sp, {r0, sl}
    ldr r1, _LIT1
    mov r0, r8
    str r1, [sp, #0x8]
    mov r1, r7
    mov r2, r6
    sub r3, r5, #0x1
    bl func_02004ed8
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x10]
    str r9, [r1, #0x8]
    mov r1, #0x2
    mov r0, r8
    mov r2, r1
    bl func_02001ed4
    stmia sp, {r4, sl}
    ldr r4, _LIT2
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x8]
    bl func_02004ed8
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02102b9c
_LIT1: .word func_020035c8
_LIT2: .word func_020033e0
