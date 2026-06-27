; func_ov002_02238b0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021e2460
        .extern func_ov002_0226ae88
        .global func_ov002_02238b0c
        .arm
func_ov002_02238b0c:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_5c
    cmp r1, #0x80
    bne .L_9c
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, #0x0
    bl func_ov002_0226ae88
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_5c:
    ldrh r0, [r0, #0x2]
    ldr ip, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mla ip, r3, r1, ip
    ldr r2, _LIT4
    mov r3, #0x1
    ldrh r1, [r2, #0xb0]
    add r2, ip, #0x120
    add r2, r2, r1, lsl #0x2
    bl func_ov002_021e2460
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0d8c
