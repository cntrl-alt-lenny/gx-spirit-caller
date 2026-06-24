; func_02067610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101504
        .extern data_021016f0
        .extern data_0219ea8c
        .extern data_0219eaa4
        .extern func_02045398
        .extern func_020552bc
        .extern func_020670e0
        .extern func_02067194
        .extern func_020a9698
        .extern func_020a9828
        .extern func_020a985c
        .extern func_020aad04
        .global func_02067610
        .arm
func_02067610:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x40
    movs r5, r0
    mov r8, r1
    mov r4, r2
    mov r7, r3
    ldreq r5, _LIT0
    beq .L_30
    mov r0, #0x110
    bl func_02045398
    str r0, [r5]
    ldr r5, [r5]
.L_30:
    bl func_020552bc
    bl func_020a985c
    mov r1, r7
    add r0, r5, #0x4
    bl func_020aad04
    ldr r1, [sp, #0x58]
    add r0, r5, #0x44
    bl func_020aad04
    str r4, [r5, #0xc0]
    mov r6, #0x0
    str r6, [r5, #0xac]
    str r6, [r5, #0xb0]
    str r8, [r5]
    mov r1, #0x1
    ldr r0, [sp, #0x7c]
    str r1, [r5, #0xb8]
    ldr r1, [sp, #0x64]
    str r0, [r5, #0x10c]
    ldr r0, [sp, #0x68]
    str r1, [r5, #0x88]
    ldr r1, [sp, #0x6c]
    str r0, [r5, #0x8c]
    ldr r0, [sp, #0x70]
    str r1, [r5, #0x90]
    ldr r1, [sp, #0x74]
    str r0, [r5, #0x94]
    ldr r0, [sp, #0x78]
    str r1, [r5, #0x98]
    str r0, [r5, #0x9c]
    str r6, [r5, #0xa0]
    str r6, [r5, #0xa4]
    ldr r0, [sp, #0x5c]
    str r6, [r5, #0xd4]
    str r0, [r5, #0xbc]
    ldr r0, [sp, #0x60]
    str r6, [r5, #0xc4]
    str r0, [r5, #0xc8]
    str r6, [r5, #0x104]
    add r0, r5, #0x100
    strh r6, [r0, #0x8]
    str r6, [r5, #0xa8]
    str r6, [r5, #0xb4]
    ldr r4, _LIT1
    ldr r8, _LIT2
.L_e0:
    bl func_020a9828
    smull r1, r2, r4, r0
    add r2, r0, r2
    add r3, r5, r6
    add r6, r6, #0x1
    mov r2, r2, asr #0x7
    mov r1, r0, lsr #0x1f
    add r2, r1, r2
    smull r1, r2, r8, r2
    sub r2, r0, r1
    strb r2, [r3, #0x84]
    cmp r6, #0x4
    blt .L_e0
    mov r2, #0x0
    mvn r1, #0x0
.L_11c:
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xd8]
    cmp r2, #0xa
    blt .L_11c
    mov r1, #0x0
    ldr r0, _LIT3
    str r1, [r5, #0x100]
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_14c
    bl func_02067194
.L_14c:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_198
    ldr r0, _LIT4
    ldrsb r4, [r0]
    cmp r4, #0x0
    bne .L_178
    ldr r1, _LIT5
    add r0, sp, #0x0
    mov r2, r7
    bl func_020a9698
.L_178:
    cmp r4, #0x0
    ldrne r0, _LIT4
    ldr r1, _LIT6
    addeq r0, sp, #0x0
    add r2, r5, #0xcc
    mov r3, #0x0
    bl func_020670e0
    b .L_19c
.L_198:
    mov r0, #0x1
.L_19c:
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x3
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101504
_LIT1: .word 0x80808081
_LIT2: .word 0x000000ff
_LIT3: .word data_0219ea8c
_LIT4: .word data_0219eaa4
_LIT5: .word data_021016f0
_LIT6: .word 0x00006cfc
