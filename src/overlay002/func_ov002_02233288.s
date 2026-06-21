; func_ov002_02233288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d7c1c
        .extern func_ov002_0226af94
        .global func_ov002_02233288
        .arm
func_ov002_02233288:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov ip, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_64
    cmp r0, #0x80
    bne .L_a4
    ldrh r0, [ip, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [ip]
    mov r2, #0x1
    bl func_ov002_0226af94
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_64:
    ldrh r0, [ip, #0x2]
    ldr ip, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mla ip, r3, r1, ip
    ldr r2, _LIT4
    add r3, ip, #0x120
    ldrh r1, [r2, #0xb0]
    mov r2, #0x1
    add r1, r3, r1, lsl #0x2
    bl func_ov002_021d7c1c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_a4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022d0e6c
