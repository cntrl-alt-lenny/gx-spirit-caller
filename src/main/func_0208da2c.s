; func_0208da2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208da2c
        .arm
func_0208da2c:
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
    bgt .L_904
    cmp r0, #0x40
    bge .L_a9c
    cmp r0, #0x20
    bgt .L_8f8
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_aa8
    b .L_aa8
    b .L_9a4
    b .L_970
    b .L_998
    b .L_948
    b .L_9e8
    b .L_964
    b .L_98c
    b .L_92c
    b .L_a04
    b .L_a20
    b .L_9b4
    b .L_93c
    b .L_9dc
    b .L_958
    b .L_980
    b .L_a54
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_a8c
.L_8f8:
    cmp r0, #0x30
    beq .L_a48
    b .L_aa8
.L_904:
    cmp r0, #0x60
    bgt .L_920
    cmp r0, #0x60
    bge .L_a80
    cmp r0, #0x50
    beq .L_a64
    b .L_aa8
.L_920:
    cmp r0, #0x70
    beq .L_a3c
    b .L_aa8
.L_92c:
    ldr r0, _LIT1
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_93c:
    ldr r0, _LIT1
    mov r1, #0x89
    strb r1, [r0]
.L_948:
    ldr r0, _LIT2
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_958:
    ldr r0, _LIT1
    mov r1, #0x91
    strb r1, [r0]
.L_964:
    ldr r0, _LIT2
    mov r1, #0x89
    strb r1, [r0]
.L_970:
    ldr r0, _LIT3
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_980:
    ldr r0, _LIT1
    mov r1, #0x99
    strb r1, [r0]
.L_98c:
    ldr r0, _LIT2
    mov r1, #0x91
    strb r1, [r0]
.L_998:
    ldr r0, _LIT3
    mov r1, #0x89
    strb r1, [r0]
.L_9a4:
    ldr r0, _LIT4
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_9b4:
    ldr r0, _LIT4
    mov r2, #0x81
    ldr r1, _LIT3
    strb r2, [r0]
    mov r2, #0x89
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x91
    strb r1, [r0]
    b .L_aa8
.L_9dc:
    ldr r0, _LIT1
    mov r1, #0x91
    strb r1, [r0]
.L_9e8:
    ldr r1, _LIT4
    mov r2, #0x81
    ldr r0, _LIT2
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_aa8
.L_a04:
    ldr r1, _LIT4
    mov r2, #0x81
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_aa8
.L_a20:
    ldr r1, _LIT3
    mov r2, #0x81
    ldr r0, _LIT1
    strb r2, [r1]
    mov r1, #0x89
    strb r1, [r0]
    b .L_aa8
.L_a3c:
    ldr r0, _LIT5
    mov r1, #0x99
    strb r1, [r0]
.L_a48:
    ldr r0, _LIT6
    mov r1, #0x91
    strb r1, [r0]
.L_a54:
    ldr r0, _LIT7
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_a64:
    ldr r1, _LIT5
    mov r2, #0x91
    ldr r0, _LIT7
    strb r2, [r1]
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_a80:
    ldr r0, _LIT5
    mov r1, #0x89
    strb r1, [r0]
.L_a8c:
    ldr r0, _LIT6
    mov r1, #0x81
    strb r1, [r0]
    b .L_aa8
.L_a9c:
    ldr r0, _LIT5
    mov r1, #0x81
    strb r1, [r0]
.L_aa8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04000243
_LIT2: .word 0x04000242
_LIT3: .word 0x04000241
_LIT4: .word 0x04000240
_LIT5: .word 0x04000246
_LIT6: .word 0x04000245
_LIT7: .word 0x04000244
