; func_ov002_022464ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabbc
        .extern data_ov002_022cd664
        .extern data_ov002_022cd888
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021ae3c0
        .extern func_ov002_021af8f0
        .extern func_ov002_021b03e8
        .extern func_ov002_02245018
        .extern func_ov002_02245cec
        .extern func_ov002_022460f0
        .extern func_ov002_02258080
        .extern func_ov002_022581cc
        .extern func_ov002_022582cc
        .extern func_ov002_02258418
        .extern func_ov002_022591d0
        .extern func_ov002_0228c0c0
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .global func_ov002_022464ec
        .arm
func_ov002_022464ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    ldr r3, [r1, #0x680]
    ldr r4, [r1, #0x684]
    cmp r3, #0x15
    bgt .L_72c
    bge .L_9e8
    cmp r3, #0xb
    bgt .L_720
    cmp r3, #0x0
    addge pc, pc, r3, lsl #0x2
    b .L_b18
    b .L_748
    b .L_780
    b .L_8b8
    b .L_b18
    b .L_b18
    b .L_780
    b .L_b18
    b .L_b18
    b .L_b18
    b .L_b18
    b .L_8f8
    b .L_91c
.L_720:
    cmp r3, #0x14
    beq .L_9ac
    b .L_b18
.L_72c:
    cmp r3, #0x1e
    bgt .L_73c
    beq .L_a38
    b .L_b18
.L_73c:
    cmp r3, #0x32
    beq .L_adc
    b .L_b18
.L_748:
    bl func_ov002_021b03e8
    cmp r0, #0x0
    mov r1, #0x0
    beq .L_76c
    ldr r0, _LIT0
    add sp, sp, #0x100
    str r1, [r0, #0x688]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_76c:
    ldr r0, _LIT0
    str r1, [r0, #0x68c]
    ldr r1, [r0, #0x680]
    add r1, r1, #0x1
    str r1, [r0, #0x680]
.L_780:
    ldr r0, _LIT0
    ldrb r0, [r0, #0x5dc]
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_7c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02245cec
    cmp r0, #0x0
    bne .L_7c4
    ldr r0, _LIT0
    mov r1, #0x32
    str r1, [r0, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_7c4:
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_81c
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02245cec
    cmp r0, #0x0
    beq .L_80c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0228c0c0
    cmp r0, #0x0
    beq .L_80c
    ldr r0, _LIT0
    mov r1, #0xb
    str r1, [r0, #0x680]
    b .L_8ac
.L_80c:
    ldr r0, _LIT0
    mov r1, #0x32
    str r1, [r0, #0x680]
    b .L_8ac
.L_81c:
    cmp r0, #0x2
    bne .L_834
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0x680]
    b .L_8ac
.L_834:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02245cec
    cmp r0, #0x0
    add r0, sp, #0x0
    bne .L_874
    mov r1, #0xcc
    bl func_ov002_0229cc78
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_ov002_0229cca8
    add r0, sp, #0x0
    mov r1, #0xce
    bl func_ov002_0229cca8
    mov r1, #0x0
    b .L_888
.L_874:
    bl func_ov002_022460f0
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02245cec
    add r1, r0, #0x1
.L_888:
    ldr r0, _LIT0
    ldr r0, [r0, #0x680]
    cmp r0, #0x5
    moveq r1, #0x3
    add r0, sp, #0x0
    bl func_ov002_021ae3c0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x680]
.L_8ac:
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_8b8:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd44]
    cmp r2, #0x0
    bne .L_8dc
    mov r0, #0x32
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_8dc:
    mov r2, #0xa
    str r2, [r1, #0x680]
    mov r1, #0x0
    str r1, [r0, #0xd50]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_8f8:
    mov r0, #0x4
    bl func_ov002_022591d0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x680]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x680]
    ldmia sp!, {r4, pc}
.L_91c:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd50]
    cmp r2, #0x0
    bne .L_940
    mov r0, #0x5
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_940:
    ldr r2, [r0, #0xd64]
    cmp r2, #0x1
    beq .L_968
    cmp r2, #0x3
    bne .L_998
    mov r0, #0x1e
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_968:
    ldr r3, [r0, #0xd74]
    ldr r0, [r0, #0xd70]
    sub r1, r3, #0xb
    mvn r2, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x680]
    mov r0, #0x1
    sub r2, r2, #0x1
    str r2, [r1, #0x680]
    ldmia sp!, {r4, pc}
.L_998:
    sub r0, r3, #0x1
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_9ac:
    mov r0, #0x1
    bl func_ov002_02245018
    ldr r2, _LIT0
    mov r0, #0x0
    str r0, [r2, #0x68c]
    ldr r1, _LIT4
    add sp, sp, #0x100
    ldr r3, [r1, #0x300]
    mov r0, #0x1
    bic r3, r3, #0x20
    str r3, [r1, #0x300]
    ldr r1, [r2, #0x680]
    add r1, r1, #0x1
    str r1, [r2, #0x680]
    ldmia sp!, {r4, pc}
.L_9e8:
    ldr r0, _LIT4
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0x68c]
    cmp r0, #0x0
    bne .L_a24
    mov r0, #0x32
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_a24:
    mov r0, #0x1e
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_a38:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd74]
    sub r1, r2, #0xb
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_aa4
    b .L_a64
    b .L_a94
    b .L_a94
    b .L_a94
    b .L_a94
.L_a64:
    ldr r0, [r0, #0xd5c]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_a80
    mov r0, #0x0
    bl func_ov002_022581cc
    b .L_aac
.L_a80:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_ov002_022582cc
    b .L_aac
.L_a94:
    ldr r1, [r0, #0xd70]
    mov r0, #0x0
    bl func_ov002_02258418
    b .L_aac
.L_aa4:
    mov r0, #0x0
    bl func_ov002_02258080
.L_aac:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    addne sp, sp, #0x100
    mov r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0x68c]
    str r2, [r1, #0x688]
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
.L_adc:
    rsb r2, r4, #0x1
    ldr r0, _LIT3
    str r2, [r1, #0x684]
    ldr r0, [r0, #0xcec]
    cmp r2, r0
    mov r0, #0x0
    strne r0, [r1, #0x680]
    addne sp, sp, #0x100
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    str r0, [r1, #0x5d4]
    str r0, [r1, #0x688]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_b18:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022cabbc
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cd888
