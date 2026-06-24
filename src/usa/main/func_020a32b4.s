; func_020a32b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020943b0
        .global func_020a32b4
        .arm
func_020a32b4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r6, r0
    mov r5, r2
    mov r0, r1
    ldr r2, _LIT1
    add r1, r6, r4
    mov r4, r3
    mov r7, #0x1
    bl func_020943b0
    mov r2, #0x0
    mov r1, #0x2
.L_34:
    mov r0, r1, lsl r2
    ands r0, r5, r0
    addne r0, r7, #0x1
    add r2, r2, #0x1
    andne r7, r0, #0xff
    cmp r2, #0xf
    blt .L_34
    strb r7, [r6, #0x358]
    orr r1, r5, #0x1
    add r0, r6, #0x300
    strh r1, [r0, #0x5a]
    strh r4, [r0, #0x5c]
    ldrb r0, [r6, #0x4b4]
    add r0, r0, #0x1
    strb r0, [r6, #0x4b4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x0000035e
_LIT1: .word 0x0000014a
