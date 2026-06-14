; func_ov006_021bf5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cdd28
        .extern data_ov006_0224f448
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02004f58
        .extern func_02005554
        .extern func_020092c8
        .extern func_0202b6cc
        .extern func_0202bc00
        .extern func_0202c0c0
        .extern func_0202c44c
        .extern func_0208dd9c
        .extern func_02091554
        .extern func_02094504
        .extern func_ov006_021b6d1c
        .extern func_ov006_021bd6bc
        .global func_ov006_021bf5e4
        .arm
func_ov006_021bf5e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    mov r7, r0
    ldr r4, _LIT0
    bl func_0208dd9c
    ldr r3, [r7, #0x50]
    ldr r2, [r7, #0x40]
    add r5, r7, #0xa0
    mov r1, #0x24
    mla r6, r3, r1, r5
    cmp r2, #0x6
    add r5, r0, #0x40
    addne sp, sp, #0x48
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, r5, #0x5400
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094504
    add r0, r4, #0x6000
    ldr r0, [r0, #0x240]
    cmp r0, #0x0
    addne sp, sp, #0x48
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r7, #0x50]
    mov r0, r7
    bl func_ov006_021bd6bc
    movs r2, r0
    addmi sp, sp, #0x48
    movmi r0, #0x1
    ldmmiia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r6, #0x20]
    ldr r1, [r7, #0x50]
    mov r3, r0, lsl #0x1f
    mov r0, r4
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    movs r4, r0
    addeq sp, sp, #0x48
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0202b6cc
    ldr r1, _LIT1
    mov r6, r0
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r7, #0x4
    mov r1, #0x5
    bl func_02001d98
    cmp r6, #0x0
    beq .L_1fc
    sub r0, r6, #0x1
    bl func_020092c8
    cmp r0, #0x0
    bne .L_1e0
    mov r0, r4
    bl func_0202bc00
    cmp r0, #0x0
    beq .L_1fc
.L_1e0:
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r4, r0
    mov r0, r6
    bl func_0202c44c
    mov r6, r0
    b .L_204
.L_1fc:
    mov r4, #0x0
    mov r6, r4
.L_204:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_25c
    cmp r4, #0x0
    cmpne r6, #0x0
    beq .L_25c
    ldr r1, _LIT3
    add r0, sp, #0x8
    mov r2, r4
    mov r3, r6
    bl func_02091554
    mov r0, #0xb1
    str r0, [sp]
    mov ip, #0xc
    add r1, sp, #0x8
    mov r2, r5
    add r0, r7, #0x4
    mov r3, #0x6
    str ip, [sp, #0x4]
    bl func_02004f58
.L_25c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    cmpne r4, #0x0
    cmpne r6, #0x0
    beq .L_320
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005554
    add r1, r0, #0x6
    cmp r1, #0xae
    mov r8, #0x6
    ble .L_2b4
    rsb r8, r0, #0xae
    cmp r8, #0x1
    bge .L_2b4
    add r0, r7, #0x4
    mov r1, #0x4
    mov r8, #0x1
    bl func_02001d98
.L_2b4:
    mov r0, #0xaa
    mov r1, r4
    str r0, [sp]
    mov r4, #0xc
    mov r2, r5
    mov r3, r8
    add r0, r7, #0x4
    str r4, [sp, #0x4]
    bl func_02004f58
    add r0, r7, #0x4
    mov r1, #0x5
    bl func_02001d98
    mov r0, r6
    mov r1, r4
    mov r2, #0x5
    bl func_02005554
    rsb r3, r0, #0xaa
    mov r0, #0xb6
    cmp r3, #0x1
    str r0, [sp]
    mov r4, #0xc
    movlt r3, #0x1
    mov r1, r6
    mov r2, r5
    add r0, r7, #0x4
    str r4, [sp, #0x4]
    bl func_02004f58
.L_320:
    add r0, r7, #0x4
    mvn r1, #0x0
    bl func_02001d98
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_02104f4c
_LIT2: .word 0x0000049b
_LIT3: .word data_ov006_021cdd28
