; func_02041ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7f0
        .extern data_020fe80c
        .extern data_020fe9a8
        .extern func_02092748
        .extern func_020927b8
        .extern func_020aaddc
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_02041ca8
        .arm
func_02041ca8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r0, r5, #0x1000
    ldr r6, [r0, #0xa04]
    ldr r2, _LIT0
    ldr r1, _LIT1
    mov r0, r6
    add r4, r5, r2
    bl func_020ab0c4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT1
    mov r0, r6
    bl func_020ab0c4
    ldr r1, _LIT2
    add r6, r0, #0x4
    add r0, r5, r1
    bl func_020927b8
    ldr r0, [r4, #0x4]
    ldr r1, _LIT2
    sub r2, r0, r6
    add r0, r5, #0x1000
    str r2, [r0, #0xa30]
    add r0, r5, r1
    bl func_02092748
    ldr r0, [r4]
    ldr r1, _LIT3
    bl func_020ab0c4
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    bl func_020aaddc
    add r7, r4, r0
    ldr r1, _LIT4
    mov r0, r7
    bl func_020ab0c4
    mov r4, r0
    ldr r0, _LIT2
    ldrsb r6, [r4]
    mov r1, #0x0
    add r0, r5, r0
    strb r1, [r4]
    bl func_020927b8
    mov r0, r7
    bl func_020ace00
    add r1, r5, #0x1000
    ldr r2, _LIT2
    str r0, [r1, #0xa2c]
    add r0, r5, r2
    bl func_02092748
    strb r6, [r4]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00001a04
_LIT1: .word data_020fe7f0
_LIT2: .word 0x00001a14
_LIT3: .word data_020fe9a8
_LIT4: .word data_020fe80c
