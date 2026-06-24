; func_02052ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_020466ac
        .extern func_02046964
        .extern func_02051ea8
        .extern func_020522dc
        .extern func_02052690
        .global func_02052ac0
        .arm
func_02052ac0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r5, r1
    bl func_02045230
    cmp r0, #0x0
    bne .L_44
    cmp r5, #0x1
    bne .L_34
    mov r0, r4
    bl func_02046964
    cmp r0, #0x0
    beq .L_44
.L_34:
    mov r0, r4
    bl func_020466ac
    cmp r0, #0x0
    bne .L_50
.L_44:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_50:
    mov r0, r4
    bl func_020522dc
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_02051ea8
    mov r4, r0
    mov r0, r5
    bl func_02052690
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
