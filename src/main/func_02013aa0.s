; func_02013aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b75c
        .global func_02013aa0
        .arm
func_02013aa0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8d8]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x920]
    cmp r1, #0x1
    beq .L_7c
    cmp r1, #0x2
    beq .L_cc
    cmp r1, #0x3
    ldreq r0, _LIT0
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_7c:
    ldr r1, [r0, #0x924]
    cmp r1, #0x1
    beq .L_9c
    cmp r1, #0x2
    beq .L_b0
    cmp r1, #0x3
    beq .L_a4
    ldmia sp!, {r4, pc}
.L_9c:
    mov r1, #0x3
    str r1, [r0, #0x924]
.L_a4:
    ldr r0, _LIT1
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r0, _LIT2
    str r0, [r4, #0x8]
    bl func_0201b75c
    ldr r1, [r0]
    orr r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r4, pc}
.L_cc:
    ldr r0, _LIT3
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00010300
_LIT1: .word 0x00010100
_LIT2: .word 0x00010101
_LIT3: .word 0x00010200
