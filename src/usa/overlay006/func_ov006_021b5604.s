; func_ov006_021b5604 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3d68
        .extern data_02103cc0
        .extern data_ov006_0224f26c
        .extern func_020057ac
        .extern func_02005910
        .extern func_0200acf0
        .extern func_0200f838
        .extern func_02021010
        .extern func_0202113c
        .extern func_02021160
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208c858
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d314
        .extern func_0208d408
        .extern func_0208d60c
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_02094410
        .global func_ov006_021b5604
        .arm
func_ov006_021b5604:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_02005910
    ldr r0, _LIT2
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    cmp r4, #0x0
    beq .L_c8
    mov r0, #0x60
    bl func_0208d944
    mov r0, #0x3
    bl func_0208d408
    mov r0, #0x10
    bl func_0208d314
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
    b .L_120
.L_c8:
    mov r0, #0x1
    bl func_0208d944
    mov r0, #0x2
    bl func_0208d7d8
    mov r0, #0x20
    bl func_0208d6c4
    mov r0, #0x40
    bl func_0208d60c
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
.L_120:
    ldr r2, _LIT3
    mov r1, #0x4000000
    ldrh r0, [r2]
    orr r0, r0, #0x8000
    strh r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c858
    ldr ip, _LIT4
    ldr r1, _LIT5
    ldr r2, [ip]
    ldr r0, _LIT6
    bic r2, r2, #0x1f00
    str r2, [ip]
    ldr r2, [ip]
    mov r3, #0x1
    orr r2, r2, #0x10000
    str r2, [ip]
    mov r2, #0x0
    str r3, [r1]
    str r2, [r0]
    bl func_02021010
    mov r0, #0x0
    mov r1, #0x1
    bl func_0202113c
    cmp r4, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, #0x1
    bl func_0202113c
    mov r0, #0x3
    mov r1, #0x8
    bl func_02021160
    cmp r4, #0x0
    beq .L_1d4
    mov r0, #0x8
    bl func_0200acf0
    mov ip, #0x3000
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    str ip, [sp]
    bl func_0200f838
.L_1d4:
    mov r0, #0x14
    mov r1, #0x1
    bl func_020057ac
    ldr r0, _LIT7
    mov r1, #0x0
    str r4, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000304
_LIT4: .word 0x04001000
_LIT5: .word data_02103cc0
_LIT6: .word data_020c3d68
_LIT7: .word data_ov006_0224f26c
