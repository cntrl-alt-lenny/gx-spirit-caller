; func_ov008_021ac578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov008_021ac578
        .arm
func_ov008_021ac578:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, #0xa
    ldr r6, _LIT0
    mov sl, r0
    mov r9, r2
    and r7, r1, #0xff
    mov fp, #0x2
    mov r5, r4
.L_24:
    smull r1, r8, r6, r9
    mov r0, r9, lsr #0x1f
    add r8, r0, r8, asr #0x2
    smull r0, r1, r5, r8
    mov r1, sl, lsl #0x17
    sub r8, r9, r0
    orr r1, r7, r1, lsr #0x7
    add r0, r8, #0x260
    str r1, [sp]
    strh r0, [sp, #0x4]
    mov r0, fp
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020943b0
    mov r1, r9
    mov r0, r1, lsr #0x1f
    smull r1, r9, r6, r1
    add r9, r0, r9, asr #0x2
    cmp r8, #0x4
    subeq sl, sl, #0x1
    smull r1, r2, r6, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, r9, r0
    sub sl, sl, #0x6
    cmp r2, #0x4
    subeq sl, sl, #0x1
    beq .L_ac
    cmp r2, #0x1
    addeq sl, sl, #0x1
.L_ac:
    cmp r9, #0x0
    bgt .L_24
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
