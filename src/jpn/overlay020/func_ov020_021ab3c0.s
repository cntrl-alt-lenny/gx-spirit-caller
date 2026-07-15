; func_ov020_021ab3c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102bb0
        .extern data_ov020_021adf60
        .extern data_ov020_021adf80
        .extern data_ov020_021adf90
        .extern data_ov020_021adfa4
        .extern func_02001c78
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02004fcc
        .extern func_0207f774
        .extern func_0207f79c
        .extern func_0208de58
        .extern func_020a9698
        .extern func_ov020_021aaff8
        .extern func_ov020_021ab628
        .global func_ov020_021ab3c0
        .arm
func_ov020_021ab3c0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    bl func_0208de58
    mov r4, r0
    ldr r3, _LIT0
    mov r2, #0x12
    ldr r0, _LIT1
    mov r1, #0x1b
    str r2, [r3, #0x8d8]
    bl func_02001cec
    mov r0, #0x0
    bl func_02001d48
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    cmp r5, #0x0
    bge .L_7c
    ldr r0, _LIT2
    bl func_0207f79c
    ldr r0, _LIT3
    bl func_0207f774
    mov r0, #0x0
    mov r2, r0
    mov r3, r0
    mov r1, #0x2
    bl func_ov020_021ab628
    mov r0, #0x0
    bl func_ov020_021aaff8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_7c:
    add r1, sp, #0x8
    cmp r5, #0xa
    mov r0, #0x0
    mov r2, #0xc
    movge r5, #0x9
    bl Fill32
    ldr r1, _LIT4
    add r0, sp, #0x8
    add r2, r5, #0x1
    bl func_020a9698
    ldr r3, _LIT5
    mov ip, r5, lsl #0x1
    mov r0, r5, lsr #0x1f
    smull r1, lr, r3, r5
    add lr, r0, lr, asr #0x1
    add r2, r4, #0xaa0
    smull r0, r4, r3, ip
    mov r0, ip, lsr #0x1f
    mov r3, #0x5
    add r4, r0, r4, asr #0x2
    smull r0, r1, r3, lr
    sub lr, r5, r0
    mov r0, #0x1c
    mul r0, lr, r0
    add r0, r0, #0x8
    str r0, [sp]
    mov r0, #0x6c
    mul r1, r4, r0
    mov r0, #0xe
    str r0, [sp, #0x4]
    add r3, r1, #0x1
    ldr r0, _LIT1
    add r1, sp, #0x8
    bl func_02004fcc
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov020_021adf80
_LIT1: .word data_02102bb0
_LIT2: .word data_ov020_021adfa4
_LIT3: .word data_ov020_021adf90
_LIT4: .word data_ov020_021adf60
_LIT5: .word 0x66666667
