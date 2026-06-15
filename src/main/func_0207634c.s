; func_0207634c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101f18
        .extern data_02101f20
        .extern func_02078498
        .extern func_0207850c
        .extern func_020785cc
        .extern func_020945f4
        .global func_0207634c
        .arm
func_0207634c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldrb r0, [r6, #0x454]
    mov r5, r1
    add r4, r6, #0x2ec
    eors r0, r0, r2
    beq .L_120
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_0207850c
    b .L_130
.L_120:
    ldr r1, _LIT1
    mov r0, r4
    mov r2, #0x4
    bl func_0207850c
.L_130:
    mov r0, r4
    mov r1, r6
    mov r2, #0x30
    bl func_0207850c
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x28
    bl func_020945f4
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x28
    bl func_0207850c
    mov r0, r4
    mov r1, r5
    bl func_02078498
    mov r0, r4
    bl func_020785cc
    mov r1, r6
    mov r0, r4
    mov r2, #0x30
    bl func_0207850c
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x28
    bl func_020945f4
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_0207850c
    mov r0, r4
    mov r1, r5
    mov r2, #0x14
    bl func_0207850c
    mov r0, r4
    mov r1, r5
    bl func_02078498
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101f18
_LIT1: .word data_02101f20
