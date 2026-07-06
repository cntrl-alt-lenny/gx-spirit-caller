; func_ov002_02216ec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021ae320
        .extern func_ov002_021ba1b4
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_0226af64
        .global func_ov002_02216ec8
        .arm
func_ov002_02216ec8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    beq .L_b0
    cmp r0, #0x6f
    beq .L_94
    cmp r0, #0x80
    bne .L_c8
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba1b4
    movs ip, r0
    bmi .L_78
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, ip, lsl #0x2
    bl func_ov002_021d8198
    cmp r0, #0x0
    movne r0, #0x64
    ldmneia sp!, {r4, pc}
.L_78:
    ldrh r0, [r4, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x6f
    ldmia sp!, {r4, pc}
.L_94:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_b0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000012e5
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
