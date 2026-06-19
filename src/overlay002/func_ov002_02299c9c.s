; func_ov002_02299c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cb9dc
        .extern data_ov002_022cd524
        .extern data_ov002_022d016c
        .global func_ov002_02299c9c
        .arm
func_ov002_02299c9c:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0xcec]
    str r2, [r0]
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    ldreq r1, [r1, #0xcf8]
    cmpeq r1, #0x4
    moveq r1, #0x7
    streq r1, [r0, #0x4]
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_1c4
    blx r0
    cmp r0, #0x0
    beq .L_1bc
    ldr r1, _LIT1
    mov r0, #0x0
    str r0, [r1, #0x8]
    ldr r2, [r1, #0x4]
    ldr r0, _LIT0
    add r2, r2, #0x1
    str r2, [r1, #0x4]
    ldr r0, [r0, #0xd34]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_1bc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd524
_LIT2: .word data_ov002_022cb9dc
