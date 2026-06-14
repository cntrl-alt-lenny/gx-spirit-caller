; func_ov007_021b22d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3e48
        .extern data_02103da0
        .extern data_ov007_021b3488
        .extern data_ov007_021b34c4
        .extern data_ov007_022334d0
        .extern data_ov007_0223352c
        .extern func_0200197c
        .extern func_02001d68
        .extern func_020057c8
        .extern func_0200592c
        .extern func_0200ad0c
        .extern func_0200f854
        .extern func_02021064
        .extern func_02021190
        .extern func_020211b4
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
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
        .extern func_0208da2c
        .extern func_02094504
        .extern func_ov007_021b2568
        .extern func_ov007_021b2a98
        .global func_ov007_021b22d8
        .arm
func_ov007_021b22d8:
    stmdb sp!, {r3, lr}
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
    ldr ip, _LIT3
    mov r0, #0x1
    ldrh r3, [ip]
    mov r1, #0x0
    mov r2, r0
    orr r3, r3, #0x8000
    strh r3, [ip]
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c940
    ldr ip, _LIT4
    mov r2, #0x1
    ldr r1, [ip]
    ldr r0, _LIT5
    bic r1, r1, #0x1f00
    str r1, [ip]
    ldr r3, [ip]
    mov r1, #0x0
    orr r3, r3, #0x10000
    str r3, [ip]
    str r2, [r0]
    ldr r0, _LIT6
    str r1, [r0]
    ldr r1, _LIT7
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    mov r0, #0x0
    bl func_02001d68
    ldr r0, _LIT8
    bl func_0202adf8
    mov r0, #0x0
    bl func_0202ae1c
    mov r0, #0x0
    bl func_0202c070
    bl func_02021064
    mov r0, #0x2
    mov r1, #0x1
    bl func_02021190
    mov r0, #0x3
    mov r1, #0x8
    bl func_020211b4
    mov r0, #0x8
    bl func_0200ad0c
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f854
    mov r0, #0x14
    mov r1, #0x1
    bl func_020057c8
    ldr r0, _LIT9
    bl func_ov007_021b2568
    ldr r0, _LIT10
    bl func_ov007_021b2a98
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000304
_LIT4: .word 0x04001000
_LIT5: .word data_02103da0
_LIT6: .word data_020c3e48
_LIT7: .word data_ov007_021b34c4
_LIT8: .word data_ov007_021b3488
_LIT9: .word data_ov007_022334d0
_LIT10: .word data_ov007_0223352c
