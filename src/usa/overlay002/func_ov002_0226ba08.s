; func_ov002_0226ba08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202e2d4
        .global func_ov002_0226ba08
        .arm
func_ov002_0226ba08:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0xd94]
    cmp r0, r3
    beq .L_4c
    cmp r1, #0xb
    bne .L_4c
    ldr r1, _LIT1
    ldr r3, _LIT2
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2d4
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_4c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
