; func_ov002_0223de48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .global func_ov002_0223de48
        .arm
func_ov002_0223de48:
    stmdb sp!, {r3, lr}
    cmp r1, #0x5
    addlt r3, r0, #0x8
    addlt r3, r3, r1, lsl #0x1
    blt .L_34
    ldrh r3, [r0, #0x12]
    ldr lr, _LIT0
    add r3, r3, r1
    sub r3, r3, #0x5
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x19
    add r3, ip, r3, ror #0x19
    add r3, lr, r3, lsl #0x1
.L_34:
    cmp r2, #0x0
    beq .L_68
    ldrh ip, [r3]
    mov lr, ip, lsl #0x1f
    mov ip, ip, lsl #0x1b
    mov lr, lr, lsr #0x1f
    mov ip, ip, lsr #0x1c
    and lr, lr, #0xff
    and ip, ip, #0xff
    orr ip, lr, ip, lsl #0x8
    mov ip, ip, lsl #0x10
    mov ip, ip, lsr #0x10
    str ip, [r2]
.L_68:
    ldrh r2, [r0, #0x6]
    mov r0, r2, lsl #0x10
    mov r2, r2, lsl #0x18
    mov ip, r0, lsr #0x18
    mov r0, r2, lsr #0x18
    cmp ip, r2, lsr #0x18
    movls ip, r0
    cmp r1, ip
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldrh r0, [r3]
    mov r1, r0, lsl #0x1b
    mov lr, r1, lsr #0x1c
    cmp lr, #0xa
    movhi r0, #0x0
    ldmhiia sp!, {r3, pc}
    mov r1, r0, lsl #0x1f
    mov ip, r1, lsr #0x1f
    mov r2, #0x14
    ldr r1, _LIT1
    ldr r3, _LIT2
    and ip, ip, #0x1
    mla r3, ip, r1, r3
    mul r2, lr, r2
    add r1, r3, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r1, r3, #0x30
    ldr r2, [r1, r2]
    mov r3, r0, lsl #0x12
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsr #0x17
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT3
    mov r2, r3, lsl #0x2
    ldrh r1, [r1, r2]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x1e
    mov r0, r1, lsl #0x11
    cmp r2, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce640
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0170
