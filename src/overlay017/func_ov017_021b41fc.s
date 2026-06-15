; func_ov017_021b41fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_02005dac
        .extern func_020944a4
        .extern func_ov017_021b40d8
        .global func_ov017_021b41fc
        .arm
func_ov017_021b41fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    ldr r3, _LIT1
    ldr r7, [r4]
    ldr r5, _LIT2
    umull r4, r3, r7, r3
    mov r3, r3, lsr #0xb
    mov r6, r1
    umull r5, r1, r3, r5
    ldr r4, _LIT3
    mov r1, r1, lsr #0x5
    umull r5, r4, r7, r4
    sub r5, r7, r4
    add r4, r4, r5, lsr #0x1
    mov r7, #0x3c
    umull r1, r5, r7, r1
    mov r7, r0
    mov r5, r2
    rsb r1, r1, r3
    ldr ip, _LIT4
    mov r4, r4, lsr #0x11
    cmp ip, r4
    movlt r4, ip
    mov ip, #0x2
    movlt r1, #0x3b
    mov r0, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp]
    bl func_ov017_021b40d8
    sub r1, r6, #0x18
    and r0, r5, #0xff
    ldr r2, _LIT5
    mov r1, r1, lsl #0x17
    orr r0, r0, #0x40000000
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x4]
    strh r2, [sp, #0x8]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x4
    mov r2, #0x6
    bl func_020944a4
    mov r3, #0x0
    str r3, [sp]
    mov r0, r7
    mov r1, r4
    sub r2, r6, #0x18
    mov r3, r5
    bl func_ov017_021b40d8
    add r1, r5, #0x1
    and r1, r1, #0xff
    sub r0, r0, #0x10
    orr r1, r1, #0x40000000
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x7
    ldr r1, _LIT6
    str r0, [sp, #0x4]
    strh r1, [sp, #0x8]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x4
    mov r2, #0x6
    bl func_020944a4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x91a2b3c5
_LIT2: .word 0x88888889
_LIT3: .word 0x36b06e71
_LIT4: .word 0x0000270f
_LIT5: .word 0x00001686
_LIT6: .word 0x00006687
