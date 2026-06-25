; func_0200658c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103cc4
        .extern data_02104ac4
        .extern data_02104e6c
        .extern func_02005688
        .extern func_02005f10
        .extern func_020071a8
        .extern func_020085b8
        .extern func_0200a9d8
        .extern func_0200c0c8
        .extern func_0200c2dc
        .extern func_0200c578
        .extern func_02010aec
        .extern func_0201d0fc
        .extern func_0201d3d4
        .extern func_02022e90
        .extern func_02031d44
        .extern func_02034734
        .extern func_0208c858
        .extern func_02091680
        .extern func_020919a4
        .extern func_02092280
        .extern func_0209372c
        .extern func_02093754
        .extern func_0209a970
        .extern func_0209aa80
        .global func_0200658c
        .arm
func_0200658c:
    stmdb sp!, {r4, r5, r6, lr}
.L_4:
    bl func_02005688
    bl func_02005f10
    bl func_020071a8
    bl func_0201d0fc
    bl func_02031d44
    ldr r0, _LIT0
    ldrh r0, [r0]
    and r0, r0, #0x8000
    movs r0, r0, asr #0xf
    beq .L_64
    mov r0, #0x0
    bl func_0209a970
    bl func_020085b8
    cmp r0, #0x0
    bne .L_6c
    bl func_02034734
    cmp r0, #0x0
    bne .L_6c
    mov r1, #0x0
    mov r2, r1
    mov r0, #0xc
    bl func_0209aa80
    bl func_0208c858
    b .L_6c
.L_64:
    mov r0, #0x1
    bl func_0209a970
.L_6c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x308]
    cmp r0, #0x0
    beq .L_80
    blx r0
.L_80:
    bl func_02034734
    cmp r0, #0x0
    bne .L_f8
    ldr r0, _LIT2
    ldrh r0, [r0, #0x5a]
    and r0, r0, #0x30c
    cmp r0, #0x30c
    bne .L_ec
    ldr r0, _LIT1
    ldr r0, [r0, #0x320]
    cmp r0, #0x0
    beq .L_f8
    bl func_02092280
    and r0, r0, #-268435456
    cmp r0, #-2147483648
    bne .L_f8
    bl func_0201d3d4
    bl func_0209372c
    bl func_0209372c
    bl func_0209372c
    mov r0, #0x0
    bl func_0209a970
    mov r0, #0x12c
    bl func_02091680
    mov r0, #0x1
    bl func_02093754
    b .L_f8
.L_ec:
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0x320]
.L_f8:
    bl func_0200a9d8
    mov r0, #0x1
    bl func_02022e90
    mov r0, #0x0
    bl func_020919a4
    ldr r0, _LIT1
    ldr r1, _LIT3
    ldr r4, [r0, #0x334]
    mov r3, #0x0
    ldr r5, [r1]
    str r3, [r0, #0x31c]
    sub r2, r4, #0x1
    str r2, [r0, #0x338]
    str r3, [r0, #0x334]
    ldr r2, [r0, #0x340]
    add r3, r5, r4
    add r2, r2, #0x1
    str r2, [r0, #0x340]
    ldr r0, [r0, #0x328]
    str r3, [r1]
    cmp r0, #0x0
    beq .L_174
.L_150:
    bl func_0200c0c8
    cmp r0, #0x0
    bne .L_150
    bl func_0200c2dc
    cmp r0, #0x0
    bne .L_150
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x328]
.L_174:
    ldr r4, _LIT1
    ldr r0, [r4, #0x324]
    cmp r0, #0x0
    beq .L_1d4
    mov r5, #0x2
    mov r4, #0x1
.L_18c:
    bl func_02010aec
    cmp r0, #0x0
    bne .L_18c
    bl func_0200c578
    cmp r0, #0x0
    bne .L_18c
    mov r0, r5
    bl func_02022e90
    cmp r0, #0x0
    bne .L_18c
    mov r0, r4
    bl func_02022e90
    cmp r0, #0x0
    bne .L_18c
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x324]
    b .L_4
.L_1d4:
    mov r6, #0x2
    ldr r5, _LIT4
    b .L_220
.L_1e0:
    ldr r0, [r4, #0x318]
    cmp r0, #0x0
    beq .L_1f8
    blx r0
    cmp r0, #0x0
    bne .L_4
.L_1f8:
    bl func_02010aec
    cmp r0, #0x0
    bne .L_220
    bl func_0200c578
    cmp r0, #0x0
    bne .L_220
    mov r0, r6
    bl func_02022e90
    cmp r0, #0x0
    beq .L_4
.L_220:
    ldrh r0, [r5]
    cmp r0, #0xbf
    blt .L_4
    ldrh r0, [r5]
    cmp r0, #0xd0
    blt .L_1e0
    b .L_4
_LIT0: .word 0x027fffa8
_LIT1: .word data_02103cc4
_LIT2: .word data_02104ac4
_LIT3: .word data_02104e6c
_LIT4: .word 0x04000006
