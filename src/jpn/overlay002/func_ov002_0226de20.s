; func_ov002_0226de20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_ov002_0227539c
        .global func_ov002_0226de20
        .arm
func_ov002_0226de20:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2]
    and r3, r4, #0x1
    bic r5, r0, #0x1
    ldr r0, _LIT1
    orr r3, r5, r3
    and r3, r3, r0
    mov r0, r1, lsl #0x11
    orr r0, r3, r0, lsr #0x9
    str r0, [r2]
    ldrh r0, [r2, #0x16]
    mov r6, #0x0
    mov r5, r6
    orr r0, r0, #0x2
    strh r0, [r2, #0x16]
    strb r6, [r2, #0x8]
.L_3a8:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_0227539c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_3a8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0xff8000ff
