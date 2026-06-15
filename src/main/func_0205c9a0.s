; func_0205c9a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b54
        .extern data_02100b64
        .extern data_02100c68
        .extern data_02100c6c
        .extern func_02053e58
        .extern func_020540d0
        .extern func_02054140
        .extern func_02056c34
        .extern func_0205cab4
        .extern func_020604a4
        .extern func_020a6d54
        .global func_0205c9a0
        .arm
func_0205c9a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    movs r4, r1
    ldr r6, [r5]
    bne .L_1d4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_1d4:
    ldr r1, [r6, #0x434]
    cmp r1, r4
    ldreq r0, [r4, #0x3c]
    streq r0, [r6, #0x434]
    beq .L_238
    ldr r0, [r1, #0x3c]
    cmp r0, r4
    beq .L_230
.L_1f4:
    cmp r0, #0x0
    bne .L_220
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
    ldr r1, _LIT5
    mov r0, r5
    bl func_020604a4
    ldmia sp!, {r4, r5, r6, pc}
.L_220:
    mov r1, r0
    ldr r0, [r0, #0x3c]
    cmp r0, r4
    bne .L_1f4
.L_230:
    ldr r0, [r4, #0x3c]
    str r0, [r1, #0x3c]
.L_238:
    ldr r0, [r4, #0x38]
    bl func_02054140
    cmp r0, #0x0
    beq .L_298
    mov r6, #0x0
.L_24c:
    ldr r0, [r4, #0x38]
    mov r1, r6
    bl func_020540d0
    ldr r2, [r0, #0x10]
    cmp r2, #0x64
    bge .L_27c
    ldr ip, [r0]
    ldr r3, [r0, #0x14]
    ldr r1, [r4, #0xc]
    mov r0, r5
    add r3, ip, r3
    bl func_02056c34
.L_27c:
    ldr r0, [r4, #0x38]
    mov r1, r6
    bl func_02053e58
    ldr r0, [r4, #0x38]
    bl func_02054140
    cmp r0, #0x0
    bne .L_24c
.L_298:
    mov r0, r5
    mov r1, r4
    bl func_0205cab4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100b54
_LIT1: .word data_02100b64
_LIT2: .word 0x00000213
_LIT3: .word data_02100c68
_LIT4: .word 0x00000225
_LIT5: .word data_02100c6c
