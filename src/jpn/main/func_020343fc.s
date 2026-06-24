; func_020343fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe38c
        .extern data_020fe398
        .extern func_020325f0
        .extern func_02032638
        .extern func_02032e2c
        .extern func_02032f20
        .extern func_02033090
        .extern func_02033568
        .extern func_02033578
        .extern func_02033584
        .extern func_020339f8
        .extern func_02034144
        .extern func_02034154
        .extern func_020343e0
        .extern func_02093b08
        .global func_020343fc
        .arm
func_020343fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02032638
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r1, #0x3c
    bl func_02033090
    cmp r0, #0x0
    bge .L_30
    bl func_02093b08
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_30:
    bl func_02032638
    mov r1, #0x0
    mov r2, r1
    bl func_02033578
    bl func_02032638
    ldr r1, _LIT2
    bl func_02032e2c
    bl func_02032638
    ldr r1, _LIT3
    ldr r2, _LIT4
    ldr r3, _LIT5
    bl func_02033568
    bl func_02032638
    ldr r1, _LIT6
    bl func_02032f20
    bl func_02032638
    ldr r2, _LIT7
    add r1, r5, #0x84
    str r2, [r0, #0xea8]
    add r4, r1, #0x400
    bl func_020325f0
    add r1, r5, #0x400
    mov r0, r0, lsl #0xb
    strh r0, [r1, #0x84]
    mov r0, #0x0
    strh r0, [r4, #0x2]
    strh r0, [r4, #0x4]
    mov r0, #0x3
    strb r0, [r4, #0x6]
    bl func_02032638
    mov r2, r4
    mov r1, #0x8
    bl func_020339f8
    bl func_02032638
    mov r1, #0x2
    mov r2, #0x400
    bl func_02033584
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    bl func_02093b08
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_02034144
_LIT1: .word func_02034154
_LIT2: .word 0x4159584a
_LIT3: .word 0x00002a0f
_LIT4: .word data_020fe38c
_LIT5: .word data_020fe398
_LIT6: .word func_020343e0
_LIT7: .word 0x00007530
