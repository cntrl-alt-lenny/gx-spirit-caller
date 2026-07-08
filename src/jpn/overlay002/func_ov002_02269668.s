; func_ov002_02269668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb88
        .extern data_ov002_022cdb94
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern func_ov002_021b1490
        .extern func_ov002_02257b6c
        .global func_ov002_02269668
        .arm
func_ov002_02269668:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0x484]
    mov r0, #0x18
    mla r4, r2, r0, r1
    cmp r2, #0x0
    ldr r2, _LIT2
    subgt r1, r4, #0x18
    ldrh ip, [r2, #0xc]
    movle r1, #0x0
    mov r0, ip, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_17c8
    cmp r0, #0x1
    beq .L_17f4
    cmp r0, #0x2
    beq .L_1864
    b .L_1880
.L_17c8:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, _LIT0
    mov lr, #0x0
    str lr, [r0, #0x5b4]
    bic ip, ip, #0xff00
    mov r3, r3, lsl #0x18
    str lr, [r0, #0x5bc]
    orr r0, ip, r3, lsr #0x10
    strh r0, [r2, #0xc]
.L_17f4:
    ldr r2, _LIT0
    mov r0, r4
    str r4, [r2, #0x48c]
    bl func_ov002_02257b6c
    cmp r0, #0x0
    beq .L_185c
    ldr r2, _LIT3
    movgt r0, #0x1
    ldrh r1, [r2]
    movle r0, #0x0
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    ldrh ip, [r4, #0x2]
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic ip, ip, #0x8000
    mov r3, r3, lsl #0x1f
    orr r3, ip, r3, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r3, [r4, #0x2]
    strh r0, [r2]
.L_185c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1864:
    mov r0, #0x1d
    mov r2, r4
    sub r1, r0, #0x1e
    mov r3, #0x18
    bl func_ov002_021b1490
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1880:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce4a8
_LIT2: .word data_ov002_022cdb88
_LIT3: .word data_ov002_022cdb94
