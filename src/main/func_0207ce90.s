; func_0207ce90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08bc
        .extern data_021a08c0
        .extern func_020b3870
        .global func_0207ce90
        .arm
func_0207ce90:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0x0
    ldrb r1, [r1]
    cmp r1, #0x10
    bls .L_2fc
    ldr r2, _LIT1
    mov r3, r0
.L_2d4:
    ldrb r1, [r2]
    add r3, r3, #0x1
    cmp r3, #0x10
    add r0, r0, r1
    add r2, r2, #0x1
    blt .L_2d4
    mov r1, r0, asr #0x3
    add r0, r0, r1, lsr #0x1c
    mov r0, r0, asr #0x4
    b .L_330
.L_2fc:
    cmp r1, #0x0
    beq .L_330
    mov r3, r0
    cmp r1, #0x0
    ble .L_32c
    ldr ip, _LIT1
.L_314:
    ldrb r2, [ip]
    add r3, r3, #0x1
    cmp r3, r1
    add r0, r0, r2
    add ip, ip, #0x1
    blt .L_314
.L_32c:
    bl func_020b3870
.L_330:
    and r0, r0, #0xff
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a08bc
_LIT1: .word data_021a08c0
