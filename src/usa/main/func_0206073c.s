; func_0206073c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210129c
        .extern data_021012a8
        .extern data_021012b4
        .extern data_021012c0
        .extern func_02060840
        .extern func_020608e4
        .extern func_020609c8
        .extern func_02060a60
        .extern func_020aaf60
        .global func_0206073c
        .arm
func_0206073c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    ldr r1, _LIT0
    mov r5, r0
    mov r3, #0x0
    mov r2, #0x8
    strb r3, [r5, r4]
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_40
    mov r0, r5
    mov r1, r4
    bl func_02060a60
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_40:
    ldr r1, _LIT1
    mov r0, r5
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_6c
    mov r0, r5
    mov r1, r4
    bl func_020609c8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_6c:
    ldr r1, _LIT1
    mov r0, r5
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_98
    mov r0, r5
    mov r1, r4
    bl func_020609c8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_98:
    ldr r1, _LIT2
    mov r0, r5
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_c4
    mov r0, r5
    mov r1, r4
    bl func_020608e4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_c4:
    ldr r1, _LIT3
    mov r0, r5
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_02060840
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0210129c
_LIT1: .word data_021012a8
_LIT2: .word data_021012b4
_LIT3: .word data_021012c0
