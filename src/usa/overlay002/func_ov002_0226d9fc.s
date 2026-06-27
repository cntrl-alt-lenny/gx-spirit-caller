; func_ov002_0226d9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_ov002_02270bb8
        .global func_ov002_0226d9fc
        .arm
func_ov002_0226d9fc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r3, r0, #0x1
    ldr r4, [r2]
    mov r6, #0x0
    bic r4, r4, #0x1
    orr r3, r4, r3
    ldr r0, _LIT1
    mov r4, r6
    and r3, r3, r0
    mov r0, r1, lsl #0x11
    orr r0, r3, r0, lsr #0x9
    str r0, [r2]
    ldrh r0, [r2, #0x16]
    mov r5, r6
    orr r0, r0, #0x2
    strh r0, [r2, #0x16]
    strb r6, [r2, #0x8]
.L_150:
    mov r7, r5
.L_154:
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_02270bb8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_154
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_150
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0xff8000ff
