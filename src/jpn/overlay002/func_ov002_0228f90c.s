; func_ov002_0228f90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b854
        .extern func_0202e274
        .extern func_ov002_021c8400
        .extern func_ov002_02253600
        .extern func_ov002_02257668
        .extern func_ov002_0225968c
        .extern func_ov002_0225974c
        .extern func_ov002_0228c474
        .extern func_ov002_0228c754
        .extern func_ov002_0228ca38
        .extern func_ov002_0228ccb0
        .extern func_ov002_0228ce84
        .extern func_ov002_0228cf9c
        .extern func_ov002_0228da7c
        .extern func_ov002_0228dad4
        .extern func_ov002_0228db80
        .extern func_ov002_0228dd48
        .global func_ov002_0228f90c
        .arm
func_ov002_0228f90c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3, #0x48c]
    mov r6, r1
    mov r1, r2
    bl func_ov002_02257668
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    str r5, [r3]
    mov r4, r0
    str r5, [r2, #0xd6c]
    cmp r6, r1
    bgt .L_1de8
    bge .L_22bc
    ldr r0, _LIT4
    cmp r6, r0
    bgt .L_1c68
    bge .L_2264
    ldr r2, _LIT5
    cmp r6, r2
    bgt .L_1bc0
    bge .L_2314
    ldr r1, _LIT6
    cmp r6, r1
    bgt .L_1b7c
    bge .L_22bc
    sub r0, r2, #0x328
    cmp r6, r0
    bgt .L_1b6c
    bge .L_236c
    cmp r6, #0x1
    beq .L_2264
    b .L_24cc
.L_1b6c:
    sub r0, r1, #0xa9
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1b7c:
    add r0, r1, #0x64
    cmp r6, r0
    bgt .L_1b9c
    bge .L_22bc
    add r0, r1, #0x4b
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1b9c:
    add r0, r1, #0xd5
    cmp r6, r0
    bgt .L_1bb0
    beq .L_2264
    b .L_24cc
.L_1bb0:
    add r0, r1, #0xf3
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1bc0:
    add r1, r2, #0xe4
    cmp r6, r1
    bgt .L_1c1c
    add r0, r2, #0xe3
    cmp r6, r0
    blt .L_1bec
    beq .L_239c
    mov r0, r1
    cmp r6, r0
    beq .L_2080
    b .L_24cc
.L_1bec:
    add r0, r2, #0x81
    cmp r6, r0
    bgt .L_1c0c
    bge .L_2264
    add r0, r2, #0x6a
    cmp r6, r0
    beq .L_236c
    b .L_24cc
.L_1c0c:
    add r0, r2, #0xd5
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1c1c:
    sub r1, r0, #0x55
    cmp r6, r1
    bgt .L_1c3c
    bge .L_22bc
    sub r0, r0, #0x8f
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1c3c:
    sub r1, r0, #0x4f
    cmp r6, r1
    bgt .L_1c58
    sub r0, r0, #0x4f
    cmp r6, r0
    beq .L_239c
    b .L_24cc
.L_1c58:
    sub r0, r0, #0x3b
    cmp r6, r0
    beq .L_239c
    b .L_24cc
.L_1c68:
    sub r2, r1, #0x104
    cmp r6, r2
    bgt .L_1d14
    bge .L_2264
    add r2, r0, #0xde
    cmp r6, r2
    bgt .L_1cc0
    mov r1, r2
    cmp r6, r1
    bge .L_2080
    add r1, r0, #0x59
    cmp r6, r1
    bgt .L_1cb0
    bge .L_236c
    add r0, r0, #0x1f
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1cb0:
    add r0, r0, #0xc7
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1cc0:
    sub r2, r1, #0x17c
    cmp r6, r2
    bgt .L_1ce8
    mov r0, r2
    cmp r6, r0
    bge .L_2314
    sub r0, r1, #0x1c0
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1ce8:
    sub r2, r1, #0x154
    cmp r6, r2
    bgt .L_1d04
    mov r0, r2
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1d04:
    add r0, r0, #0x1b8
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1d14:
    add r2, r0, #0x254
    cmp r6, r2
    bgt .L_1da4
    sub r2, r1, #0x8c
    cmp r6, r2
    blt .L_1d50
    sub r1, r1, #0x8c
    cmp r6, r1
    addne r1, r0, #0x250
    cmpne r6, r1
    beq .L_2264
    add r0, r0, #0x254
    cmp r6, r0
    beq .L_2314
    b .L_24cc
.L_1d50:
    sub r2, r1, #0x9d
    cmp r6, r2
    bgt .L_1d78
    mov r0, r2
    cmp r6, r0
    bge .L_2264
    sub r0, r1, #0xff
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1d78:
    sub r2, r1, #0x97
    cmp r6, r2
    bgt .L_1d94
    mov r0, r2
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1d94:
    add r0, r0, #0x24c
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1da4:
    sub r0, r1, #0x4c
    cmp r6, r0
    bgt .L_1dc4
    bge .L_2264
    sub r0, r1, #0x67
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1dc4:
    sub r0, r1, #0x37
    cmp r6, r0
    bgt .L_1dd8
    beq .L_24a0
    b .L_24cc
.L_1dd8:
    sub r0, r1, #0x4
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1de8:
    ldr r0, _LIT7
    cmp r6, r0
    bgt .L_1f4c
    bge .L_2264
    sub r2, r0, #0xec
    cmp r6, r2
    bgt .L_1ea4
    bge .L_2474
    add r2, r1, #0x4d
    cmp r6, r2
    bgt .L_1e50
    bge .L_2314
    sub r2, r0, #0x160
    cmp r6, r2
    bgt .L_1e40
    sub r0, r0, #0x160
    cmp r6, r0
    bge .L_2264
    add r0, r1, #0x19
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1e40:
    add r0, r1, #0x4b
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1e50:
    sub r2, r0, #0x14c
    cmp r6, r2
    bgt .L_1e78
    sub r0, r0, #0x14c
    cmp r6, r0
    bge .L_2400
    add r0, r1, #0x53
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1e78:
    add r2, r1, #0x6f
    cmp r6, r2
    bgt .L_1e94
    mov r0, r2
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1e94:
    sub r0, r0, #0x10c
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1ea4:
    sub r1, r0, #0x77
    cmp r6, r1
    bgt .L_1ee4
    bge .L_2264
    sub r1, r0, #0xc3
    cmp r6, r1
    bgt .L_1ed4
    bge .L_2264
    sub r0, r0, #0xc9
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1ed4:
    sub r0, r0, #0xb5
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1ee4:
    sub r1, r0, #0x19
    cmp r6, r1
    bgt .L_1f04
    bge .L_24a0
    sub r0, r0, #0x1a
    cmp r6, r0
    beq .L_2080
    b .L_24cc
.L_1f04:
    sub r1, r0, #0x18
    cmp r6, r1
    bgt .L_1f20
    sub r0, r0, #0x18
    cmp r6, r0
    beq .L_2474
    b .L_24cc
.L_1f20:
    sub r1, r0, #0x13
    cmp r6, r1
    bgt .L_24cc
    sub r1, r0, #0x17
    cmp r6, r1
    blt .L_24cc
    beq .L_24a0
    sub r0, r0, #0x13
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1f4c:
    add r1, r0, #0x120
    cmp r6, r1
    bgt .L_1fe8
    bge .L_2264
    add r1, r0, #0xea
    cmp r6, r1
    bgt .L_1f9c
    bge .L_2264
    add r1, r0, #0x64
    cmp r6, r1
    bgt .L_1f8c
    bge .L_2264
    add r0, r0, #0x16
    cmp r6, r0
    beq .L_2080
    b .L_24cc
.L_1f8c:
    add r0, r0, #0x74
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1f9c:
    add r1, r0, #0xec
    cmp r6, r1
    bgt .L_1fbc
    bge .L_2264
    add r0, r0, #0xeb
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1fbc:
    add r1, r0, #0xed
    cmp r6, r1
    bgt .L_1fd8
    add r0, r0, #0xed
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_1fd8:
    add r0, r0, #0xf4
    cmp r6, r0
    beq .L_22bc
    b .L_24cc
.L_1fe8:
    ldr r1, _LIT8
    cmp r6, r1
    bgt .L_203c
    bge .L_2314
    sub r0, r1, #0xc
    cmp r6, r0
    bgt .L_2018
    bge .L_24a0
    sub r0, r1, #0xe
    cmp r6, r0
    beq .L_242c
    b .L_24cc
.L_2018:
    sub r0, r1, #0x6
    cmp r6, r0
    bgt .L_202c
    beq .L_2264
    b .L_24cc
.L_202c:
    sub r0, r1, #0x3
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_203c:
    add r0, r1, #0x51
    cmp r6, r0
    bgt .L_205c
    bge .L_2474
    add r0, r1, #0x15
    cmp r6, r0
    beq .L_2474
    b .L_24cc
.L_205c:
    add r0, r1, #0x78
    cmp r6, r0
    bgt .L_2070
    beq .L_2264
    b .L_24cc
.L_2070:
    add r0, r1, #0x79
    cmp r6, r0
    beq .L_2264
    b .L_24cc
.L_2080:
    ldr r1, _LIT9
    cmp r6, r1
    bgt .L_20a0
    bge .L_21b8
    sub r0, r1, #0x198
    cmp r6, r0
    beq .L_2154
    b .L_2264
.L_20a0:
    add r0, r1, #0x384
    cmp r6, r0
    bgt .L_20b4
    beq .L_20c4
    b .L_2264
.L_20b4:
    add r0, r1, #0x3b4
    cmp r6, r0
    beq .L_2228
    b .L_2264
.L_20c4:
    ldr r2, _LIT10
    ldr r0, _LIT11
    and r1, r5, #0x1
    mla r9, r1, r0, r2
    mov r8, r5, lsl #0x4
    add sl, r9, #0x30
    mov r7, #0x0
    mov r6, #0x1
.L_20e4:
    tst r4, r6, lsl r8
    beq .L_2138
    ldr r0, [r9, #0x40]
    mov r1, r0, lsr #0x16
    mov r0, r0, lsr #0x17
    and r1, r1, #0x1
    and r0, r0, #0x1
    adds r0, r1, r0
    beq .L_2138
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    cmp r0, #0x4
    bgt .L_2138
    mov r0, r5
    mov r1, r7
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2138:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x1
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_20e4
    b .L_2264
.L_2154:
    mov r8, r5, lsl #0x4
    mov r9, #0x0
    mov r7, #0x1
.L_2160:
    tst r4, r7, lsl r8
    beq .L_21a4
    mov r0, r5
    mov r1, r9
    bl func_ov002_021c8400
    mov r2, r0
    mov r0, r5
    mov r1, r6
    bl func_ov002_02253600
    cmp r0, #0x0
    beq .L_21a4
    mov r0, r5
    mov r1, r9
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_21a4:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x1
    blt .L_2160
    b .L_2264
.L_21b8:
    ldr r2, _LIT10
    ldr r0, _LIT11
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    mov r7, r5, lsl #0x4
    add r8, r0, #0x30
    mov r9, #0x0
    mov r6, #0x1
.L_21d8:
    tst r4, r6, lsl r7
    beq .L_2210
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e274
    cmp r0, #0x0
    bne .L_2210
    mov r0, r5
    mov r1, r9
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2210:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r7, r7, #0x1
    add r8, r8, #0x14
    blt .L_21d8
    b .L_2264
.L_2228:
    mov r0, r5, lsl #0x4
    add r2, r0, #0x5
    mov r1, #0x5
    mov r0, #0x1
.L_2238:
    tst r4, r0, lsl r2
    beq .L_2254
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2254:
    add r1, r1, #0x1
    cmp r1, #0xa
    add r2, r2, #0x1
    blt .L_2238
.L_2264:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0228ccb0
    movs r1, r0
    mov r2, #0x0
    bmi .L_2294
    mov r0, r6
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2294:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228cf9c
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_22bc:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_0228ccb0
    movs r1, r0
    bmi .L_22ec
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_22ec:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228ce84
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2314:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0228ccb0
    movs r1, r0
    bmi .L_2344
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2344:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228ce84
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_236c:
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0228c474
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_239c:
    rsb r6, r5, #0x1
    mvn r2, #0x0
    mov r0, r6
    mov r1, r4
    mov r3, r2
    bl func_ov002_0228c474
    movs r1, r0
    bmi .L_23d0
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_23d0:
    mov r2, #0x1
    mov r0, r5
    mov r1, r4
    mov r3, r2
    bl func_ov002_0228c474
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2400:
    ldr r2, _LIT12
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_242c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x48c]
    ldrh r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_2448
    bl func_ov002_0225974c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2448:
    ldr r2, _LIT13
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2474:
    ldr r2, _LIT14
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_24a0:
    ldr r2, _LIT15
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_24cc
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_24cc:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    bl func_ov002_0228ca38
    movs r1, r0
    bmi .L_24f8
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_24f8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228ca38
    movs r1, r0
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_0225968c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd444
_LIT2: .word 0x0000179f
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x000014c5
_LIT5: .word 0x00001327
_LIT6: .word 0x000011f0
_LIT7: .word 0x00001941
_LIT8: .word 0x00001aa6
_LIT9: .word 0x000015a3
_LIT10: .word data_ov002_022cf08c
_LIT11: .word 0x00000868
_LIT12: .word func_ov002_0228dad4
_LIT13: .word func_ov002_0228dd48
_LIT14: .word func_ov002_0228da7c
_LIT15: .word func_ov002_0228db80
