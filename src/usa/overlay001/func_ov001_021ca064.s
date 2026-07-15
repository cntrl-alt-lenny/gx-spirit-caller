; func_ov001_021ca064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov001_021ca340
        .extern func_02005c84
        .extern func_02005e04
        .extern func_ov000_021ab440
        .extern func_ov000_021ab4cc
        .extern func_ov000_021ab5ec
        .extern func_ov000_021ab818
        .extern func_ov001_021c9e44
        .global func_ov001_021ca064
        .arm
func_ov001_021ca064:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_410
    cmp r0, #0xa
    beq .L_534
    b .L_540
.L_410:
    ldr r0, [r4]
    mov r1, r0, lsl #0x10
    mov r6, r1, lsr #0x18
    cmp r6, #0x3c
    bgt .L_474
    mov r0, r5
    mov r1, #0x1
    bl func_ov000_021ab440
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab440
    mov r1, r6, lsl #0x4
    ldr r2, _LIT2
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r6, lsl #0x4
    add r3, r0, r3, asr #0x5
    sub r7, r3, #0x10
    mov r1, r7
    mov r0, r5
    bl func_ov000_021ab4cc
    mov r1, r7
    mov r0, #0x1
    bl func_ov000_021ab4cc
    b .L_514
.L_474:
    cmp r6, #0xb4
    blt .L_514
    cmp r6, #0xf0
    bgt .L_4d8
    mov r0, r5
    mov r1, #0x1
    bl func_ov000_021ab440
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab440
    add r0, r6, #0x3c
    mov r0, r0, lsl #0x4
    rsb r3, r0, #0x0
    ldr r2, _LIT2
    mov r0, r3, lsr #0x1f
    smull r1, r7, r2, r3
    add r7, r3, r7
    add r7, r0, r7, asr #0x5
    mov r1, r7
    mov r0, r5
    bl func_ov000_021ab4cc
    mov r1, r7
    mov r0, #0x1
    bl func_ov000_021ab4cc
    b .L_514
.L_4d8:
    mov r0, r0, lsl #0x8
    mov r7, r0, lsr #0x18
    add r0, r7, #0x1
    cmp r0, #0x2
    movge r5, #0x1
    bge .L_514
    bl func_ov001_021c9e44
    add r0, r7, #0x1
    ldr r1, [r4]
    and r0, r0, #0xff
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4]
    mov r6, r5
.L_514:
    add r0, r6, #0x1
    ldr r1, [r4]
    and r0, r0, #0xff
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r4]
    b .L_540
.L_534:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    movne r5, #0x1
.L_540:
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    bl func_ov000_021ab818
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov001_021ca340
_LIT1: .word data_ov001_021ca340
_LIT2: .word 0x88888889
