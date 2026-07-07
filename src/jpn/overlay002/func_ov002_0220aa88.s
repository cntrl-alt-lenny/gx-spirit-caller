; func_ov002_0220aa88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021bad9c
        .extern func_ov002_021bbdcc
        .global func_ov002_0220aa88
        .arm
func_ov002_0220aa88:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x2
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    beq .L_60
    ldr r1, _LIT3
    rsb r0, r3, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_60:
    ldrh r5, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT4
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r6, r3, r1
    ldr r1, [r2, r6]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, r5, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r5, r2, r1
    ldr r1, _LIT5
    add r1, r1, r6
    add r6, r1, #0x30
    bl func_ov002_021bbdcc
    ldr r2, [r6, r5]
    ldrh r3, [r4, #0x4]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsl #0x11
    add r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x17
    moveq r1, #0x1
    movne r1, #0x0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x0000178b
_LIT4: .word data_ov002_022cf098
_LIT5: .word data_ov002_022cf08c
