; func_0200f13c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f13c
        .arm
func_0200f13c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0x88]
    cmpne r4, #0x0
    beq .L_4e8
    ldr lr, [r4]
    mov ip, #0x0
    cmp lr, #0x0
    bls .L_4e0
    mov r5, ip
.L_3ac:
    ldr r7, [r0, #0x8c]
    cmp r3, #0x0
    ldr r6, [r7, r5]
    add r4, r7, r5
    bic r6, r6, #0x1
    orr r6, r6, #0x1
    str r6, [r7, r5]
    blt .L_3e0
    ldr r7, [r4]
    mov r6, r3, lsl #0x1f
    bic r7, r7, #0x20
    orr r6, r7, r6, lsr #0x1a
    str r6, [r4]
.L_3e0:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_4d0
    b .L_40c
    b .L_47c
    b .L_494
    b .L_4ac
    b .L_4c0
    b .L_450
    b .L_410
    b .L_46c
.L_40c:
    mov r2, #0x0
.L_410:
    mov r6, r2, lsl #0x10
    mov r9, #0x0
    mov r8, r6, asr #0x10
    mov r6, r9
.L_420:
    add r7, r4, r9, lsl #0x2
    strh r8, [r7, #0x4]
    add r9, r9, #0x1
    strh r6, [r7, #0x6]
    cmp r9, #0x5
    blt .L_420
    ldr r8, [r4]
    ldr r6, _LIT0
    mov r7, r2, lsl #0x10
    and r6, r8, r6
    orr r6, r6, r7, lsr #0xa
    str r6, [r4]
.L_450:
    ldr r6, [r4]
    bic r6, r6, #0x2
    bic r7, r6, #0x4
    bic r6, r7, #0x8
    bic r6, r6, #0x10
    str r6, [r4]
    b .L_4d0
.L_46c:
    ldr r6, [r4]
    bic r6, r6, #0x400000
    str r6, [r4]
    b .L_4d0
.L_47c:
    ldr r6, [r4]
    orr r7, r6, #0x2
    bic r6, r7, #0x4
    bic r6, r6, #0x10
    str r6, [r4]
    b .L_4d0
.L_494:
    ldr r6, [r4]
    orr r7, r6, #0x4
    bic r6, r7, #0x2
    bic r6, r6, #0x8
    str r6, [r4]
    b .L_4d0
.L_4ac:
    ldr r6, [r4]
    orr r6, r6, #0x8
    bic r6, r6, #0x4
    str r6, [r4]
    b .L_4d0
.L_4c0:
    ldr r6, [r4]
    orr r6, r6, #0x10
    bic r6, r6, #0x2
    str r6, [r4]
.L_4d0:
    add ip, ip, #0x1
    cmp ip, lr
    add r5, r5, #0x18
    bcc .L_3ac
.L_4e0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4e8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0xffc0003f
