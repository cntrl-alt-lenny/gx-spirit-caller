; func_ov002_0229230c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9bd4
        .extern func_ov002_021bae7c
        .global func_ov002_0229230c
        .arm
func_ov002_0229230c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9bd4
    ldrh r2, [r5, #0x2]
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r0, #0x1
    and r3, r2, #0x1
    mul ip, r3, r1
    mov r2, #0x3e8
    mul r1, r4, r2
    ldr r3, _LIT1
    ldr r2, [r3, ip]
    cmp r2, r1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x1
    ble .L_8c
    cmp r4, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
.L_8c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
