; func_ov002_0229205c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern func_ov002_02259f74
        .extern func_ov002_0227d660
        .global func_ov002_0229205c
        .arm
func_ov002_0229205c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    and lr, r0, #0x1
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, lr, r1, ip
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    bl func_ov002_0227d660
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a2
