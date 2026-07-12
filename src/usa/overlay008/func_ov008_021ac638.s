; func_ov008_021ac638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .extern func_ov008_021ab3a4
        .global func_ov008_021ac638
        .arm
func_ov008_021ac638:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov r4, r3
    add r3, r4, #0x19
    str r3, [sp]
    mov r3, #0x2
    mov r9, r2
    str r3, [sp, #0x4]
    mov r3, #0x400
    mov r2, #0x0
    str r3, [sp, #0x8]
    mov r3, r2
    mov sl, r0
    mov r5, r1
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    add r1, r5, #0x1
    mov r0, #0xa
    mul r0, r4, r0
    add r0, r0, #0x42
    ldr r5, _LIT0
    add sl, sl, #0xf
    and r7, r1, #0xff
    add r8, r0, #0x200
    mov r6, #0x2
    mov fp, #0x0
    mov r4, #0xa
.L_12c:
    smull r1, r2, r5, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    mov r1, sl, lsl #0x17
    orr r1, r7, r1, lsr #0x7
    sub r2, r9, r0
    str r1, [sp, #0x10]
    add r1, r2, r8
    strh r1, [sp, #0x14]
    mov r0, r6
    mov r1, fp
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x10
    mov r2, #0x8
    bl func_020943b0
    mov r1, r9
    smull r0, r9, r5, r1
    mov r0, r1, lsr #0x1f
    add r9, r0, r9, asr #0x2
    cmp r9, #0x0
    sub sl, sl, #0x5
    bgt .L_12c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
