; func_02013a6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b71c
        .global func_02013a6c
        .arm
func_02013a6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8d8]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x920]
    cmp r1, #0x1
    beq .L_40
    cmp r1, #0x2
    beq .L_90
    cmp r1, #0x3
    ldreq r0, _LIT0
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_40:
    ldr r1, [r0, #0x924]
    cmp r1, #0x1
    beq .L_60
    cmp r1, #0x2
    beq .L_74
    cmp r1, #0x3
    beq .L_68
    ldmia sp!, {r4, pc}
.L_60:
    mov r1, #0x3
    str r1, [r0, #0x924]
.L_68:
    ldr r0, _LIT1
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_74:
    ldr r0, _LIT2
    str r0, [r4, #0x8]
    bl func_0201b71c
    ldr r1, [r0]
    orr r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r4, pc}
.L_90:
    ldr r0, _LIT3
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00010300
_LIT1: .word 0x00010100
_LIT2: .word 0x00010101
_LIT3: .word 0x00010200
