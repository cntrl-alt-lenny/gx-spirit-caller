; func_ov002_02202b9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021bad9c
        .global func_ov002_02202b9c
        .arm
func_ov002_02202b9c:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsl #0x11
    eor r2, r3, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    beq .L_104
    ldr r1, _LIT3
    rsb r0, r3, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
.L_104:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x0000178b
