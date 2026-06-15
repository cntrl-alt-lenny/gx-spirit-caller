; func_02052bd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02000b60
        .extern func_020448d8
        .extern func_02044c10
        .extern func_02044ea8
        .global func_02052bd4
        .arm
func_02052bd4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, _LIT0
    mov r4, #0x0
    bl func_02000b60
    mov r0, r6
    bl func_020448d8
    mov r5, r0
    bl func_02044c10
    cmp r0, #0x0
    beq .L_38
    mov r0, r6
    bl func_02044ea8
    mov r4, #0x1
.L_38:
    cmp r5, #0x0
    bge .L_50
    cmp r4, #0x0
    movne r0, #0x2
    moveq r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_50:
    cmp r4, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x02000b8c
