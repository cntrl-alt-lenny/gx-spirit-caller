; func_0207b320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_02094500
        .global func_0207b320
        .arm
func_0207b320:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    bne .L_20c
    ldr r1, _LIT0
    mov r3, #0x3
    ldr r0, [r1]
    mov r2, #0x0
    add r0, r0, #0x2000
    str r3, [r0, #0x26c]
    ldr r0, [r1]
    add r0, r0, #0x2000
    str r2, [r0, #0x270]
    ldr r0, [r1]
    add r0, r0, #0x2000
    str r2, [r0, #0x274]
    ldr r0, [r1]
    add r0, r0, #0x2000
    str r2, [r0, #0x278]
    b .L_2c8
.L_20c:
    ldr r1, _LIT0
    ldr r2, [r5]
    ldr r0, [r1]
    and r2, r2, #0x3
    add r0, r0, #0x2000
    str r2, [r0, #0x26c]
    ldr r3, [r5, #0x4]
    ldr r0, [r5, #0x8]
    and r2, r3, #0x3
    rsb r2, r2, #0x4
    and r2, r2, #0x3
    add r2, r2, #0xc
    cmp r2, r0
    bls .L_264
    ldr r0, [r1]
    mov r2, #0x0
    add r0, r0, #0x2000
    str r2, [r0, #0x270]
    ldr r0, [r1]
    add r0, r0, #0x2000
    str r2, [r0, #0x274]
    b .L_2b4
.L_264:
    ldr r0, [r1]
    add r2, r3, #0x3
    bic r2, r2, #0x3
    add r0, r0, #0x2000
    str r2, [r0, #0x270]
    ldr r2, [r5, #0x4]
    ldr r0, [r1]
    and r2, r2, #0x3
    rsb r2, r2, #0x4
    ldr r3, [r5, #0x8]
    and r2, r2, #0x3
    sub r2, r3, r2
    add r0, r0, #0x2000
    str r2, [r0, #0x274]
    ldr r0, [r1]
    mov r1, #0x0
    add r2, r0, #0x2000
    ldr r0, [r2, #0x270]
    ldr r2, [r2, #0x274]
    bl func_02094500
.L_2b4:
    ldr r0, _LIT0
    ldr r1, [r5, #0xc]
    ldr r0, [r0]
    add r0, r0, #0x2000
    str r1, [r0, #0x278]
.L_2c8:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    str r4, [r0, #0x27c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a07ac
