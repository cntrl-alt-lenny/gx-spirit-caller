; func_ov002_021ca1f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b83c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb97c
        .global func_ov002_021ca1f0
        .arm
func_ov002_021ca1f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, _LIT0
    mov r4, r1
    bl func_0202b83c
    cmp r4, r0
    beq .L_30
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_30:
    ldr r0, _LIT1
    bl func_0202b83c
    cmp r4, r0
    beq .L_54
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_54:
    ldr r0, _LIT2
    bl func_0202b83c
    cmp r4, r0
    beq .L_78
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_78:
    ldr r0, _LIT3
    bl func_0202b83c
    cmp r4, r0
    beq .L_9c
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_9c:
    ldr r0, _LIT4
    bl func_0202b83c
    cmp r4, r0
    beq .L_c0
    ldr r0, _LIT4
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_c0:
    ldr r0, _LIT5
    bl func_0202b83c
    cmp r4, r0
    beq .L_e4
    ldr r0, _LIT5
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_e4:
    ldr r1, _LIT6
    mov r2, r4
    rsb r0, r5, #0x1
    bl func_ov002_021bb97c
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001ae2
_LIT1: .word 0x00001ae3
_LIT2: .word 0x00001ae4
_LIT3: .word 0x00001ae5
_LIT4: .word 0x00001ae6
_LIT5: .word 0x00001ae7
_LIT6: .word 0x0000197d
