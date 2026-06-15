; func_0203bc28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b314
        .extern data_0219b328
        .extern data_0219b330
        .extern data_0219b36c
        .extern data_0219b384
        .extern data_0219d388
        .extern func_02038c84
        .extern func_0203bbac
        .extern func_02092748
        .extern func_020927b8
        .extern func_02092904
        .global func_0203bc28
        .arm
func_0203bc28:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r8, r0
    mov r2, r2, lsl #0x10
    ldr lr, [r4]
    mov ip, r2, lsr #0x10
    ldr r4, _LIT1
    mov r5, #0x1
    ldr r0, _LIT2
    mov r2, #0xc
    str r5, [r4]
    mov r6, r1
    mov r7, r3
    mla r5, ip, r2, lr
    bl func_020927b8
    ldr r0, _LIT3
    bl func_020927b8
    ldr r2, _LIT4
    mov r0, #0xc4
    mla r4, r6, r0, r2
    mov r0, #0x0
    str r0, [r4, #0x74]
    str r0, [r4, #0x78]
    str r0, [r4, #0x7c]
    str r0, [r4, #0x80]
    str r0, [r4, #0x84]
    mov r1, #0xff
    strb r0, [r4, #0xc1]
    strb r1, [r4, #0xaf]
    strb r1, [r4, #0xae]
    ldrh r0, [r5, #0x2]
    mov r1, #0xe0
    mov r6, #0x1
    strh r0, [r4, #0xac]
    str r7, [r4, #0x68]
    ldrb r0, [r5, #0x7]
    sub r2, r1, #0x100
    tst r0, #0x40
    ldr r0, _LIT5
    movne r6, #0x2
    ldr r0, [r0]
    strh r6, [r4, #0xb8]
    bl func_02038c84
    cmp r0, #0x0
    beq .L_2dc
    mov r1, #0xe0
    str r0, [r4, #0x78]
    bl func_02092904
    ldr r0, _LIT5
    mov r7, r6, lsl #0xb
    ldr r0, [r0]
    add r1, r7, #0x20
    mvn r2, #0x1f
    bl func_02038c84
    cmp r0, #0x0
    beq .L_2dc
    add r1, r7, #0x20
    str r0, [r4, #0x7c]
    bl func_02092904
    ldr r0, _LIT5
    mov r7, r6, lsl #0xc
    ldr r0, [r0]
    add r1, r7, #0x20
    mvn r2, #0x1f
    bl func_02038c84
    cmp r0, #0x0
    beq .L_2dc
    str r0, [r4, #0x80]
    add r1, r7, #0x20
    bl func_02092904
    ldrb r0, [r5, #0x7]
    tst r0, #0x20
    beq .L_2a8
    ldr r0, _LIT5
    mov r5, r6, lsl #0xa
    ldr r0, [r0]
    add r1, r5, #0x20
    mvn r2, #0x1f
    bl func_02038c84
    cmp r0, #0x0
    beq .L_2dc
    add r1, r5, #0x20
    str r0, [r4, #0x84]
    bl func_02092904
.L_2a8:
    str r8, [r4]
    ldr r0, _LIT3
    str r4, [r8]
    mov r1, #0xa000
    strh r1, [r4, #0xb0]
    bl func_02092748
    ldr r0, _LIT2
    bl func_02092748
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2dc:
    mov r0, r4
    bl func_0203bbac
    ldr r0, _LIT3
    bl func_02092748
    ldr r0, _LIT2
    bl func_02092748
    ldr r1, _LIT1
    mov r0, #0x0
    str r0, [r1]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b314
_LIT1: .word data_0219b328
_LIT2: .word data_0219b384
_LIT3: .word data_0219b36c
_LIT4: .word data_0219d388
_LIT5: .word data_0219b330
