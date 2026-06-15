; func_0206e284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecd8
        .extern func_0206ef0c
        .extern func_02071010
        .extern func_02071028
        .extern func_020945f4
        .global func_0206e284
        .arm
func_0206e284:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x64
    movs r4, r0
    addeq sp, sp, #0x64
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, _LIT0
    mov r0, #0xfd0
    ldr r1, [r1]
    ldr r1, [r1, #0x18]
    blx r1
    movs r5, r0
    addeq sp, sp, #0x64
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x64
    bl func_020945f4
    ldr r3, _LIT1
    ldr r1, _LIT2
    add r2, r5, r3
    add r0, sp, #0x0
    str r5, [sp, #0x40]
    str r3, [sp, #0x3c]
    str r2, [sp, #0x4c]
    str r1, [sp, #0x48]
    bl func_02071028
    mov r0, r4
    bl func_0206ef0c
    mov r4, r0
    bl func_02071010
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1]
    ldr r1, [r1, #0x1c]
    blx r1
    mov r0, r4
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ecd8
_LIT1: .word 0x00000b68
_LIT2: .word 0x00000466
