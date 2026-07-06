; func_ov002_02211618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021d7c1c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223de04
        .global func_ov002_02211618
        .arm
func_ov002_02211618:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_2c0
    cmp r0, #0x80
    bne .L_360
    bl func_ov002_021e2a4c
.L_2c0:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    movs r1, r0, lsr #0x18
    beq .L_35c
    mov r0, r4
    sub r1, r1, #0x1
    bl func_ov002_0223de04
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    movs ip, r0
    bmi .L_328
    ldrh r1, [r4, #0x2]
    ldr r3, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r2, r0, #0x400
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7c1c
.L_328:
    ldrh r2, [r4, #0x6]
    mov r0, #0x7f
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, pc}
.L_35c:
    bl func_ov002_021e2b6c
.L_360:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
