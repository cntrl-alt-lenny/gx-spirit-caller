; func_ov002_02296690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern func_ov002_022576d8
        .extern func_ov002_02259f74
        .extern func_ov002_0228d0ac
        .global func_ov002_02296690
        .arm
func_ov002_02296690:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and ip, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022576d8
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228d0ac
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a2
