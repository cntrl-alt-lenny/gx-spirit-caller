; func_ov002_02295560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c8390
        .extern func_ov002_0227d570
        .global func_ov002_02295560
        .arm
func_ov002_02295560:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r8, r0
    mov r5, r6
    mov r7, r6
.L_1c:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_54
    mov r1, r5
    bl func_ov002_021c8390
    add r0, r0, r0, lsr #0x1f
    add r6, r6, r0, asr #0x1
.L_54:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r7, r7, #0x14
    ble .L_1c
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, r6
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x0
    bl func_ov002_0227d570
    cmp r0, #0x0
    blt .L_c8
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8390
    cmp r0, #0x3e8
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
