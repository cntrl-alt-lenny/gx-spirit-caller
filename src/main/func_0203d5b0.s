; func_0203d5b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203f690
        .extern func_0203f718
        .extern func_02094688
        .global func_0203d5b0
        .arm
func_0203d5b0:
    stmdb sp!, {r4, lr}
    mov r4, r2
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_5b0
    b .L_514
    b .L_510
    b .L_50c
    b .L_540
    b .L_53c
    b .L_538
    b .L_564
    b .L_58c
    b .L_5b0
    b .L_5b0
.L_50c:
    add r0, r0, #0x100
.L_510:
    add r0, r0, #0x100
.L_514:
    ldrb r2, [r0, #0xe6]
    add r0, r0, #0x80
    add r1, r4, #0x2
    mov r2, r2, lsl #0x1e
    mov r3, r2, lsr #0x1e
    mov r2, #0x50
    strb r3, [r4]
    bl func_02094688
    b .L_5b0
.L_538:
    add r0, r0, #0x100
.L_53c:
    add r0, r0, #0x100
.L_540:
    mov r3, #0x1
    add r0, r0, #0xd1
    add r1, r4, #0x2
    mov r2, #0x14
    strb r3, [r4]
    bl func_02094688
    mov r0, #0x0
    strb r0, [r4, #0x16]
    b .L_5b0
.L_564:
    mov r1, #0x2
    strb r1, [r4]
    ldr r1, _LIT0
    ldrb r2, [r0, #0xd13]
    add r1, r0, r1
    mov r0, #0xc0
    mla r0, r2, r0, r1
    add r1, r4, #0x2
    bl func_0203f690
    b .L_5b0
.L_58c:
    mov r1, #0x2
    strb r1, [r4]
    ldr r1, _LIT0
    ldrb r2, [r0, #0xd13]
    add r1, r0, r1
    mov r0, #0xc0
    mla r0, r2, r0, r1
    add r1, r4, #0x2
    bl func_0203f718
.L_5b0:
    ldrb r0, [r4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000047c
