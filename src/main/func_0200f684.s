; func_0200f684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f684
        .arm
func_0200f684:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0xa4]
    cmpne r4, #0x0
    beq .L_a8c
    ldr r5, [r4]
    mov lr, #0x0
    cmp r5, #0x0
    bls .L_a84
    mov r8, lr
.L_8f4:
    ldr r7, [r0, #0xa8]
    ldr r6, [r0, #0xa4]
    ldr r4, [r7, r8]
    ldr r6, [r6, #0x4]
    bic r4, r4, #0x1
    ldr r6, [r6, lr, lsl #0x2]
    orr r4, r4, #0x1
    str r4, [r7, r8]
    cmp r3, #0x0
    add r7, r7, r8
    blt .L_934
    ldr r9, [r7]
    mov r4, r3, lsl #0x1f
    bic r9, r9, #0x20
    orr r4, r9, r4, lsr #0x1a
    str r4, [r7]
.L_934:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_a74
    b .L_960
    b .L_a20
    b .L_a38
    b .L_a50
    b .L_a64
    b .L_9f4
    b .L_964
    b .L_a10
.L_960:
    mov r2, #0x0
.L_964:
    mov r9, #0x400
    ldr r4, [r7, #0x4]
    rsb r9, r9, #0x0
    and r4, r4, r9
    str r4, [r7, #0x4]
    ldrh sl, [r6, #0x4]
    mov r4, #0x0
    sub sl, sl, #0x1
    cmp sl, #0x0
    ble .L_9d4
.L_98c:
    ldr sl, [r6, #0xc]
    add sl, sl, r4, lsl #0x1
    ldrh sl, [sl, #0x2]
    cmp sl, r2
    bgt .L_9d4
    ldr ip, [r7, #0x4]
    add r4, r4, #0x1
    mov sl, ip, lsl #0x16
    and ip, ip, r9
    mov sl, sl, asr #0x16
    add sl, sl, #0x1
    and sl, sl, r9, lsr #0x16
    orr sl, ip, sl
    str sl, [r7, #0x4]
    ldrh ip, [r6, #0x4]
    sub ip, ip, #0x1
    cmp r4, ip
    blt .L_98c
.L_9d4:
    ldr r9, [r7, #0x4]
    ldr r4, _LIT0
    ldr r6, _LIT1
    and r9, r9, r4
    and r6, r9, r6
    mov r4, r2, lsl #0x16
    orr r4, r6, r4, lsr #0x2
    str r4, [r7, #0x4]
.L_9f4:
    ldr r4, [r7]
    bic r4, r4, #0x2
    bic r6, r4, #0x4
    bic r4, r6, #0x8
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_a74
.L_a10:
    ldr r4, [r7]
    bic r4, r4, #0x40
    str r4, [r7]
    b .L_a74
.L_a20:
    ldr r4, [r7]
    orr r6, r4, #0x2
    bic r4, r6, #0x4
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_a74
.L_a38:
    ldr r4, [r7]
    orr r6, r4, #0x4
    bic r4, r6, #0x2
    bic r4, r4, #0x8
    str r4, [r7]
    b .L_a74
.L_a50:
    ldr r4, [r7]
    orr r4, r4, #0x8
    bic r4, r4, #0x4
    str r4, [r7]
    b .L_a74
.L_a64:
    ldr r4, [r7]
    orr r4, r4, #0x10
    bic r4, r4, #0x2
    str r4, [r7]
.L_a74:
    add lr, lr, #0x1
    cmp lr, r5
    add r8, r8, #0x8
    bcc .L_8f4
.L_a84:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a8c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xfff003ff
_LIT1: .word 0xc00fffff
