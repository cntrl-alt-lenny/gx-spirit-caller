; func_ov004_021d0168 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov004_02209dfc
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02022b74
        .extern func_0202c0c0
        .extern func_0202c93c
        .extern func_0202c9c0
        .extern func_0202cca4
        .extern func_0208df0c
        .extern func_0208e1cc
        .extern func_02091554
        .extern func_02094504
        .extern func_020aadf8
        .global func_ov004_021d0168
        .arm
func_ov004_021d0168:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x64
    movs r4, r0
    movne r5, #0x1
    moveq r5, #0x0
    bl func_0202c93c
    ldr r0, [r0]
    cmp r5, r0
    beq .L_680
    mov r0, r5
    bl func_0202c9c0
    cmp r5, #0x0
    bne .L_65c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT1
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df0c
    mov r5, r0
    bl func_0208e1cc
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x600
    bl func_02094504
    mov r0, #0x0
    add r1, r5, #0x220
    mov r2, #0x800
    bl func_02094504
    mov r0, r6
    mov r1, #0xc
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r6
    add r2, r5, #0x220
    bl func_02004f58
    bl func_0208e1cc
    add r1, r0, #0x4c0
    ldr r0, _LIT1
    mov r2, #0x11
    mov r3, #0xf
    bl func_02001e94
.L_65c:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_680:
    bl func_0202c93c
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    bl func_0202c93c
    ldr r0, [r0, #0x4]
    cmp r4, r0
    beq .L_6e8
    ldr r1, _LIT3
    add r0, sp, #0x44
    mov r2, r4
    bl func_02091554
    add r1, sp, #0x8
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    add r0, sp, #0xc
    add r1, sp, #0x44
    bl func_020aadf8
    mov r2, #0x10000
    mov r1, #0x1000
    add r0, sp, #0x8
    str r2, [sp, #0x2c]
    str r1, [sp, #0x30]
    bl func_02022b74
.L_6e8:
    mov r0, r4
    bl func_0202cca4
    add sp, sp, #0x64
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02102c90
_LIT2: .word 0x000003ca
_LIT3: .word data_ov004_02209dfc
