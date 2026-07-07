; func_ov002_0221a050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021d7f20
        .extern func_ov002_021e267c
        .extern func_ov002_0223de04
        .global func_ov002_0221a050
        .arm
func_ov002_0221a050:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r1, [r5, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x6]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    cmp r1, #0x1
    bne .L_c4
    mov r1, #0x0
    bl func_ov002_0223de04
    ldrh r2, [r5, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b98d4
    movs r4, r0
    bmi .L_c4
    ldrh r1, [r5, #0x2]
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r6, r0, #0x400
    mov r0, r5
    add r2, r6, r4, lsl #0x2
    bl func_ov002_021d7f20
    ldr r1, [r6, r4, lsl #0x2]
    ldrh r2, [r5, #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r2, r0, lsl #0x10
    ldrh r1, [r5]
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
