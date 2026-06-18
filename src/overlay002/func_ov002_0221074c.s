; func_ov002_0221074c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e104c
        .extern func_ov002_02210264
        .global func_ov002_0221074c
        .arm
func_ov002_0221074c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r5, r1, r2, lsr #0x1f
    bl func_ov002_02210264
    ldrh r3, [r4]
    ldr r2, _LIT0
    mov r1, r0
    cmp r3, r2
    addne r0, r2, #0x9c
    cmpne r3, r0
    bne .L_694
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r5, r0, #0x1
.L_694:
    cmp r1, #0x0
    ble .L_6a4
    mov r0, r5
    bl func_ov002_021e104c
.L_6a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000019c7
