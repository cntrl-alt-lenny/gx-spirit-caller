; func_02005298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_02001ef4
        .extern func_02003400
        .extern func_02004ef4
        .global func_02005298
        .arm
func_02005298:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r4, [r8, #0x24]
    mov r7, r1
    orr r1, r4, #0x10000
    mov lr, r4, lsl #0x7
    mov ip, r4, lsl #0xb
    ldr r4, _LIT0
    str r1, [r8, #0x24]
    mov r5, #0x1
    mov r1, #0x0
    mov r6, r2
    mov r2, r1
    str r5, [r4, #0x10]
    mov lr, lr, lsr #0x1c
    mov r5, r3
    str lr, [r4, #0x4]
    mov r4, ip, lsr #0x1c
    bl func_02001ef4
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    add r1, r1, #0x1
    str r1, [sp]
    ldr r1, _LIT1
    str r0, [sp, #0x4]
    mov r0, r8
    str r1, [sp, #0x8]
    mov r1, r7
    mov r2, r6
    add r3, r5, #0x1
    bl func_02004ef4
    mov r2, #0x0
    ldr r1, _LIT0
    mov r0, r8
    str r2, [r1, #0x10]
    str r4, [r1, #0x8]
    mov r1, #0x1
    mov r2, r1
    bl func_02001ef4
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    ldr r5, [sp, #0x28]
    ldr r4, [sp, #0x2c]
    str r5, [sp]
    str r4, [sp, #0x4]
    ldr r4, _LIT1
    str r4, [sp, #0x8]
    bl func_02004ef4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02102c7c
_LIT1: .word func_02003400
