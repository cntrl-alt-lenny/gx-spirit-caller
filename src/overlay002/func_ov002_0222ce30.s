; func_ov002_0222ce30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf26c
        .extern func_ov002_0226af38
        .global func_ov002_0222ce30
        .arm
func_ov002_0222ce30:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov ip, r2, lsr #0x1f
    and r2, ip, #0x1
    mul r3, r2, r0
    ldrh r0, [r1, r3]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT2
    ldr r0, _LIT3
    add r1, r1, r3
    ldr r1, [r1, #0xf8]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    rsb r0, ip, #0x1
    mov r1, #0x1
    mov r2, #0x3
    bl func_ov002_0226af38
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf26c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000169f
