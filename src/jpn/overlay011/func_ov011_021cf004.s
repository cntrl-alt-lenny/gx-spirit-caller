; func_ov011_021cf004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f5c
        .extern func_0208be54
        .extern func_ov011_021cc18c
        .extern func_ov011_021cdab8
        .extern func_ov011_021d0eec
        .global func_ov011_021cf004
        .arm
func_ov011_021cf004:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r7, _LIT0
    bl func_ov011_021cdab8
    cmp r0, #0x0
    beq .L_10c
    ldr r0, [r7, #0x270]
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1e
    beq .L_10c
    ldr r1, [r7, #0x214]
    ldr r2, [r7, #0x218]
    add r0, sp, #0x0
    mov r8, #0x0
    .word 0xebff91b2
    ldr r9, [sp]
    ldr sl, [sp, #0x4]
    mov r6, #0x1000
    mov fp, r8
    mov r5, r8
    mov r4, #0x800
    b .L_cc
.L_58:
    ldr r0, [r7, #0x218]
    ldr r1, [r7, #0x214]
    add r0, r0, #0x8
    str r0, [r7, #0x218]
    cmp r0, #0x1000
    strgt r6, [r7, #0x218]
    ldr r2, [r7, #0x218]
    add r0, sp, #0x0
    .word 0xebff91a2
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    sub r1, r9, r1
    sub r0, sl, r0
    smull r9, r3, r1, r1
    smull r2, r1, r0, r0
    mov r0, #0x800
    adds r9, r9, r0
    adc r0, r3, fp
    mov r3, r9, lsr #0xc
    adds r2, r2, r4
    orr r3, r3, r0, lsl #0x14
    adc r0, r1, r5
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_0208be54
    ldr r9, [sp]
    ldr sl, [sp, #0x4]
    add r8, r8, r0
.L_cc:
    cmp r8, #0x2000
    ldrlt r0, [r7, #0x218]
    cmplt r0, #0x1000
    blt .L_58
    ldr r1, [sp]
    ldr r2, [sp, #0x4]
    ldr r0, [r7, #0x218]
    str r1, [r7, #0x21c]
    str r2, [r7, #0x220]
    cmp r0, #0x1000
    blt .L_114
    ldr r0, [r7, #0x270]
    bic r0, r0, #0xc0000
    orr r0, r0, #0x80000
    str r0, [r7, #0x270]
    b .L_114
.L_10c:
    ldr r1, [r7, #0x21c]
    ldr sl, [r7, #0x220]
.L_114:
    mov r2, sl
    mov r0, #0x0
    bl func_ov011_021d0eec
    bl func_ov011_021cc18c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d3f5c
