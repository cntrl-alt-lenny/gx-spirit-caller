; func_ov002_0220c7e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf1a8
        .extern func_ov002_021ff230
        .global func_ov002_0220c7e0
        .arm
func_ov002_0220c7e0:
    stmdb sp!, {r4, lr}
    ldrh ip, [r0, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov lr, ip, lsl #0x1f
    mov lr, lr, lsr #0x1f
    and lr, lr, #0x1
    mul r4, lr, r2
    ldr r2, [r3, r4]
    mov r2, r2, lsr #0x13
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, ip, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul ip, r3, r2
    ldr r2, _LIT2
    add r2, r2, r4
    ldrh r2, [ip, r2]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021ff230
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cf0c2
