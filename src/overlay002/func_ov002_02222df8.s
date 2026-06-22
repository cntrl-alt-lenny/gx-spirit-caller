; func_ov002_02222df8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021afb64
        .extern func_ov002_021afb74
        .extern func_ov002_021de9d4
        .extern func_ov002_0225368c
        .extern func_ov002_02257b48
        .extern func_ov002_0227adb8
        .global func_ov002_02222df8
        .arm
func_ov002_02222df8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_838
    cmp r2, #0x80
    bne .L_880
    ldrh r2, [r4, #0x2]
    ldrh ip, [r4, #0x4]
    ldr r5, _LIT1
    mov r3, r2, lsl #0x1f
    mov lr, r3, lsr #0x1f
    mov r3, r2, lsl #0x1a
    ldr r2, _LIT2
    and lr, lr, #0x1
    mla r5, lr, r2, r5
    mov r3, r3, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    add r3, r5, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov002_02257b48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de9d4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_838:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    mov r0, #0x0
    bl func_ov002_021afb64
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_880:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
