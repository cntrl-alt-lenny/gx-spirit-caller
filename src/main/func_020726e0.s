; func_020726e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020727dc
        .extern func_0207280c
        .extern func_02072924
        .extern func_02073f84
        .global func_020726e0
        .arm
func_020726e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r4, r2
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_02073f84
    ldr r1, _LIT0
    cmp r0, r1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrh ip, [r6, #0x10]
    ldrh r7, [r6, #0xc]
    ldrh r0, [r6, #0xe]
    ldrh r1, [r6, #0x12]
    mov r3, r7, asr #0x8
    mov lr, r0, asr #0x8
    orr r0, lr, r0, lsl #0x8
    mov r2, ip, asr #0x8
    orr r7, r3, r7, lsl #0x8
    orr r3, r2, ip, lsl #0x8
    mov r2, r7, lsl #0x10
    mov ip, r1, asr #0x8
    orr r1, ip, r1, lsl #0x8
    mov r3, r3, lsl #0x10
    mov r7, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r3, r7, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    orr r1, r2, r1, lsr #0x10
    bl func_020727dc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrb r0, [r5]
    cmp r0, #0x0
    beq .L_35c
    cmp r0, #0x8
    beq .L_378
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_35c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0207280c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_378:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02072924
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x0000ffff
