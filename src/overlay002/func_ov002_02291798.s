; func_ov002_02291798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern func_ov002_021c84a8
        .extern func_ov002_022575c8
        .global func_ov002_02291798
        .arm
func_ov002_02291798:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r6, _LIT0
    mov r5, r0
    mov r4, #0x0
.L_340:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_390
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x1e4]
    cmp r0, #0x1
    bls .L_390
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c84a8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_390:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_340
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd524
