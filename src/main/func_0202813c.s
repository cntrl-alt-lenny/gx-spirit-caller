; func_0202813c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208f2a8
        .extern func_0208f2f4
        .extern func_0208f368
        .extern func_0208f4c8
        .extern func_0208f52c
        .extern func_0208f5ac
        .extern func_0208ff84
        .extern func_0208ffec
        .extern func_02092904
        .global func_0202813c
        .arm
func_0202813c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldrh r0, [r8, #0xde]
    mov r7, r1
    mov r6, r2
    mov r0, r0, lsl #0x1d
    mov r5, r3
    movs r0, r0, lsr #0x1f
    beq .L_29c
    ldr r0, [r8, #0x84]
    ands r4, r0, #0x1
    beq .L_2a4
    ldr r0, [r8, #0xa4]
    mov r0, r0, lsl #0xf
    mov r0, r0, asr #0x1d
    add r6, r6, r0, lsl #0xd
    b .L_2a4
.L_29c:
    ldr r0, [r8, #0x74]
    and r4, r0, #0x1
.L_2a4:
    mov r0, r7
    mov r1, r5
    bl func_02092904
    ldrsh r0, [r8, #0xd4]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_34c
    b .L_2e0
    b .L_2e0
    b .L_2e0
    b .L_2e0
    b .L_318
    b .L_318
    b .L_318
    b .L_318
.L_2e0:
    cmp r4, #0x0
    beq .L_304
    bl func_0208f5ac
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0208f52c
    bl func_0208f4c8
    b .L_34c
.L_304:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0208ffec
    b .L_34c
.L_318:
    cmp r4, #0x0
    beq .L_33c
    bl func_0208f368
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0208f2f4
    bl func_0208f2a8
    b .L_34c
.L_33c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0208ff84
.L_34c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
