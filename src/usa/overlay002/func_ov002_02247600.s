; func_ov002_02247600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabc0
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_02247700
        .global func_ov002_02247600
        .arm
func_ov002_02247600:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r8, _LIT0
    mov r7, r2
    ldr r2, [r8, #0x48c]
    ldrh r2, [r2, #0x2]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    cmpeq r1, #0xb
    bne .L_9c
    ldr r1, _LIT1
    mov r5, #0x0
    ldr r1, [r1]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_9c
    ldr r2, _LIT2
    ldr r1, _LIT3
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    ldr r6, _LIT4
    add r4, r1, #0x120
.L_54:
    ldr r1, [r6]
    ldr r0, [r4, r7, lsl #0x2]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    bne .L_88
    ldr r0, [r8, #0x48c]
    mov r1, r5
    bl func_ov002_02247700
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_88:
    ldr r0, [r6, #0x4]!
    add r5, r5, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_54
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cabc0
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cabc0
