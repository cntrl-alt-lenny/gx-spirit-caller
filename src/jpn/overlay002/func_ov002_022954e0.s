; func_ov002_022954e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_022574e0
        .global func_ov002_022954e0
        .arm
func_ov002_022954e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r8, _LIT1
    mov r7, r0
    mov r6, r5
.L_1d0:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    and r0, r1, #0x1
    mla r2, r0, r8, r4
    add r0, r2, #0x30
    ldr r0, [r0, r6]
    mov r2, r0, lsl #0x13
    movs r2, r2, lsr #0x13
    movne r0, r0, lsl #0x12
    cmpne r1, r0, lsr #0x1f
    beq .L_218
    mov r0, r7
    mov r2, r5
    bl func_ov002_022574e0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_218:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_1d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
