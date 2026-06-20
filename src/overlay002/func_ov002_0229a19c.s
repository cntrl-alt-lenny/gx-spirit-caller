; func_ov002_0229a19c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022d0f3c
        .extern data_ov002_022d0f78
        .extern data_ov002_022d0f7c
        .extern data_ov002_022d0f98
        .extern func_02001a34
        .extern func_02001d68
        .extern func_02005800
        .extern func_0200592c
        .extern func_0200ad0c
        .extern func_0200f854
        .extern func_0201d5c0
        .extern func_02021064
        .extern func_02021190
        .extern func_020211b4
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202bb88
        .extern func_0202c490
        .extern func_0202c4e8
        .extern func_0207f294
        .extern func_0207f420
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
        .extern func_0208e2f4
        .extern func_02094504
        .extern func_ov002_0229a0a4
        .global func_ov002_0229a19c
        .arm
func_ov002_0229a19c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, _LIT0
    mov r1, #0x3f
    ldrh r3, [ip]
    sub r0, ip, #0x2b4
    sub r2, r1, #0x4f
    orr r3, r3, #0x8000
    strh r3, [ip]
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, _LIT1
    sub r2, r1, #0x4f
    bl func_0208e2f4
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT2
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    ldr r1, _LIT3
    mov r2, #0x400
    bl func_02094504
    bl func_0200592c
    ldr r0, _LIT4
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    mov r0, #0x3
    bl func_0208d4f0
    mov r0, #0x10
    bl func_0208d3fc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c8cc
    mov r2, #0x2
    ldr r0, _LIT5
    mov r1, #0x4000000
    str r2, [r0]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x100
    str r0, [r1]
    ldrh r0, [r1, #0x8]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x8]
    bl func_0208c940
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x0
    bl func_0208c8b0
    ldr ip, _LIT6
    ldr r2, _LIT7
    ldr r1, [ip]
    mov r0, #0x9
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [ip]
    ldr r3, [ip]
    mov r1, #0x2
    and r2, r3, r2
    orr r2, r2, #0x10
    orr r2, r2, #0x200000
    str r2, [ip]
    bl func_0201d5c0
    ldr r1, _LIT6
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    bl func_0207f420
    mov r0, #0x20
    str r0, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, _LIT8
    mov r2, #0x80
    mov r3, r1
    bl func_0207f294
    mov r0, #0x20
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, #0x0
    mov r2, #0x80
    mov r3, r1
    bl func_0207f294
    mov r0, #0x24
    bl func_02001a34
    ldr r0, _LIT10
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT11
    bl func_0202adf8
    ldr r0, _LIT10
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT12
    bl func_0202c490
    bl func_0202c4e8
    bl func_02021064
    mov r0, #0x2
    mov r1, #0x1
    bl func_02021190
    mov r0, #0x3
    mov r1, #0x70
    bl func_020211b4
    mov r0, #0x70
    bl func_0200ad0c
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f854
    ldr r0, _LIT13
    bl func_02005800
    bl func_0202bb88
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word 0x04000304
_LIT1: .word 0x04001050
_LIT2: .word 0x07000400
_LIT3: .word 0x05000400
_LIT4: .word 0x000001ff
_LIT5: .word 0x04000540
_LIT6: .word 0x04001000
_LIT7: .word 0xffcfffef
_LIT8: .word data_ov002_022d0f7c
_LIT9: .word data_ov002_022d0f98
_LIT10: .word data_02104f4c
_LIT11: .word data_ov002_022d0f3c
_LIT12: .word data_ov002_022d0f78
_LIT13: .word func_ov002_0229a0a4
