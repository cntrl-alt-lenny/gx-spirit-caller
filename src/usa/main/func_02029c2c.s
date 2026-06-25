; func_02029c2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208f0dc
        .extern func_0208f128
        .extern func_0208f19c
        .extern func_0208f2a4
        .extern func_0208f2fc
        .extern func_0208f370
        .extern func_0208fdcc
        .extern func_0208fe34
        .extern func_0209281c
        .global func_02029c2c
        .arm
func_02029c2c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    add r0, r7, #0x100
    ldrh r0, [r0, #0x9a]
    mov r6, r1
    mov r4, r3
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    ldrne r0, [r7, #0x84]
    mov r1, r4
    ldreq r0, [r7, #0x90]
    mov r5, r2
    and r8, r0, #0x1
    mov r0, r6
    bl func_0209281c
    add r0, r7, #0x100
    ldrsh r0, [r0, #0x8c]
    cmp r0, #0x0
    bne .L_84
    cmp r8, #0x0
    beq .L_70
    bl func_0208f370
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208f2fc
    bl func_0208f2a4
    b .L_b8
.L_70:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208fe34
    b .L_b8
.L_84:
    cmp r8, #0x0
    beq .L_a8
    bl func_0208f19c
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208f128
    bl func_0208f0dc
    b .L_b8
.L_a8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208fdcc
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
