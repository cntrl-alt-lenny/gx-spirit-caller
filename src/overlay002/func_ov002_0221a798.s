; func_ov002_0221a798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021e276c
        .global func_ov002_0221a798
        .arm
func_ov002_0221a798:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0]
    ldr r2, _LIT0
    cmp r1, r2
    beq .L_57c
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_5b4
    b .L_5d4
.L_57c:
    ldrh ip, [r0, #0x2]
    ldr r2, _LIT2
    ldr r3, [r2, #0xcec]
    mov ip, ip, lsl #0x1f
    cmp r3, ip, lsr #0x1f
    bne .L_5ac
    ldr r2, [r2, #0xcf8]
    cmp r2, #0x1
    movcs r2, #0x1
    movcc r2, #0x0
    mov r3, r2, lsl #0x1
    b .L_5d4
.L_5ac:
    mov r3, #0x1
    b .L_5d4
.L_5b4:
    ldrh r3, [r0, #0x2]
    ldr r2, _LIT2
    ldr r2, [r2, #0xcec]
    mov r3, r3, lsl #0x1f
    cmp r2, r3, lsr #0x1f
    moveq r2, #0x1
    movne r2, #0x0
    add r3, r2, #0x1
.L_5d4:
    and r2, r3, #0xf
    ldrh r3, [r0, #0x2]
    mov r2, r2, lsl #0x4
    orr r2, r2, #0x1
    mov r2, r2, lsl #0x10
    ldrh r0, [r0, #0x4]
    mov ip, r3, lsl #0x1f
    mov r2, r2, lsr #0x10
    mov r3, r0, lsl #0x11
    mov r0, ip, lsr #0x1f
    mov r3, r3, lsr #0x17
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x0000137e
_LIT1: .word 0x000014fd
_LIT2: .word data_ov002_022d016c
