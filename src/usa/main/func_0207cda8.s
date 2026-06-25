; func_0207cda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07dc
        .extern data_021a07e0
        .extern func_020b377c
        .global func_0207cda8
        .arm
func_0207cda8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0x0
    ldrb r1, [r1]
    cmp r1, #0x10
    bls .L_4c
    ldr r2, _LIT1
    mov r3, r0
.L_24:
    ldrb r1, [r2]
    add r3, r3, #0x1
    cmp r3, #0x10
    add r0, r0, r1
    add r2, r2, #0x1
    blt .L_24
    mov r1, r0, asr #0x3
    add r0, r0, r1, lsr #0x1c
    mov r0, r0, asr #0x4
    b .L_80
.L_4c:
    cmp r1, #0x0
    beq .L_80
    mov r3, r0
    cmp r1, #0x0
    ble .L_7c
    ldr ip, _LIT1
.L_64:
    ldrb r2, [ip]
    add r3, r3, #0x1
    cmp r3, r1
    add r0, r0, r2
    add ip, ip, #0x1
    blt .L_64
.L_7c:
    bl func_020b377c
.L_80:
    and r0, r0, #0xff
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a07dc
_LIT1: .word data_021a07e0
