; func_0205a974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021007c4
        .extern data_021007c8
        .extern data_02100844
        .extern data_02100878
        .extern data_0210087c
        .extern data_02100880
        .extern data_02100884
        .extern data_0210088c
        .extern data_021008d4
        .extern data_021008dc
        .extern data_021008e4
        .extern data_021008ec
        .extern data_021008f4
        .extern data_021008fc
        .extern data_02100904
        .extern data_0210090c
        .extern data_02100920
        .extern data_02100930
        .extern data_02100940
        .extern data_0210094c
        .extern data_02100958
        .extern data_02100968
        .extern data_02100978
        .extern data_02100988
        .extern data_0210099c
        .extern func_0205ae4c
        .extern func_0205ae8c
        .extern func_0205ffc0
        .extern func_020a978c
        .global func_0205a974
        .arm
func_0205a974:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r3, _LIT0
    mov r4, r0
    sub r1, r1, r3
    cmp r1, #0x18
    addls pc, pc, r1, lsl #0x2
    b .L_2d18
    b .L_2a2c
    b .L_2d18
    b .L_2958
    b .L_2d18
    b .L_2d18
    b .L_29a0
    b .L_2a58
    b .L_2a84
    b .L_2ab0
    b .L_2d18
    b .L_2ae8
    b .L_2d18
    b .L_2b20
    b .L_2b58
    b .L_2b84
    b .L_2bb0
    b .L_2d18
    b .L_2d18
    b .L_2be4
    b .L_2c10
    b .L_2c3c
    b .L_2c68
    b .L_2c94
    b .L_2cc0
    b .L_2cec
.L_2958:
    cmp r2, #0x0
    bge .L_2974
    ldr r1, _LIT1
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_2974:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT3
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_29a0:
    cmp r2, #0x500
    beq .L_29c4
    ldr r1, _LIT4
    cmp r2, r1
    beq .L_29e0
    ldr r1, _LIT5
    cmp r2, r1
    beq .L_29fc
    b .L_2a18
.L_29c4:
    ldr r1, _LIT6
    ldr r2, _LIT7
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_29e0:
    ldr r1, _LIT6
    ldr r2, _LIT8
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_29fc:
    ldr r1, _LIT6
    ldr r2, _LIT9
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2a18:
    ldr r1, _LIT10
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_2a2c:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT11
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2a58:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT12
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2a84:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT13
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2ab0:
    mov r0, r2, asr #0x3
    add r2, r2, r0, lsr #0x1c
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x4
    bl func_020a978c
    ldr r1, _LIT14
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2ae8:
    mov r0, r2, asr #0x1
    add r2, r2, r0, lsr #0x1e
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x2
    bl func_020a978c
    ldr r1, _LIT15
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2b20:
    mov r0, r2, asr #0x1
    add r2, r2, r0, lsr #0x1e
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x2
    bl func_020a978c
    ldr r1, _LIT16
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2b58:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT17
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2b84:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT18
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2bb0:
    ldr r1, _LIT2
    cmp r2, #0x0
    movne r2, #0x1
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT19
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2be4:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT20
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2c10:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT21
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2c3c:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT22
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2c68:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT23
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2c94:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT24
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2cc0:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT25
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2cec:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a978c
    ldr r1, _LIT26
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2d30
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_2d18:
    ldr r1, _LIT27
    mov r0, r4
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_2d30:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000706
_LIT1: .word data_0210090c
_LIT2: .word data_021007c4
_LIT3: .word data_02100844
_LIT4: .word 0x00000501
_LIT5: .word 0x00000502
_LIT6: .word data_02100884
_LIT7: .word data_02100878
_LIT8: .word data_0210087c
_LIT9: .word data_02100880
_LIT10: .word data_02100920
_LIT11: .word data_0210088c
_LIT12: .word data_02100930
_LIT13: .word data_02100940
_LIT14: .word data_0210094c
_LIT15: .word data_02100958
_LIT16: .word data_02100968
_LIT17: .word data_02100978
_LIT18: .word data_02100988
_LIT19: .word data_0210099c
_LIT20: .word data_021008d4
_LIT21: .word data_021008dc
_LIT22: .word data_021008e4
_LIT23: .word data_021008ec
_LIT24: .word data_021008f4
_LIT25: .word data_021008fc
_LIT26: .word data_02100904
_LIT27: .word data_021007c8
