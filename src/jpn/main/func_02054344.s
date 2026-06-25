; func_02054344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa9c
        .extern data_020ffaa0
        .extern func_02053c34
        .extern func_020a6c60
        .global func_02054344
        .arm
func_02054344:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r6, r1
    mov r7, r0
    mov r5, r2
    bne .L_ac
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xb6
    bl func_020a6c60
.L_ac:
    ldr r0, [r7, #0x4]
    mov r4, #0x0
    cmp r0, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r4, r5, r6, r7, pc}
.L_c0:
    ldr r0, [r7]
    mov r1, r6
    ldr r0, [r0, r4, lsl #0x2]
    mov r2, r5
    bl func_02053c34
    ldr r0, [r7, #0x4]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_c0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffa9c
_LIT1: .word data_020ffaa0
