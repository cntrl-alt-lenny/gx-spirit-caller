; func_ov002_02295824 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bbf50
        .extern func_ov002_022577dc
        .extern func_ov002_0227d660
        .global func_ov002_02295824
        .arm
func_ov002_02295824:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r4, r1, lsr #0x1f
    bl func_ov002_022577dc
    rsb r3, r4, #0x1
    ldr r1, _LIT0
    and r3, r3, #0x1
    mul ip, r3, r1
    mov r2, #0x2bc
    mul r1, r0, r2
    ldr r3, _LIT1
    ldr r0, [r3, ip]
    cmp r0, r1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021bbf50
    cmp r0, #0x1
    ble .L_74
    ldrh r0, [r5, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d660
    cmp r0, #0x0
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
