; func_ov002_022950b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_020311b4
        .extern func_ov002_02281810
        .global func_ov002_022950b4
        .arm
func_ov002_022950b4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02281810
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02281810
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r5, #0x0
    ldr r4, _LIT2
    ldr r8, _LIT3
    mov r6, r5
.L_58:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mla r1, r0, r8, r4
    add r1, r1, r6
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r1, [r1, #0x38]
    cmpne r1, #0x0
    beq .L_98
    bl func_020311b4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_98:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    ble .L_58
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000012be
_LIT1: .word 0x00000fbb
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
