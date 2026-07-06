; func_ov002_02239984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021e267c
        .extern func_ov002_021e269c
        .extern func_ov002_0226ae88
        .global func_ov002_02239984
        .arm
func_ov002_02239984:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_60
    cmp r0, #0x80
    bne .L_d8
    ldrh r0, [r4, #0x2]
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
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    bl func_ov002_0226ae88
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_60:
    ldrh r0, [r4, #0x2]
    ldr ip, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mla ip, r3, r1, ip
    ldr r2, _LIT4
    ldrh r1, [r2, #0xb0]
    add r2, ip, #0x120
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r3, r2, lsl #0x13
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r5, r3, lsr #0x13
    bl func_ov002_021e269c
    ldrh r0, [r4, #0x2]
    mov r2, r5, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r4]
    mov r0, r0, lsr #0x1f
    mov r2, #0x11
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_d8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0d8c
