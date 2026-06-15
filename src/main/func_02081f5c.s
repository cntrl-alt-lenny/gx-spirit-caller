; func_02081f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209015c
        .extern func_020901cc
        .extern func_02090330
        .global func_02081f5c
        .arm
func_02081f5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    movs r8, r1
    mov r9, r0
    beq .L_18
    bl func_02090330
.L_18:
    ldrh r0, [r9, #0xc]
    movs r2, r0, lsl #0x3
    beq .L_4c
    ldr r1, [r9, #0x8]
    ldr r0, _LIT0
    ldr r3, [r9, #0x14]
    and r1, r1, r0
    add r0, r9, r3
    mov r1, r1, lsl #0x3
    bl func_020901cc
    ldrh r0, [r9, #0x10]
    orr r0, r0, #0x1
    strh r0, [r9, #0x10]
.L_4c:
    ldrh r0, [r9, #0x1c]
    movs r7, r0, lsl #0x3
    beq .L_b4
    ldr r1, [r9, #0x18]
    ldr r0, _LIT0
    ldr r3, [r9, #0x24]
    and r4, r1, r0
    mov r5, r4, lsl #0x3
    ldr r6, [r9, #0x28]
    mov r1, r5
    mov r2, r7
    add r0, r9, r3
    add r6, r9, r6
    bl func_020901cc
    ldr r0, _LIT1
    and r1, r5, #0x40000
    and r0, r0, r4, lsl #0x3
    mov r0, r0, lsr #0x1
    add r2, r0, #0x20000
    mov r0, r6
    add r1, r2, r1, lsr #0x2
    mov r2, r7, lsr #0x1
    bl func_020901cc
    ldrh r0, [r9, #0x20]
    orr r0, r0, #0x1
    strh r0, [r9, #0x20]
.L_b4:
    cmp r8, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_0209015c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x0001ffff
