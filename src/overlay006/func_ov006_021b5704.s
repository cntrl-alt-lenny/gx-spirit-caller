; func_ov006_021b5704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3e48
        .extern data_02103da0
        .extern data_ov006_0224f38c
        .extern func_020057c8
        .extern func_0200592c
        .extern func_0200ad0c
        .extern func_0200f854
        .extern func_02021064
        .extern func_02021190
        .extern func_020211b4
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208c940
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d3fc
        .extern func_0208d4f0
        .extern func_0208d6f4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_02094504
        .global func_ov006_021b5704
        .arm
func_ov006_021b5704:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0200592c
    ldr r0, _LIT2
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    cmp r4, #0x0
    beq .L_c8
    mov r0, #0x60
    bl func_0208da2c
    mov r0, #0x3
    bl func_0208d4f0
    mov r0, #0x10
    bl func_0208d3fc
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    b .L_120
.L_c8:
    mov r0, #0x1
    bl func_0208da2c
    mov r0, #0x2
    bl func_0208d8c0
    mov r0, #0x20
    bl func_0208d7ac
    mov r0, #0x40
    bl func_0208d6f4
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
.L_120:
    ldr r2, _LIT3
    mov r1, #0x4000000
    ldrh r0, [r2]
    orr r0, r0, #0x8000
    strh r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c940
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
    bl func_02021064
    mov r0, #0x0
    mov r1, #0x1
    bl func_02021190
    cmp r4, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, #0x1
    bl func_02021190
    mov r0, #0x3
    mov r1, #0x8
    bl func_020211b4
    cmp r4, #0x0
    beq .L_1d4
    mov r0, #0x8
    bl func_0200ad0c
    mov ip, #0x3000
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    str ip, [sp]
    bl func_0200f854
.L_1d4:
    mov r0, #0x14
    mov r1, #0x1
    bl func_020057c8
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
_LIT5: .word data_02103da0
_LIT6: .word data_020c3e48
_LIT7: .word data_ov006_0224f38c
