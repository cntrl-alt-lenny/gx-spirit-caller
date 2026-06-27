; func_ov002_02265048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_ov002_021b3dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_0226ad1c
        .global func_ov002_02265048
        .arm
func_ov002_02265048:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_7c
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0xb
    mov r4, #0x6
    bl func_ov002_021b3dec
    cmp r0, #0x0
    rsb r0, r5, #0x1
    mov r1, #0x1800
    mvn r2, #0x0
    movne r4, #0x7
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldr r0, _LIT2
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    movne r4, #0x5
    ldr r1, [r0, r2]
    cmp r1, r4
    bls .L_7c
    mov r0, r5
    sub r1, r1, r4
    bl func_ov002_0226ad1c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_7c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001401
_LIT1: .word 0x0000159f
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
