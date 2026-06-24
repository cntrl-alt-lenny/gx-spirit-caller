; func_0206015c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021011a0
        .extern data_021011b4
        .extern data_021011ec
        .extern data_02101204
        .extern func_02054fbc
        .extern func_02058560
        .extern func_0205ff60
        .extern func_02060430
        .global func_0206015c
        .arm
func_0206015c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov ip, #0x0
    mov r4, r2
    mov r5, r0
    mov r0, r1
    add r2, sp, #0x0
    add r3, sp, #0x4
    mov r1, ip
    str ip, [sp]
    str ip, [sp, #0x4]
    bl func_02054fbc
    mvn r1, #0x0
    cmp r0, r1
    bne .L_244
    ldr r1, _LIT0
    mov r0, r5
    bl func_02060430
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_244:
    cmp r0, #0x0
    ble .L_2a4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_278
    ldr r1, _LIT2
    mov r0, r5
    bl func_02060430
    mov r0, #0x4
    str r0, [r4]
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_278:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_2a4
    ldr r1, _LIT3
    mov r0, r5
    bl func_02060430
    mov r0, #0x3
    str r0, [r4]
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_2a4:
    mov r0, #0x0
    str r0, [r4]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021011a0
_LIT1: .word data_021011b4
_LIT2: .word data_021011ec
_LIT3: .word data_02101204
