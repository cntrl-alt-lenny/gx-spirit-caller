; func_ov010_021b3068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e2f4
        .global func_ov010_021b3068
        .arm
func_ov010_021b3068:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, #0x0
    cmp r2, #0xf
    movgt r2, #0xf
    mov r7, r5
    mov r6, #0x1c
    mvn fp, #0xf
.L_340:
    and sl, r6, #0xff
    orr sl, sl, #0x1c00
    mov r4, #0x0
    mov r8, fp
    mov r9, r1
    orr sl, sl, #-1073741824
.L_358:
    mov r3, r8, lsl #0x17
    orr ip, sl, r3, lsr #0x7
    ldr lr, [r0]
    add r3, r9, r7
    str ip, [lr]
    orr r3, r3, #0xc00
    orr r3, r3, r2, lsl #0xc
    strh r3, [lr, #0x4]
    ldr r3, [r0]
    add r8, r8, #0x40
    add r3, r3, #0x8
    str r3, [r0]
    add r9, r9, #0x8
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_358
    add r5, r5, #0x1
    cmp r5, #0x2
    add r6, r6, #0x40
    add r7, r7, #0x80
    blt .L_340
    cmp r2, #0xf
    bne .L_410
    ldr r6, _LIT0
    mov r4, #0x4000000
    ldrh r0, [r6]
    mov r1, #0x8
    ldr r3, _LIT1
    bic r0, r0, #0x3f
    orr r0, r0, #0x3f
    strh r0, [r6]
    ldrh r5, [r6, #0x2]
    ldr r2, _LIT2
    add r0, r4, #0x50
    bic r5, r5, #0x3f
    orr r5, r5, #0x1f
    strh r5, [r6, #0x2]
    strh r3, [r6, #-8]
    strh r2, [r6, #-4]
    ldr r3, [r4]
    sub r2, r1, #0x10
    bic r3, r3, #0xe000
    orr r3, r3, #0x2000
    str r3, [r4]
    bl func_0208e2f4
    b .L_454
.L_410:
    ldr r4, _LIT0
    mov r2, #0x0
    ldrh r3, [r4]
    mov r0, #0xc0
    mov r1, #0x4000000
    bic r3, r3, #0x3f
    orr r3, r3, #0x3f
    strh r3, [r4]
    ldrh r3, [r4, #0x2]
    bic r3, r3, #0x3f
    orr r3, r3, #0x3f
    strh r3, [r4, #0x2]
    strh r2, [r4, #-8]
    strh r0, [r4, #-4]
    ldr r0, [r1]
    bic r0, r0, #0xe000
    str r0, [r1]
.L_454:
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000048
_LIT1: .word 0x000060fb
_LIT2: .word 0x000018ae
