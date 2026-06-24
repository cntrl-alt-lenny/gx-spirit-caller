; func_020a2afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097db0
        .extern func_02097e1c
        .global func_020a2afc
        .arm
func_020a2afc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x64
    mov r6, #0x0
    movs r7, r0
    mov r5, r6
    beq .L_dd4
    ldr ip, [r7, #0x2c]
    ldr r3, [r7, #0x24]
    add r1, sp, #0x0
    mov r2, #0x60
    sub r4, ip, r3
    bl func_02097e1c
    cmp r0, #0x60
    mov r0, r7
    mov r1, r4
    mov r2, #0x0
    addcs r6, sp, #0x0
    bl func_02097db0
    b .L_dd8
.L_dd4:
    ldr r6, _LIT0
.L_dd8:
    cmp r6, #0x0
    beq .L_df8
    ldr r1, [r6, #0x2c]
    ldr r0, [r6, #0x3c]
    add r1, r1, #0x268
    add r5, r1, r0
    cmp r5, #0x10000
    movcc r5, #0x10000
.L_df8:
    mov r0, r5
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x027ffe00
