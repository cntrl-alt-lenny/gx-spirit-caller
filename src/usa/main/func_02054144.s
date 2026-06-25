; func_02054144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa24
        .extern data_020ffa7c
        .extern data_020ffa84
        .extern data_020ffa90
        .extern func_02045398
        .extern func_020a6c60
        .global func_02054144
        .arm
func_02054144:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x18
    mov r6, r1
    mov r5, r2
    bl func_02045398
    movs r4, r0
    bne .L_38
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x52
    bl func_020a6c60
.L_38:
    cmp r7, #0x0
    bne .L_54
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x53
    bl func_020a6c60
.L_54:
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
    beq .L_b4
    ldr r0, [r4, #0x8]
    mul r0, r1, r0
    bl func_02045398
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    bne .L_b8
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x5e
    bl func_020a6c60
    b .L_b8
.L_b4:
    str r0, [r4, #0x14]
.L_b8:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffa7c
_LIT1: .word data_020ffa24
_LIT2: .word data_020ffa84
_LIT3: .word data_020ffa90
