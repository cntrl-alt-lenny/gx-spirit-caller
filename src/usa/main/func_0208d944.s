; func_0208d944 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d944
        .arm
func_0208d944:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x2]
    ldrh r3, [r1]
    cmp r0, #0x40
    strh r0, [r1, #0x2]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_dc
    cmp r0, #0x40
    bge .L_274
    cmp r0, #0x20
    bgt .L_d0
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_280
    b .L_280
    b .L_17c
    b .L_148
    b .L_170
    b .L_120
    b .L_1c0
    b .L_13c
    b .L_164
    b .L_104
    b .L_1dc
    b .L_1f8
    b .L_18c
    b .L_114
    b .L_1b4
    b .L_130
    b .L_158
    b .L_22c
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_280
    b .L_264
.L_d0:
    cmp r0, #0x30
    beq .L_220
    b .L_280
.L_dc:
    cmp r0, #0x60
    bgt .L_f8
    cmp r0, #0x60
    bge .L_258
    cmp r0, #0x50
    beq .L_23c
    b .L_280
.L_f8:
    cmp r0, #0x70
    beq .L_214
    b .L_280
.L_104:
    ldr r0, _LIT1
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_114:
    ldr r0, _LIT1
    mov r1, #0x89
    strb r1, [r0]
.L_120:
    ldr r0, _LIT2
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_130:
    ldr r0, _LIT1
    mov r1, #0x91
    strb r1, [r0]
.L_13c:
    ldr r0, _LIT2
    mov r1, #0x89
    strb r1, [r0]
.L_148:
    ldr r0, _LIT3
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_158:
    ldr r0, _LIT1
    mov r1, #0x99
    strb r1, [r0]
.L_164:
    ldr r0, _LIT2
    mov r1, #0x91
    strb r1, [r0]
.L_170:
    ldr r0, _LIT3
    mov r1, #0x89
    strb r1, [r0]
.L_17c:
    ldr r0, _LIT4
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_18c:
    ldr r0, _LIT4
    mov r2, #0x81
    ldr r1, _LIT3
    strb r2, [r0]
    mov r2, #0x89
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x91
    strb r1, [r0]
    b .L_280
.L_1b4:
    ldr r0, _LIT1
    mov r1, #0x91
    strb r1, [r0]
.L_1c0:
    ldr r1, _LIT4
    mov r2, #0x81
    ldr r0, _LIT2
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_280
.L_1dc:
    ldr r1, _LIT4
    mov r2, #0x81
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_280
.L_1f8:
    ldr r1, _LIT3
    mov r2, #0x81
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_280
.L_214:
    ldr r0, _LIT5
    mov r1, #0x99
    strb r1, [r0]
.L_220:
    ldr r0, _LIT6
    mov r1, #0x91
    strb r1, [r0]
.L_22c:
    ldr r0, _LIT7
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_23c:
    ldr r1, _LIT5
    mov r2, #0x91
    ldr r0, _LIT7
    strb r2, [r1]
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_258:
    ldr r0, _LIT5
    mov r1, #0x89
    strb r1, [r0]
.L_264:
    ldr r0, _LIT6
    mov r1, #0x81
    strb r1, [r0]
    b .L_280
.L_274:
    ldr r0, _LIT5
    mov r1, #0x81
    strb r1, [r0]
.L_280:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000243
_LIT2: .word 0x04000242
_LIT3: .word 0x04000241
_LIT4: .word 0x04000240
_LIT5: .word 0x04000246
_LIT6: .word 0x04000245
_LIT7: .word 0x04000244
