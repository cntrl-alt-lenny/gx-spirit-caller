; func_ov002_0222b864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c2
        .extern func_ov002_021b3dec
        .extern func_ov002_021d6718
        .extern func_ov002_021de820
        .extern func_ov002_021de8e4
        .global func_ov002_0222b864
        .arm
func_ov002_0222b864:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r1, [r6, #0x14]
    ldrh r2, [r6]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r4, r1, #0xff
    and r5, r0, #0xff
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_cc
    ldrh r1, [r6]
    cmp r1, #0x1700
    beq .L_64
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_8c
    add r0, r0, #0x46
    cmp r1, r0
    beq .L_78
    b .L_cc
.L_64:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de820
    b .L_cc
.L_78:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de8e4
    b .L_cc
.L_8c:
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_cc
    mov ip, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6718
.L_cc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00001703
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c2
