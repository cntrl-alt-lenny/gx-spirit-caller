; func_02066cd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101698
        .extern func_020aab90
        .global func_02066cd0
        .arm
func_02066cd0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r0, r1
    ldr r1, _LIT0
    add r2, sp, #0x0
    add r3, sp, #0x4
    bl func_020aab90
    ldr r0, [sp]
    ldr lr, [sp, #0x4]
    mov r2, r0, lsr #0x18
    mov r1, r0, lsr #0x8
    mov r3, r0, lsl #0x8
    mov ip, r0, lsl #0x18
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    and r3, r3, #0xff0000
    and r2, ip, #-16777216
    orr r1, r3, r1
    orrs r2, r2, r1
    mov r0, lr, lsl #0x10
    str r2, [sp]
    addeq sp, sp, #0x8
    mov r1, r0, lsr #0x10
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x104]
    cmp r0, r2
    bne .L_2f0
    add r0, r4, #0x100
    ldrh r0, [r0, #0x8]
    cmp r0, r1
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
.L_2f0:
    str r2, [r4, #0x104]
    add r0, r4, #0x100
    strh r1, [r0, #0x8]
    ldr r0, [sp]
    ldr r2, [r4, #0x10c]
    ldr r3, [r4, #0xa8]
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101698
