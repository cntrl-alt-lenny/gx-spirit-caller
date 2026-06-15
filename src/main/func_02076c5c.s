; func_02076c5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101ec4
        .extern func_02076cc0
        .global func_02076c5c
        .arm
func_02076c5c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, #0x0
    ldr r4, _LIT0
.L_18:
    mov r0, r5, lsl #0x1
    ldrh r3, [r4, r0]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_02076cc0
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, r5, lsl #0x1
    ldrneh r0, [r0, r1]
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r5, r5, #0x1
    cmp r5, #0x2
    bcc .L_18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_02101ec4
