; func_02071fb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020720b4
        .extern func_02072144
        .extern func_02072600
        .extern func_020727dc
        .extern func_020918d0
        .global func_02071fb0
        .arm
func_02071fb0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh ip, [r4, #0x10]
    ldrh r7, [r4, #0xc]
    ldrh r3, [r4, #0x12]
    mov r5, ip, asr #0x8
    mov r6, r7, asr #0x8
    orr r5, r5, ip, lsl #0x8
    orr r6, r6, r7, lsl #0x8
    mov ip, r6, lsl #0x10
    ldrh r0, [r4, #0xe]
    mov lr, r5, lsl #0x10
    mov r5, r3, asr #0x8
    mov r6, r0, asr #0x8
    mov r7, ip, lsr #0x10
    orr r0, r6, r0, lsl #0x8
    orr r3, r5, r3, lsl #0x8
    mov ip, lr, lsr #0x10
    mov r6, r7, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r5, ip, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r7, r1
    orr r1, r5, r3, lsr #0x10
    orr r0, r6, r0, lsr #0x10
    mov r5, r2
    bl func_020727dc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r4
    mov r1, r7
    mov r2, r5
    bl func_020720b4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    mov r0, r4
    mov r1, r7
    bl func_02072600
    movs r2, r0
    beq .L_1040
    mov r0, r4
    mov r1, r7
    bl func_02072144
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1040:
    bl func_020918d0
    mov r0, r4
    mov r1, r7
    bl func_02072600
    movs r2, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r4
    mov r1, r7
    bl func_02072144
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
