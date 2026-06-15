; func_020581a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000b8
        .extern data_021000d0
        .extern data_02100154
        .extern func_020453cc
        .extern func_0205ffc0
        .extern func_020a6d54
        .global func_020581a8
        .arm
func_020581a8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r1
    mov r8, r0
    mov r7, r2
    bne .L_130
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x25
    bl func_020a6d54
.L_130:
    ldr r6, [r4, #0x8]
    ldr r5, [r4, #0x4]
    ldr r0, [r4]
    cmp r5, r6
    bne .L_16c
    add r5, r5, #0x800
    add r1, r5, #0x1
    bl func_020453cc
    cmp r0, #0x0
    bne .L_16c
    ldr r1, _LIT2
    mov r0, r8
    bl func_0205ffc0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_16c:
    strb r7, [r0, r6]
    add r1, r6, #0x1
    mov r2, #0x0
    strb r2, [r0, r1]
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    str r5, [r4, #0x4]
    str r0, [r4]
    mov r0, r2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021000b8
_LIT1: .word data_021000d0
_LIT2: .word data_02100154
