; func_ov002_0221b654 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021e2d94
        .global func_ov002_0221b654
        .arm
func_ov002_0221b654:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    ldrh ip, [r0, #0x4]
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov lr, r1, lsl #0x1a
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, lr, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
