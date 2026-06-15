; func_0205febc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021011ec
        .extern data_021011f4
        .extern data_02101224
        .extern func_020453e8
        .extern func_02058528
        .extern func_020585d4
        .extern func_0205bd58
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020603cc
        .extern func_020ab054
        .global func_0205febc
        .arm
func_0205febc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r2
    mov r5, r1
    mov r1, r4
    mov r2, #0x1
    mov r6, r0
    bl func_020603cc
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_020ab054
    cmp r0, #0x0
    beq .L_24e8
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_24e8:
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    beq .L_2554
    mov r0, #0x4
    bl func_020453e8
    movs r3, r0
    bne .L_2528
    ldr r1, _LIT2
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2528:
    mov r0, #0x0
    str r0, [r3]
    str r5, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r6
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
.L_2554:
    mov r0, r6
    mov r1, r5
    bl func_0205bd58
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021011ec
_LIT1: .word data_021011f4
_LIT2: .word data_02101224
