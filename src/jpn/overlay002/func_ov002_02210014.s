; func_ov002_02210014 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021df728
        .extern func_ov002_021e050c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0220ea10
        .global func_ov002_02210014
        .arm
func_ov002_02210014:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r1, sp, #0x0
    mov r4, r0
    bl func_ov002_0220ea10
    bl func_ov002_021e2a4c
    ldrh r1, [r4, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    ldr r2, [r0, r1, lsl #0x2]
    cmp r2, #0x0
    bge .L_19cc
    mov r0, r4
    rsb r2, r2, #0x0
    bl func_ov002_021df728
.L_19cc:
    ldrh r1, [r4, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, [r0, r1, lsl #0x2]
    cmp r2, #0x0
    bge .L_19f4
    mov r0, r4
    rsb r2, r2, #0x0
    bl func_ov002_021df728
.L_19f4:
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    ble .L_1a14
    bl func_ov002_021e050c
.L_1a14:
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    ble .L_1a38
    bl func_ov002_021e050c
.L_1a38:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
