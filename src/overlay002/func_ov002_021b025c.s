; func_ov002_021b025c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c3ae4
        .global func_ov002_021b025c
        .arm
func_ov002_021b025c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000fb7
_LIT1: .word 0x00000fb8
_LIT2: .word 0x00000fb9
_LIT3: .word 0x00000fba
_LIT4: .word 0x00000fbb
