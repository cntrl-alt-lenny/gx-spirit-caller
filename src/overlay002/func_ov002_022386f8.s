; func_ov002_022386f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9aa8
        .extern func_ov002_021ff3bc
        .extern func_ov002_0227adb8
        .global func_ov002_022386f8
        .arm
func_ov002_022386f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_1e4
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9aa8
    movs lr, r0
    bmi .L_1e4
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    ldr ip, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r1, r3, r1, ip
    add r1, r1, #0x120
    add r1, r1, lr, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
.L_1e4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
