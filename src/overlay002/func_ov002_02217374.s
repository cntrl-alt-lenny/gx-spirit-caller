; func_ov002_02217374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021d5b80
        .extern func_ov002_021e276c
        .extern func_ov002_0221d288
        .global func_ov002_02217374
        .arm
func_ov002_02217374:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    mov r4, r1
    mov r0, r3, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_30
    mov r0, r3, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    bne .L_68
.L_30:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    ldrh r0, [r5, #0x2]
    mov r1, #0xa2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_68:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x80
    bne .L_90
    ldrh r2, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5b80
.L_90:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0221d288
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
