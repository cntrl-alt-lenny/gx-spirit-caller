; func_02029c80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208f1c4
        .extern func_0208f210
        .extern func_0208f284
        .extern func_0208f38c
        .extern func_0208f3e4
        .extern func_0208f458
        .extern func_0208feb4
        .extern func_0208ff1c
        .extern func_02092904
        .global func_02029c80
        .arm
func_02029c80:
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
    bl func_02092904
    add r0, r7, #0x100
    ldrsh r0, [r0, #0x8c]
    cmp r0, #0x0
    bne .L_638
    cmp r8, #0x0
    beq .L_624
    bl func_0208f458
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208f3e4
    bl func_0208f38c
    b .L_66c
.L_624:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208ff1c
    b .L_66c
.L_638:
    cmp r8, #0x0
    beq .L_65c
    bl func_0208f284
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208f210
    bl func_0208f1c4
    b .L_66c
.L_65c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0208feb4
.L_66c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
