; func_0203444c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe46c
        .extern data_020fe478
        .extern func_02032644
        .extern func_0203268c
        .extern func_02032e80
        .extern func_02032f74
        .extern func_020330e4
        .extern func_020335b8
        .extern func_020335c8
        .extern func_020335d4
        .extern func_02033a48
        .extern func_02034194
        .extern func_020341a4
        .extern func_02034430
        .extern func_02093bfc
        .global func_0203444c
        .arm
func_0203444c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0203268c
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r1, #0x3c
    bl func_020330e4
    cmp r0, #0x0
    bge .L_30
    bl func_02093bfc
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_30:
    bl func_0203268c
    mov r1, #0x0
    mov r2, r1
    bl func_020335c8
    bl func_0203268c
    ldr r1, _LIT2
    bl func_02032e80
    bl func_0203268c
    ldr r1, _LIT3
    ldr r2, _LIT4
    ldr r3, _LIT5
    bl func_020335b8
    bl func_0203268c
    ldr r1, _LIT6
    bl func_02032f74
    bl func_0203268c
    ldr r2, _LIT7
    add r1, r5, #0x84
    str r2, [r0, #0xeb0]
    add r4, r1, #0x400
    bl func_02032644
    add r1, r5, #0x400
    mov r0, r0, lsl #0xb
    strh r0, [r1, #0x84]
    mov r0, #0x0
    strh r0, [r4, #0x2]
    strh r0, [r4, #0x4]
    mov r0, #0x3
    strb r0, [r4, #0x6]
    bl func_0203268c
    mov r2, r4
    mov r1, #0x8
    bl func_02033a48
    bl func_0203268c
    mov r1, #0x2
    mov r2, #0x400
    bl func_020335d4
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    bl func_02093bfc
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_02034194
_LIT1: .word func_020341a4
_LIT2: .word 0x4159584a
_LIT3: .word 0x00002a0f
_LIT4: .word data_020fe46c
_LIT5: .word data_020fe478
_LIT6: .word func_02034430
_LIT7: .word 0x00007530
