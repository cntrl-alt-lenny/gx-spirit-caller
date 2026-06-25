; func_0200f290 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_0200f290
        .arm
func_0200f290:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    movs sl, r0
    ldrne r0, [sl, #0x90]
    str r1, [sp]
    mov r9, r2
    str r3, [sp, #0x4]
    cmpne r0, #0x0
    beq .L_1f8
    ldr r0, [r0]
    mov r5, #0x0
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bls .L_1ec
    str r5, [sp, #0x8]
.L_3c:
    ldr r0, [sp, #0x4]
    ldr r2, [sl, #0x94]
    cmp r0, #0x0
    ldr r0, [sp, #0x8]
    ldr r1, [r2, r0]
    add r7, r2, r0
    bic r0, r1, #0x1
    orr r1, r0, #0x1
    ldr r0, [sp, #0x8]
    str r1, [r2, r0]
    blt .L_80
    ldr r1, [r7]
    ldr r0, [sp, #0x4]
    bic r1, r1, #0x20
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1a
    str r0, [r7]
.L_80:
    ldr r0, [sp]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_1d0
    b .L_b0
    b .L_17c
    b .L_194
    b .L_1ac
    b .L_1c0
    b .L_150
    b .L_b4
    b .L_16c
.L_b0:
    mov r9, #0x0
.L_b4:
    ldr r4, _LIT0
    add r8, r7, #0x4
    add r0, r4, #0x100000
    mov r6, #0x0
    mov fp, r9, lsl #0x16
    str r0, [sp, #0x10]
.L_cc:
    ldr r0, [sl, #0x90]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, r5, lsl #0x2]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, r6, lsl #0x2]
    ldrh r1, [r0, #0x2]
    ldrh r0, [r0]
    cmp r1, #0x0
    ble .L_130
    mul r0, r1, r0
    cmp r9, r0
    bge .L_130
    ldr r2, [r8]
    mov r0, r9
    and r2, r2, r4
    orr r2, r2, fp, lsr #0xc
    str r2, [r8]
    bl func_020b377c
    ldr r1, [sp, #0x10]
    and r0, r0, r1
    ldr r1, [r8]
    and r1, r1, r4, asr #0xa
    orr r0, r1, r0
    str r0, [r8]
    b .L_140
.L_130:
    ldr r0, [r8]
    and r0, r0, r4
    and r0, r0, r4, asr #0xa
    str r0, [r8]
.L_140:
    add r6, r6, #0x1
    cmp r6, #0xd
    add r8, r8, #0x4
    blt .L_cc
.L_150:
    ldr r0, [r7]
    bic r0, r0, #0x2
    bic r1, r0, #0x4
    bic r0, r1, #0x8
    bic r0, r0, #0x10
    str r0, [r7]
    b .L_1d0
.L_16c:
    ldr r0, [r7]
    bic r0, r0, #0x40
    str r0, [r7]
    b .L_1d0
.L_17c:
    ldr r0, [r7]
    orr r1, r0, #0x2
    bic r0, r1, #0x4
    bic r0, r0, #0x10
    str r0, [r7]
    b .L_1d0
.L_194:
    ldr r0, [r7]
    orr r1, r0, #0x4
    bic r0, r1, #0x2
    bic r0, r0, #0x8
    str r0, [r7]
    b .L_1d0
.L_1ac:
    ldr r0, [r7]
    orr r0, r0, #0x8
    bic r0, r0, #0x4
    str r0, [r7]
    b .L_1d0
.L_1c0:
    ldr r0, [r7]
    orr r0, r0, #0x10
    bic r0, r0, #0x2
    str r0, [r7]
.L_1d0:
    ldr r0, [sp, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    ldr r0, [sp, #0x8]
    add r0, r0, #0x38
    str r0, [sp, #0x8]
    bcc .L_3c
.L_1ec:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xfff003ff
