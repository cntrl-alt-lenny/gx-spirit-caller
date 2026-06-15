; func_020541b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb5c
        .extern data_020ffb64
        .extern data_020ffb70
        .extern func_020453e8
        .extern func_020a6d54
        .global func_020541b8
        .arm
func_020541b8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x18
    mov r6, r1
    mov r5, r2
    bl func_020453e8
    movs r4, r0
    bne .L_a8
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x52
    bl func_020a6d54
.L_a8:
    cmp r7, #0x0
    bne .L_c4
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x53
    bl func_020a6d54
.L_c4:
    mov r0, #0x0
    cmp r6, #0x0
    moveq r6, #0x8
    str r0, [r4]
    str r6, [r4, #0x4]
    str r7, [r4, #0x8]
    str r6, [r4, #0xc]
    str r5, [r4, #0x10]
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_124
    ldr r0, [r4, #0x8]
    mul r0, r1, r0
    bl func_020453e8
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    bne .L_128
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x5e
    bl func_020a6d54
    b .L_128
.L_124:
    str r0, [r4, #0x14]
.L_128:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffb5c
_LIT1: .word data_020ffb04
_LIT2: .word data_020ffb64
_LIT3: .word data_020ffb70
