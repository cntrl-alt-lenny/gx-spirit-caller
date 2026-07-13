; func_020447d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bece4
        .extern func_02044228
        .extern func_02044254
        .extern func_020442d0
        .extern func_020442f8
        .extern func_020a7440
        .global func_020447d8
        .arm
func_020447d8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrb r0, [r4, #0xe7]
    cmp r0, #0xff
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x2
    addhi sp, sp, #0x8
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
    add r0, r4, #0x40
    bl func_020442d0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    add r0, r4, #0xc0
    mov r2, #0x4
    bl func_020a7440
    cmp r0, #0x0
    beq .L_b0
    add r0, r4, #0xc4
    bl func_02044228
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrb r0, [r4, #0xd0]
    cmp r0, #0x20
    addhi sp, sp, #0x8
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
    add r1, sp, #0x0
    bl func_020442f8
    add r1, sp, #0x0
    add r0, r4, #0xc0
    bl func_02044254
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_b0:
    ldr r1, _LIT0
    add r0, r4, #0xc8
    mov r2, #0x4
    bl func_020a7440
    cmp r0, #0x0
    beq .L_f0
    add r0, r4, #0xc8
    bl func_02044228
    cmp r0, #0x0
    bne .L_f0
    add r0, r4, #0xcc
    bl func_02044228
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_f0:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_020bece4+0x38
