; func_ov002_0225a354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b314c
        .extern func_ov002_021b359c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4054
        .extern func_ov002_021baca8
        .extern func_ov002_021bb068
        .extern func_ov002_021be2d8
        .extern func_ov002_021c1d28
        .global func_ov002_0225a354
        .arm
func_ov002_0225a354:
    stmdb sp!, {r4, r5, r6, lr}
    mov r2, #0x0
    mov r5, r0
    mov r4, r1
    bl func_ov002_021be2d8
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT0
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT2
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT4
    mov r0, r5
    mov r1, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT5
    mov r0, r5
    mov r1, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_358
    ldr r0, _LIT6
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldr r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_358:
    ldr r2, _LIT8
    mov r0, r5
    mov r1, r4
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    rsb r6, r5, #0x1
    ldr r2, _LIT9
    mov r0, r6
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT10
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT11
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT12
    mov r0, r6
    bl func_ov002_021b359c
    cmp r0, #0x0
    beq .L_400
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021c1d28
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_400:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000015ff
_LIT1: .word 0x000014a6
_LIT2: .word 0x00001669
_LIT3: .word 0x00001443
_LIT4: .word 0x000016bf
_LIT5: .word 0x00001a79
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cf1a8
_LIT8: .word 0x000016cb
_LIT9: .word 0x0000177a
_LIT10: .word 0x00001561
_LIT11: .word 0x00001852
_LIT12: .word 0x00001318
