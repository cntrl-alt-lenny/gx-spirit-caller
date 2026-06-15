; func_020601d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101280
        .extern data_02101294
        .extern data_021012cc
        .extern data_021012e4
        .extern func_02055030
        .extern func_020585d4
        .extern func_0205ffd4
        .extern func_020604a4
        .global func_020601d0
        .arm
func_020601d0:
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
    bl func_02055030
    mvn r1, #0x0
    cmp r0, r1
    bne .L_244
    ldr r1, _LIT0
    mov r0, r5
    bl func_020604a4
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
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
    bl func_020604a4
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
    bl func_020604a4
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
_LIT0: .word data_02101280
_LIT1: .word data_02101294
_LIT2: .word data_021012cc
_LIT3: .word data_021012e4
