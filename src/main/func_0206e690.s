; func_0206e690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e94
        .extern func_0206e670
        .extern func_0209150c
        .extern func_02094688
        .global func_0206e690
        .arm
func_0206e690:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    cmp r0, #0x2
    mov r4, r2
    addne sp, sp, #0x18
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    cmp r3, #0x10
    addcc sp, sp, #0x18
    movcc r0, #0x0
    ldmccia sp!, {r4, lr}
    bxcc lr
    mov r0, r1
    add r1, sp, #0xc
    mov r2, #0x4
    bl func_02094688
    ldr r0, [sp, #0xc]
    add r1, sp, #0x10
    bl func_0206e670
    ldrb r1, [sp, #0x12]
    ldr r2, _LIT0
    mov r0, r4
    str r1, [sp]
    ldrb r3, [sp, #0x11]
    mov r1, #0x10
    str r3, [sp, #0x4]
    ldrb r3, [sp, #0x10]
    str r3, [sp, #0x8]
    ldrb r3, [sp, #0x13]
    bl func_0209150c
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_02101e94
