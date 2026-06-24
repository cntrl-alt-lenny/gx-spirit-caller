; func_020527fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046a58
        .extern func_02052870
        .global func_020527fc
        .arm
func_020527fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r8, #0x0
    mov r7, #0x1
.L_1c:
    cmp r8, #0x0
    movne r9, r7, lsl r8
    moveq r9, r7
    ands r0, r6, r9
    beq .L_58
    bl func_02046a58
    cmp r8, r0
    beq .L_58
    mov r0, r8
    mov r1, r5
    mov r2, r4
    bl func_02052870
    cmp r0, #0x0
    mvneq r0, r9
    andeq r6, r6, r0
.L_58:
    add r0, r8, #0x1
    and r8, r0, #0xff
    cmp r8, #0x20
    bcc .L_1c
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
