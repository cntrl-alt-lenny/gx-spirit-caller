; func_ov002_02207e94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021bc8c8
        .global func_ov002_02207e94
        .arm
func_ov002_02207e94:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r2, _LIT2
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    rsb r1, r3, #0x1
    and r3, r3, #0x1
    and r1, r1, #0x1
    mul ip, r3, r0
    mul r0, r1, r0
    ldr r1, [r2, ip]
    ldr r0, [r2, r0]
    cmp r1, r0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
