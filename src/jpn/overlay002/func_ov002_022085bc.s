; func_ov002_022085bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021bad9c
        .extern func_ov002_021bb718
        .global func_ov002_022085bc
        .arm
func_ov002_022085bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r3, r0, lsl #0x1f
    mov r2, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bb718
    cmp r0, #0x2
    blt .L_64
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    beq .L_64
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_64:
    mov r0, #0x2
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000178b
