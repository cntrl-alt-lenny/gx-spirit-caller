; func_0206b8f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf4
        .extern func_02068970
        .extern func_020b1b88
        .extern func_020b22ac
        .extern func_020b2b74
        .extern func_020b2bd0
        .global func_0206b8f8
        .arm
func_0206b8f8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r2, #0x0
    ldr r3, [r3]
    ldr r5, [r1]
    ldr r0, [r0]
    ldr r1, [r3, #0x498]
    mov r3, r2
    bl func_02068970
    ldr r3, _LIT0
    mov r2, #0x0
    mov r4, r0
    ldr r0, [r3]
    mov r6, r1
    ldr r1, [r0, #0x498]
    mov r0, r5
    mov r3, r2
    bl func_02068970
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, r6
    bl func_020b22ac
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2]
    mov r5, r1
    ldr r0, [r0, #0x49c]
    cmp r0, #0x0
    bne .L_94
    mov r0, #0x0
    mov r1, r0
    mov r2, r4
    mov r3, r5
    bl func_020b22ac
    mov r4, r0
    mov r5, r1
.L_94:
    mov r0, r4
    mov r1, r5
    bl func_020b1b88
    mov r1, #0x0
    bl func_020b2b74
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r5
    bl func_020b1b88
    mov r1, #0x0
    bl func_020b2bd0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219ebf4
