; func_0207a544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_0207a334
        .extern func_0207af28
        .extern func_0207b038
        .extern func_0207b13c
        .extern func_0209f7fc
        .global func_0207a544
        .arm
func_0207a544:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_914
    b .L_718
    b .L_8ec
    b .L_914
    b .L_914
    b .L_914
    b .L_914
    b .L_900
    b .L_914
    b .L_914
    b .L_914
    b .L_914
    b .L_900
    b .L_900
.L_718:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x9
    bgt .L_758
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_938
    b .L_7e0
    b .L_768
    b .L_768
.L_758:
    cmp r0, #0x1a
    ldmeqia sp!, {r4, lr}
    bxeq lr
    b .L_8c0
.L_768:
    ldr r1, _LIT0
    ldr r2, [r1]
    add r0, r2, #0x2000
    ldr r0, [r0, #0x260]
    sub r0, r0, #0x8
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_938
    b .L_7a8
    b .L_7b8
    b .L_79c
    b .L_938
    b .L_7d4
.L_79c:
    add r0, r2, #0x2200
    mov r1, #0x0
    strh r1, [r0, #0x82]
.L_7a8:
    mov r0, #0xc
    bl func_0207b038
    ldmia sp!, {r4, lr}
    bx lr
.L_7b8:
    add r0, r2, #0x2200
    mov r2, #0x0
    strh r2, [r0, #0x82]
    ldr r0, [r1]
    mov r1, #0x6
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
.L_7d4:
    bl func_0207af28
    ldmia sp!, {r4, lr}
    bx lr
.L_7e0:
    ldr r1, _LIT0
    ldr r3, [r1]
    add r0, r3, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0xc
    bne .L_80c
    mov r0, #0x8
    bl func_0207b038
    bl func_0207af28
    ldmia sp!, {r4, lr}
    bx lr
.L_80c:
    ldrh r2, [r4, #0xa]
    cmp r2, #0x1
    bcc .L_8b4
    ldr r0, _LIT1
    cmp r2, r0
    bhi .L_8b4
    add r0, r3, #0x2200
    strh r2, [r0, #0x82]
    ldr r1, [r1]
    ldr r0, _LIT2
    add r1, r1, #0x1500
    mov r2, #0x620
    bl func_0209f7fc
    cmp r0, #0x2
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x3
    beq .L_888
    cmp r0, #0x8
    bne .L_888
    mov r0, #0xc
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT3
    ldr r1, [r0]
    mov r0, #0x1
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b13c
    ldmia sp!, {r4, lr}
    bx lr
.L_888:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT4
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b13c
    ldmia sp!, {r4, lr}
    bx lr
.L_8b4:
    bl func_0207af28
    ldmia sp!, {r4, lr}
    bx lr
.L_8c0:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldrh r2, [r4, #0x8]
    ldr r0, [r0]
    ldr r3, _LIT5
    add r1, r0, #0x2140
    mov r0, #0x7
    bl func_0207b13c
    ldmia sp!, {r4, lr}
    bx lr
.L_8ec:
    ldr r0, _LIT0
    ldrh r1, [r4, #0xe]
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0xf8]
.L_900:
    mov r0, #0x8
    bl func_0207b038
    bl func_0207af28
    ldmia sp!, {r4, lr}
    bx lr
.L_914:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT6
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b13c
.L_938:
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x000007d7
_LIT2: .word func_0207a334
_LIT3: .word 0x000007ed
_LIT4: .word 0x000007f6
_LIT5: .word 0x00000804
_LIT6: .word 0x0000081b
