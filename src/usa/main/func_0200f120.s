; func_0200f120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f120
        .arm
func_0200f120:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0x88]
    cmpne r4, #0x0
    beq .L_164
    ldr lr, [r4]
    mov ip, #0x0
    cmp lr, #0x0
    bls .L_15c
    mov r5, ip
.L_28:
    ldr r7, [r0, #0x8c]
    cmp r3, #0x0
    ldr r6, [r7, r5]
    add r4, r7, r5
    bic r6, r6, #0x1
    orr r6, r6, #0x1
    str r6, [r7, r5]
    blt .L_5c
    ldr r7, [r4]
    mov r6, r3, lsl #0x1f
    bic r7, r7, #0x20
    orr r6, r7, r6, lsr #0x1a
    str r6, [r4]
.L_5c:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_14c
    b .L_88
    b .L_f8
    b .L_110
    b .L_128
    b .L_13c
    b .L_cc
    b .L_8c
    b .L_e8
.L_88:
    mov r2, #0x0
.L_8c:
    mov r6, r2, lsl #0x10
    mov r9, #0x0
    mov r8, r6, asr #0x10
    mov r6, r9
.L_9c:
    add r7, r4, r9, lsl #0x2
    strh r8, [r7, #0x4]
    add r9, r9, #0x1
    strh r6, [r7, #0x6]
    cmp r9, #0x5
    blt .L_9c
    ldr r8, [r4]
    ldr r6, _LIT0
    mov r7, r2, lsl #0x10
    and r6, r8, r6
    orr r6, r6, r7, lsr #0xa
    str r6, [r4]
.L_cc:
    ldr r6, [r4]
    bic r6, r6, #0x2
    bic r7, r6, #0x4
    bic r6, r7, #0x8
    bic r6, r6, #0x10
    str r6, [r4]
    b .L_14c
.L_e8:
    ldr r6, [r4]
    bic r6, r6, #0x400000
    str r6, [r4]
    b .L_14c
.L_f8:
    ldr r6, [r4]
    orr r7, r6, #0x2
    bic r6, r7, #0x4
    bic r6, r6, #0x10
    str r6, [r4]
    b .L_14c
.L_110:
    ldr r6, [r4]
    orr r7, r6, #0x4
    bic r6, r7, #0x2
    bic r6, r6, #0x8
    str r6, [r4]
    b .L_14c
.L_128:
    ldr r6, [r4]
    orr r6, r6, #0x8
    bic r6, r6, #0x4
    str r6, [r4]
    b .L_14c
.L_13c:
    ldr r6, [r4]
    orr r6, r6, #0x10
    bic r6, r6, #0x2
    str r6, [r4]
.L_14c:
    add ip, ip, #0x1
    cmp ip, lr
    add r5, r5, #0x18
    bcc .L_28
.L_15c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_164:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0xffc0003f
